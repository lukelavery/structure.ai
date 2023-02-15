import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.initialValue,
    this.maxLength,
    this.minLines,
    this.maxLines
  });

  final String hintText;
  final String initialValue;
  final void Function(String)? onChanged;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: TextFormField(
        maxLength: maxLength,
        initialValue: initialValue,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
        ),
        minLines: minLines,
        maxLines: maxLines,
      ),
    );
  }
}
