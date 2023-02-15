import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graph/controller/input_form_controller.dart';
import 'package:graph/model/input_model.dart';
import 'package:graph/ui/widgets/dialogs/add_key_dialog.dart';

class AddKeyButton extends ConsumerWidget {
  const AddKeyButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final InputController inputStateNotifier =
        ref.read(inputControllerProvider.notifier);
    final InputModel inputState = ref.watch(inputControllerProvider);

    return GestureDetector(
      onTap: () {
        inputStateNotifier.onEdit();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AddKeyDialog();
          },
        );
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Row(
          children: const [
            Icon(
              Icons.key,
              color: Colors.grey,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Add your OpenAI API key',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
