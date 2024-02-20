import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String title;

  final Function onChanged;
  const TextFieldCustom({
    super.key,
    required this.title,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(height: 5),
          SizedBox(
            height: 55,
            child: TextField(
              textAlignVertical: TextAlignVertical.top,
              onChanged: (value) => onChanged(value),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
