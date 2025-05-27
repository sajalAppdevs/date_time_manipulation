import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeNowWidget extends StatefulWidget {
  const TimeNowWidget({super.key});

  @override
  State<TimeNowWidget> createState() => _TimeNowWidgetState();
}

class _TimeNowWidgetState extends State<TimeNowWidget> {
  late String _currentTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _currentTime = _getFormattedTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _currentTime = _getFormattedTime();
      });
    });
  }

  String _getFormattedTime() {
    return DateFormat('hh:mm:ss a').format(DateTime.now());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Current Time",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              _currentTime,
              style: const TextStyle(
                  fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}