import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FrequencyMeasureWidget extends StatefulWidget {
  const FrequencyMeasureWidget({Key? key}) : super(key: key);

  @override
  State<FrequencyMeasureWidget> createState() => _FrequencyMeasureWidgetState();
}

class _FrequencyMeasureWidgetState extends State<FrequencyMeasureWidget> {
  static const _frequencyChannel = MethodChannel('com.joyphysics.frequency/mic');

  double? _frequency;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startMic();
  }

  Future<void> _startMic() async {
    try {
      await _frequencyChannel.invokeMethod('start');
      _timer = Timer.periodic(const Duration(milliseconds: 100), (_) async {
        final freq = await _frequencyChannel.invokeMethod('getFrequency');
        setState(() {
          _frequency = (freq as double?) ?? 0.0;
        });
      });
    } on PlatformException catch (e) {
      print('Failed to start mic: ${e.message}');
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _frequencyChannel.invokeMethod('stop');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        _frequency == null
            ? '周波数計測中...'
            : '周波数: ${_frequency!.toStringAsFixed(1)} Hz',
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}



// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class FrequencyMeasureWidget extends StatefulWidget {
//   const FrequencyMeasureWidget({Key? key}) : super(key: key);

//   @override
//   State<FrequencyMeasureWidget> createState() => _FrequencyMeasureWidgetState();
// }

// class _FrequencyMeasureWidgetState extends State<FrequencyMeasureWidget> {
//   static const _frequencyChannel = MethodChannel('com.joyphysics.frequency/mic');

//   double? _frequency;
//   Timer? _timer;

//   @override
//   void initState() {
//     super.initState();
//     _startMic();
//   }

//   Future<void> _startMic() async {
//     try {
//       await _frequencyChannel.invokeMethod('start');
//       _timer = Timer.periodic(const Duration(milliseconds: 100), (_) async {
//         final freq = await _frequencyChannel.invokeMethod('getFrequency');
//         setState(() {
//           _frequency = (freq as double?) ?? 0.0;
//         });
//       });
//     } on PlatformException catch (e) {
//       print('Failed to start mic: ${e.message}');
//     }
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     _frequencyChannel.invokeMethod('stop');
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         _frequency == null
//             ? '周波数計測中...'
//             : '周波数: ${_frequency!.toStringAsFixed(1)} Hz',
//         style: const TextStyle(fontSize: 24),
//       ),
//     );
//   }
// }
