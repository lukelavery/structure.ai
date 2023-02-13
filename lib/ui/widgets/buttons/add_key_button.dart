import 'package:flutter/material.dart';
import 'package:graph/ui/widgets/dialogs/add_key_dialog.dart';

class AddKeyButton extends StatelessWidget {
  const AddKeyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
              onTap: () {
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