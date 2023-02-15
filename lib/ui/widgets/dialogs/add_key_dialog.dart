import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graph/controller/input_form_controller.dart';
import 'package:graph/model/input_model.dart';
import 'package:graph/ui/widgets/input_text_field.dart';

class AddKeyDialog extends ConsumerWidget {
  const AddKeyDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputStateNotifier = ref.read(inputControllerProvider.notifier);
    final inputState = ref.watch(inputControllerProvider);

    return AlertDialog(
      icon: const Icon(
        Icons.key,
        size: 50,
      ),
      title: const Text("Add your OpenAI API Key"),
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
            inputStateNotifier.onCancelApiKey();
            Navigator.of(context).pop();
          },
        ),
        inputState.apiKey == ''
            ? const TextButton(
                onPressed: null,
                child: Text('Submit'),
              )
            : inputState == inputStateNotifier.previousState
                ? const TextButton(
                    onPressed: null,
                    child: Text('Submit'),
                  )
                : TextButton(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    child: const Text('Submit'),
                  ),
      ],
    );
  }
}

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.inputValue,
    required this.inputState,
    required this.previousState,
    required this.onChanged,
    required this.onCancel,
    required this.icon,
    required this.title,
    required this.hintText,
    this.maxLength,
    this.minLines
  });

  final String inputValue;
  final InputModel inputState;
  final InputModel previousState;
  final void Function(String value) onChanged;
  final void Function() onCancel;
  final Widget icon;
  final String title;
  final String hintText;
  final int? maxLength;
  final int? minLines;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: icon,
      title: Text(title),
      content: SingleChildScrollView(
        child: Column(
          children: [
            InputTextField(
                initialValue: inputValue,
                hintText: hintText,
                onChanged: onChanged),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text("Cancel"),
          onPressed: () {
            onCancel();
            Navigator.of(context).pop();
          },
        ),
        inputValue == ''
            ? const TextButton(
                onPressed: null,
                child: Text('Submit'),
              )
            : inputState == previousState
                ? const TextButton(
                    onPressed: null,
                    child: Text('Submit'),
                  )
                : TextButton(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    child: const Text('Submit'),
                  ),
      ],
    );
  }
}
