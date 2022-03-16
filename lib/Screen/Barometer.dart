import 'dart:async';
import 'dart:core';
import 'package:flutter_barometer/flutter_barometer.dart';

import 'package:flutter/material.dart';

class Barometer extends StatefulWidget {
  const Barometer({Key? key}) : super(key: key);

  @override
  State<Barometer> createState() => _BarometerState();
}

class _BarometerState extends State<Barometer> {
  List<double> _barometerValues = [0.0];

  List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];

  @override
  Widget build(BuildContext context) {
    final List<String> barometer =
        _barometerValues.map((double v) => v.toStringAsFixed(1)).toList();
    final String pressure = barometer.elementAt(0);
    flutterBarometerEvents.listen((FlutterBarometerEvent event) {
      print(event);
    });
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Pressure: $pressure'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    for (StreamSubscription<dynamic> subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }

  @override
  void initState() {
    super.initState();
    _streamSubscriptions
        .add(flutterBarometerEvents.listen((FlutterBarometerEvent event) {
      setState(() {
        _barometerValues = <double>[event.pressure];
      });
    }));
  }
}
