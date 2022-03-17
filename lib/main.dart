import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('2022-02-03', 12, 23, 44, 120, 4.5),
      _ChartData('2022-02-04', 33, 73, 14, 220, 4.2),
      _ChartData('2022-02-05', 10, 13, 54, 150, 4.3),
      _ChartData('2022-02-06', 45, 67, 46, 80, 2.5),
      _ChartData('2022-02-07', 103, 78, 15, 320, 5.5),
      _ChartData('2022-02-08', 103, 78, 15, 320, 5.5),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chart Example'),
      ),
      body: SfCartesianChart(
        enableAxisAnimation: true,
        primaryXAxis: CategoryAxis(autoScrollingMode: AutoScrollingMode.end, autoScrollingDelta: 4),
        primaryYAxis: NumericAxis(minimum: 0, maximum: 110, interval: 10),
        tooltipBehavior: _tooltip,
        series: <ChartSeries<_ChartData, String>>[
          ColumnSeries<_ChartData, String>(
            dataSource: data,
            xValueMapper: (_ChartData data, _) => data.date,
            yValueMapper: (_ChartData data, _) => data.blue,
            name: 'Blue',
            color: Colors.blue,
          ),
          ColumnSeries<_ChartData, String>(
            dataSource: data,
            xValueMapper: (_ChartData data, _) => data.date,
            yValueMapper: (_ChartData data, _) => data.pink,
            name: 'Pink',
            color: Colors.pink,
          ),
          ColumnSeries<_ChartData, String>(
            dataSource: data,
            xValueMapper: (_ChartData data, _) => data.date,
            yValueMapper: (_ChartData data, _) => data.green,
            name: 'Green',
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(
    this.date,
    this.blue,
    this.green,
    this.pink,
    this.met,
    this.jogging,
  );

  final String date;
  final double blue;
  final double green;
  final double pink;
  final double met;
  final double jogging;
}
