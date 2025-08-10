import 'package:flutter/material.dart';
import 'package:waveform_fft/waveform_fft.dart';
import 'package:permission_handler/permission_handler.dart';

class FrequencyMeasureWidget extends StatefulWidget {
  const FrequencyMeasureWidget({Key? key}) : super(key: key);

  @override
  State<FrequencyMeasureWidget> createState() => _FrequencyMeasureWidgetState();
}

class _FrequencyMeasureWidgetState extends State<FrequencyMeasureWidget> {
  final AudioCaptureService _audioCapture = AudioCaptureService();

  bool _isRecording = false;
  double? _peakFrequency;

  static const double sampleRate = 44100.0;
  static const int fftSize = 4096; // 分解能の目安（パケット内に反映されない場合あり）

  // EMA 平滑化係数 (0..1). 大きいほど最新値に追従。
  final double _emaAlpha = 0.3;
  double? _smoothedFrequency;

  Future<bool> _requestMicPermission() async {
    var status = await Permission.microphone.status;

    if (status.isDenied || status.isRestricted) {
      status = await Permission.microphone.request();
    }

    if (status.isPermanentlyDenied) {
      // 永久拒否状態 → ダイアログで案内
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('マイクの権限が必要です'),
          content: const Text(
            'この機能を使うにはマイクのアクセスを有効にする必要があります。'
            '設定アプリで権限を許可してください。',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('キャンセル'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                openAppSettings();
              },
              child: const Text('設定を開く'),
            ),
          ],
        ),
      );
      return false;
    }

    return status.isGranted;
  }

  // パラボリック補間（インデックスベース）
  // alpha=left, beta=center, gamma=right
  // correction = 0.5*(alpha - gamma) / (alpha - 2*beta + gamma)
  double _parabolicCorrection(double alpha, double beta, double gamma) {
    final denom = (alpha - 2 * beta + gamma);
    if (denom == 0) return 0.0;
    return 0.5 * (alpha - gamma) / denom;
  }

  void _processFrequencyData(
      List<({FrequencySpectrum spectrum, double value})> data) {
    if (data.isEmpty) return;

    final magnitudes = data.map((e) => e.value).toList();
    final int n = magnitudes.length;
    if (n < 3) return; // 補間できないので中断

    // DCノイズや端ノイズを避けるため少し端を無視する
    final int startIdx = 1;
    final int endIdx = n - 2; // inclusive search up to n-2 so we can access i+1

    // ピーク検出（端は除外）
    int peakIndex = startIdx;
    double peakValue = magnitudes[startIdx];
    for (int i = startIdx; i <= endIdx; i++) {
      if (magnitudes[i] > peakValue) {
        peakValue = magnitudes[i];
        peakIndex = i;
      }
    }

    // --- 修正ポイント: spectrum.min/max を double にキャストして扱う ---
    double refinedFreq;
    {
      // toDouble() は int でも double でも安全に使えます (num を double に)
      final double freqMin = (data[peakIndex].spectrum.min).toDouble();
      final double freqMax = (data[peakIndex].spectrum.max).toDouble();
      final double centerFreq = (freqMin + freqMax) / 2.0;

      // 隣接ビンがあれば隣りとの差をビン幅として使う
      double binWidth;
      if (peakIndex + 1 < n) {
        final double nextMin = (data[peakIndex + 1].spectrum.min).toDouble();
        final double nextMax = (data[peakIndex + 1].spectrum.max).toDouble();
        final double nextCenter = (nextMin + nextMax) / 2.0;
        binWidth = (nextCenter - centerFreq).abs();
        if (binWidth == 0) {
          // フォールバック
          binWidth = (freqMax - freqMin).abs();
        }
      } else if (peakIndex - 1 >= 0) {
        final double prevMin = (data[peakIndex - 1].spectrum.min).toDouble();
        final double prevMax = (data[peakIndex - 1].spectrum.max).toDouble();
        final double prevCenter = (prevMin + prevMax) / 2.0;
        binWidth = (centerFreq - prevCenter).abs();
        if (binWidth == 0) {
          binWidth = (freqMax - freqMin).abs();
        }
      } else {
        binWidth = (freqMax - freqMin).abs();
      }

      // 隣接3点の補間（値が小さい場合や denom==0 は correction=0）
      final double alpha = magnitudes[peakIndex - 1];
      final double beta = magnitudes[peakIndex];
      final double gamma = magnitudes[peakIndex + 1];
      final double correctionBins = _parabolicCorrection(alpha, beta, gamma);

      refinedFreq = centerFreq + correctionBins * binWidth;
    }

    // 現実的範囲に制限（0 < f < Nyquist）
    final double nyquist = sampleRate / 2.0;
    if (refinedFreq < 0) refinedFreq = 0;
    if (refinedFreq > nyquist) refinedFreq = nyquist;

    // EMA で平滑化（急に暴れるのを防ぐ）
    if (_smoothedFrequency == null) {
      _smoothedFrequency = refinedFreq;
    } else {
      _smoothedFrequency =
          _emaAlpha * refinedFreq + (1 - _emaAlpha) * _smoothedFrequency!;
    }

    setState(() {
      _peakFrequency = _smoothedFrequency;
    });
  }

  Future<void> _toggleRecording() async {
    if (_isRecording) {
      await _audioCapture.stopCapture();
    } else {
      if (!await _requestMicPermission()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('マイク権限が許可されていません')),
        );
        return;
      }
      // waveform_fft の仕様上 startCapture に fftSize を渡せない場合があるため、
      // ここではコールバックだけ渡してデータ長から分解能を推定する方式にしています。
      await _audioCapture.startCapture(
        (freqData) => _processFrequencyData(freqData),
      );
    }
    setState(() {
      _isRecording = !_isRecording;
    });
  }

  @override
  void dispose() {
    _audioCapture.stopCapture();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(24),
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "周波数測定",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Text(
                  _peakFrequency != null
                      ? "ピーク周波数: ${_peakFrequency!.toStringAsFixed(2)} Hz"
                      : "計測中...",
                  style: const TextStyle(fontSize: 18, color: Colors.black87),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _toggleRecording,
                  child: Text(_isRecording ? '停止' : '開始'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
