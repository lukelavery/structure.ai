import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graph/controller/input_form_controller.dart';
import 'package:graph/ui/widgets/input_text_field.dart';

class InputDialog extends ConsumerWidget {
  const InputDialog({super.key});

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
              maxLength: 280,
              initialValue: inputState.input,
              hintText: 'Prompt',
              onChanged: inputStateNotifier.onChangedInput,
              // minLines: 2,
              maxLines: null,
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
          onPressed: () {
            inputStateNotifier.onSubmit();
            Navigator.pop(context);
          },
          child: const Text('Submit'),
        )
      ],
    );
  }
}
