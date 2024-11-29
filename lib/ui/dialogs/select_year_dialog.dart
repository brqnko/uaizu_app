import 'package:flutter/material.dart';

class SelectYearDialog extends StatelessWidget {
  const SelectYearDialog({super.key, required this.year});

  final ValueNotifier<int> year;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Year'),
      content: SizedBox(
        width: 300,
        height: 300,
        child: YearPicker(
          firstDate: DateTime.utc(1993, 4),
          lastDate: DateTime.utc(2030, 3, 31),
          selectedDate: DateTime(year.value),
          onChanged: (DateTime date) {
            year.value = date.year;
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
