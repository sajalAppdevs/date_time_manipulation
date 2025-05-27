import 'package:flutter/material.dart';
import 'date_utils.dart';

class PrettyDatePicker extends StatelessWidget {
  final void Function(DateTime) onDateSelected;

  const PrettyDatePicker({super.key, required this.onDateSelected});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      icon: const Icon(Icons.calendar_today, color: Colors.white),
      label: const Text("Pick a Date", style: TextStyle(color: Colors.white)),
      onPressed: () async {
        final selected = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );

        if (selected != null) {
          onDateSelected(selected);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Selected: ${DateUtilsHelper.formatDate(selected)}")),
          );
        }
      },
    );
  }
}
