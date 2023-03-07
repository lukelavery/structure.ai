import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graph/controller/input_form_controller.dart';
import 'package:graph/ui/widgets/input_text_field.dart';

class InputDialog extends ConsumerWidget {
  const InputDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputStateNotifier = ref.read(inputControllerProvider.notifier);
    final inputState = ref.watch(inputControllerProvider);

    return AlertDialog(
      // icon: Image.asset('assets/images/openai-icon.png', height: 50,),
      icon: SvgPicture.asset(
        'assets/images/openai.svg',
        height: 50,
      ),
      title: const Text("Add a prompt"),
      content: SingleChildScrollView(
        child: Column(
          children: [
            InputTextField(
              maxLength: 1000,
              initialValue: inputState.input,
              hintText: 'Prompt',
              onChanged: inputStateNotifier.onChangedInput,
              minLines: 5,
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
        inputState.input == ''
            ? const TextButton(
                onPressed: null,
                child: Text('Submit'),
              )
            : TextButton(
                onPressed: () async {
                  inputStateNotifier.onSubmit();
                  Navigator.pop(context);
                },
                child: const Text('Submit'),
              ),
      ],
    );
  }
}
