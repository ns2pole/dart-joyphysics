import 'package:flutter/material.dart';
import '../fields/wave_fields.dart';
import '../utils/coordinate_transformer.dart';

class ThinFilmWavelengthRow {
  final int lambdaNm;
  final Color color;

  const ThinFilmWavelengthRow({required this.lambdaNm, required this.color});
}

class ThinFilmStackPainter extends CustomPainter {
  ThinFilmStackPainter({
    required this.time,
    required this.n,
    required this.thicknessLInternal,
    required this.scale,
    required this.rows,
    this.scaleFactor = 250.0,
  });

  final double time;
  final double n;
  final double thicknessLInternal;
  final double scale;
  final List<ThinFilmWavelengthRow> rows;
  final double scaleFactor;

  static const double _worldRange = 5.0; // x in [-5,5] like WaveLinePainter

  @override
  void paint(Canvas canvas, Size size) {
    // Background
    canvas.drawRect(Offset.zero & size, Paint()..color = const Color(0xFFF7F7FB));

    final transformer = WaveCoordinateTransformer(
      size: size,
      scale: scale,
      is3D: false,
    );
    final center = transformer.center;
    final unitScale = transformer.unitScale;

    // Geometry for stacked rows
    final rowCount = rows.isEmpty ? 1 : rows.length;
    final rowHeight = size.height / rowCount;
    final ampPx = rowHeight * 0.28; // reduce amplitude to fit 7 rows comfortably
    final topPadPx = 10.0;

    double xToScreen(double xWorld) => center.dx + xWorld * unitScale;

    double rowBaselineY(int rowIndex) {
      // Keep some padding and center within each band.
      final y = (rowIndex + 0.5) * rowHeight;
      return y.clamp(topPadPx, size.height - topPadPx);
    }

    double valueToScreenY(int rowIndex, double value) {
      final base = rowBaselineY(rowIndex);
      return base - value * ampPx;
    }

    // Slab overlay (0..L)
    final slabPaint = Paint()
      ..color = Colors.yellow.withOpacity(0.12)
      ..style = PaintingStyle.fill;
    final slabBorder = Paint()
      ..color = Colors.orange.withOpacity(0.25)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final slabX0 = xToScreen(0.0);
    final slabX1 = xToScreen(thicknessLInternal.clamp(-_worldRange, _worldRange));
    final slabRect = Rect.fromLTRB(
      slabX0,
      0,
      slabX1,
      size.height,
    );
    canvas.drawRect(slabRect, slabPaint);
    canvas.drawRect(slabRect, slabBorder);

    // Grid baselines (subtle)
    final gridPaint = Paint()
      ..color = Colors.black.withOpacity(0.08)
      ..strokeWidth = 1.0;
    for (int i = 0; i < rowCount; i++) {
      final y = rowBaselineY(i);
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    // Styles
    Paint componentPaint(Color c) => Paint()
      ..color = c.withOpacity(0.22)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint combinedPaint(Color c) => Paint()
      ..color = c.withOpacity(0.92)
      ..strokeWidth = 2.8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Label style
    const labelStyle = TextStyle(
      color: Colors.black87,
      fontSize: 12,
      fontWeight: FontWeight.w700,
      fontFamily: 'Courier',
    );

    // Sampling
    const samples = 380;
    const step = (_worldRange * 2) / samples;

    // Draw each row
    for (int rowIndex = 0; rowIndex < rowCount; rowIndex++) {
      final row = rows[rowIndex];
      final lambdaInternal = row.lambdaNm / scaleFactor;

      final field = ThinFilmInterferenceField(
        lambda: lambdaInternal,
        periodT: 1.0,
        n: n,
        thicknessL: thicknessLInternal,
        mode: ThinFilmMode.combinedReflected,
        amplitude: 0.35, // slightly reduced for stack view
      );

      // Label (left)
      final labelSpan = TextSpan(text: '${row.lambdaNm}', style: labelStyle);
      final tp = TextPainter(text: labelSpan, textDirection: TextDirection.ltr)
        ..layout();
      tp.paint(canvas, Offset(8, rowBaselineY(rowIndex) - tp.height / 2));

      // Collect paths
      final pathIncident = Path();
      final pathR1 = Path();
      final pathR2 = Path();
      final pathCombined = Path();

      bool started = false;
      for (int i = 0; i <= samples; i++) {
        final x = -_worldRange + i * step;
        final comps = field.getComponents(
          x,
          0,
          time,
          const {'incident', 'reflected1', 'reflected2', 'combinedReflected'},
        );

        double vIncident = 0.0;
        double vR1 = 0.0;
        double vR2 = 0.0;
        double vCombined = 0.0;
        for (final c in comps) {
          switch (c.id) {
            case 'incident':
              vIncident = c.value;
              break;
            case 'reflected1':
              vR1 = c.value;
              break;
            case 'reflected2':
              vR2 = c.value;
              break;
            case 'combinedReflected':
              vCombined = c.value;
              break;
          }
        }

        final sx = xToScreen(x);
        final yi = valueToScreenY(rowIndex, vIncident);
        final yr1 = valueToScreenY(rowIndex, vR1);
        final yr2 = valueToScreenY(rowIndex, vR2);
        final yc = valueToScreenY(rowIndex, vCombined);

        if (!started) {
          pathIncident.moveTo(sx, yi);
          pathR1.moveTo(sx, yr1);
          pathR2.moveTo(sx, yr2);
          pathCombined.moveTo(sx, yc);
          started = true;
        } else {
          pathIncident.lineTo(sx, yi);
          pathR1.lineTo(sx, yr1);
          pathR2.lineTo(sx, yr2);
          pathCombined.lineTo(sx, yc);
        }
      }

      final cp = componentPaint(row.color);
      canvas.drawPath(pathIncident, cp);
      canvas.drawPath(pathR1, cp);
      canvas.drawPath(pathR2, cp);
      canvas.drawPath(pathCombined, combinedPaint(row.color));
    }
  }

  @override
  bool shouldRepaint(covariant ThinFilmStackPainter oldDelegate) {
    return oldDelegate.time != time ||
        oldDelegate.n != n ||
        oldDelegate.thicknessLInternal != thicknessLInternal ||
        oldDelegate.scale != scale ||
        oldDelegate.scaleFactor != scaleFactor ||
        oldDelegate.rows != rows;
  }
}

