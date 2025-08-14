import 'package:flutter/material.dart';
import 'package:joyphysics/dynamics/AccelerometerExperimentWidget.dart';
import 'package:joyphysics/dynamics/BarometerExperimentWidget.dart';
import 'package:joyphysics/electroMagnetism/MagnetometerExperimentWidget.dart';
import 'package:joyphysics/waves/LuxMeasurementWidget.dart';
import 'package:joyphysics/waves/FrequencyMeasureWidget.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

class SensorListView extends StatelessWidget {
  final List<Map<String, dynamic>> sensors = [
    {
      'name': '加速度センサー',
      'icon': Icons.speed,
      'widget': AccelerometerExperimentWidget(), // 例: 実装済みのウィジェット
    },
    {
      'name': '気圧センサー',
      'icon': Icons.compress,
      'widget': BarometerExperimentWidget(),
    },
    {
      'name': '磁気センサー',
      'icon': Icons.sensors,
      'widget': MagnetometerExperimentWidget(),
    },
    {
      'name': '周波数センサー(音波)',
      'icon': Icons.graphic_eq,
      'widget': FrequencyMeasureWidget(),
    },
    // WebではPlatformが使えないので先に判定
    if (!(kIsWeb || Platform.isIOS))
      {
        'name': '光センサー',
        'icon': Icons.wb_sunny,
        'widget': LuxMeasurementWidget(),
      },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('センサーを使う')),
      body: ListView.separated(
        itemCount: sensors.length,
        separatorBuilder: (_, __) => Divider(),
        itemBuilder: (context, index) {
          final sensor = sensors[index];
          return ListTile(
            leading: Icon(sensor['icon']),
            title: Text(sensor['name']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => sensor['widget']),
              );
            },
          );
        },
      ),
    );
  }
}