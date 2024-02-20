import 'package:flutter/material.dart';

class NotesWidgets extends StatelessWidget {
  const NotesWidgets({
    super.key,
    required this.notes,
  });

  final String notes;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Notas',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(notes)
      ],
    );
  }
}
