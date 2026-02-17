import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:joyphysics/experiment/PhysicsAnimationBase.dart';
import '../fields/wave_fields.dart';
import '../painters/wave_line_painter.dart';
import '../widgets/wave_slider.dart';

final beating1D = createWaveVideo(
  title: "うなり",
  latex: r"""
  <div class="common-box">うなり（beating）</div>
  <p>振動数がわずかに異なる2つの波を重ね合わせると、振幅が周期的に増減する現象が見られます。これを<b>うなり</b>と呼びます。</p>
  <p>（例）同じ波長 $\lambda$ を持つ2つの正弦波 $y_1, y_2$ の重ね合わせ</p>
  <p>$$y = y_1 + y_2$$</p>
  """,
  simulation: Beating1DSimulation(),
);

class Beating1DSimulation extends WaveSimulation {
  Beating1DSimulation()
      : super(
          title: "うなり",
          is3D: false,
          formula: const Column(
            children: [
              FormulaDisplay(r'y = y_1 + y_2'),
            ],
          ),
        );

  @override
  Map<String, double> get initialParameters => getInitialParamsWithObs(
        baseParams: {
          'amplitude': 0.5,
          'lambda': 4.0,
          'periodT1': 1.6,
          'periodT2': 1.8,
          'phase2': 0.0,
        },
        obsX: 0.0,
      );

  @override
  Set<String> get initialActiveIds => {'wave1', 'wave2', 'total'};

  @override
  List<Widget> buildControls(context, params, updateParam) {
    return [
      Text(
        'T1=${params['periodT1']!.toStringAsFixed(2)}, T2=${params['periodT2']!.toStringAsFixed(2)}',
        style: const TextStyle(fontSize: 12),
      ),
      WaveParameterSlider(
        label: '振幅 A',
        value: params['amplitude']!,
        min: 0.1,
        max: 1.0,
        onChanged: (v) => updateParam('amplitude', v),
      ),
      WaveParameterSlider(
        label: '波長 λ',
        value: params['lambda']!,
        min: 1.0,
        max: 8.0,
        onChanged: (v) => updateParam('lambda', v),
      ),
      WaveParameterSlider(
        label: '周期 T1',
        value: params['periodT1']!,
        min: 0.6,
        max: 4.0,
        onChanged: (v) => updateParam('periodT1', v),
      ),
      WaveParameterSlider(
        label: '周期 T2',
        value: params['periodT2']!,
        min: 0.6,
        max: 4.0,
        onChanged: (v) => updateParam('periodT2', v),
      ),
      WaveParameterSlider(
        label: '位相差 φ2',
        value: params['phase2']!,
        min: 0.0,
        max: 2 * math.pi,
        onChanged: (v) => updateParam('phase2', v),
      ),
      ...buildObsSliders(params, updateParam, is2D: false, labelX: 'a'),
    ];
  }

  @override
  Widget buildExtraControls(context, activeIds, updateActiveIds) {
    return Wrap(
      spacing: 8,
      children: [
        buildChip('波1', 'wave1', Colors.purpleAccent, activeIds, updateActiveIds, fontSize: 14),
        buildChip('波2', 'wave2', Colors.greenAccent, activeIds, updateActiveIds, fontSize: 14),
        buildChip('合成', 'total', Colors.blueAccent, activeIds, updateActiveIds, fontSize: 14),
      ],
    );
  }

  @override
  Widget buildAnimation(context, time, azimuth, tilt, scale, params, activeIds) {
    final field = BeatingField(
      amplitude: params['amplitude']!,
      lambda: params['lambda']!,
      periodT1: params['periodT1']!,
      periodT2: params['periodT2']!,
      phase2: params['phase2']!,
    );

    return CustomPaint(
      size: Size.infinite,
      painter: WaveLinePainter(
        time: time,
        field: field,
        surfaceColor: Colors.blue,
        showTicks: true,
        activeComponentIds: activeIds,
        scale: scale,
        markers: [
          getObsMarker(params, label: '観測点 a'),
        ],
      ),
    );
  }
}

class BeatingField extends WaveField {
  final double amplitude;
  final double lambda;
  final double periodT1;
  final double periodT2;
  final double phase2;

  const BeatingField({
    required this.amplitude,
    required this.lambda,
    required this.periodT1,
    required this.periodT2,
    required this.phase2,
  });

  double _phase(double x, double t, double periodT, double phaseOffset) {
    // y = A sin( 2π (t/T - x/λ) + φ )
    return 2 * math.pi * (t / periodT - x / lambda) + phaseOffset;
  }

  @override
  double phase(double x, double y, double t) {
    // total phase is not meaningful; implement z directly
    return 0.0;
  }

  double _z1(double x, double t) => amplitude * math.sin(_phase(x, t, periodT1, 0.0));
  double _z2(double x, double t) => amplitude * math.sin(_phase(x, t, periodT2, phase2));

  @override
  double z(double x, double y, double t) => _z1(x, t) + _z2(x, t);

  @override
  List<WaveComponent> getComponents(double x, double y, double t, Set<String> activeIds) {
    final comps = <WaveComponent>[];
    if (activeIds.contains('wave1')) {
      comps.add(WaveComponent(id: 'wave1', label: '波1', color: Colors.purpleAccent, value: _z1(x, t)));
    }
    if (activeIds.contains('wave2')) {
      comps.add(WaveComponent(id: 'wave2', label: '波2', color: Colors.greenAccent, value: _z2(x, t)));
    }
    if (activeIds.contains('total')) {
      comps.add(WaveComponent(id: 'total', label: '合成', color: Colors.blueAccent, value: z(x, y, t)));
    }
    return comps;
  }

  @override
  bool operator ==(Object other) =>
      other is BeatingField &&
      other.amplitude == amplitude &&
      other.lambda == lambda &&
      other.periodT1 == periodT1 &&
      other.periodT2 == periodT2 &&
      other.phase2 == phase2;

  @override
  int get hashCode => Object.hash(amplitude, lambda, periodT1, periodT2, phase2);
}

