import 'package:flutter/material.dart';

class OutputDialog extends StatelessWidget {
  const OutputDialog({super.key, required this.response});

  final String response;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Response"),
      content: SingleChildScrollView(
        child: Text(response),
      ),
      actions: [
        TextButton(
          child: const Text("Close"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
