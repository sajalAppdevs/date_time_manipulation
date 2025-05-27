import 'package:date_time_manipulation/date_time_manipulation.dart';
import 'package:flutter/material.dart';


void main() => runApp(const DateTimeExampleApp());

class DateTimeExampleApp extends StatefulWidget {
  const DateTimeExampleApp({super.key});

  @override
  State<DateTimeExampleApp> createState() => _DateTimeExampleAppState();
}

class _DateTimeExampleAppState extends State<DateTimeExampleApp> {
  DateTime? _pickedDate;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Date & Time Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('Date & Time Package')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const TimeNowWidget(),
              const SizedBox(height: 20),
              PrettyDatePicker(
                onDateSelected: (date) {
                  setState(() => _pickedDate = date);
                },
              ),
              if (_pickedDate != null) ...[
                const SizedBox(height: 16),
                Text(
                  "Relative: ${RelativeTimeFormatter.timeAgo(_pickedDate!)}",
                  style: const TextStyle(fontSize: 18),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
