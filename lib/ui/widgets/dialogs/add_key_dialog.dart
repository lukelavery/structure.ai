import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graph/controller/input_form_controller.dart';
import 'package:graph/ui/widgets/input_text_field.dart';

class AddKeyDialog extends ConsumerWidget {
  const AddKeyDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputStateNotifier = ref.read(inputControllerProvider.notifier);
    final inputState = ref.read(inputControllerProvider);

    return AlertDialog(
      title: const Text("Input"),
      content: SingleChildScrollView(
        child: Column(
          children: [
            InputTextField(
              initialValue: inputState.apiKey,
              hintText: 'OpenAI API Key',
              onChanged: inputStateNotifier.onChangedApiKey,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          onPressed: () async {
            Navigator.pop(context);
          },
          child: const Text('Submit'),
        )
      ],
    );
  }
}
