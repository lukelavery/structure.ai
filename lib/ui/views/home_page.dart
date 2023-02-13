import 'package:flutter/material.dart';
import 'package:graph/ui/widgets/buttons/add_key_button.dart';
import 'package:graph/ui/widgets/graph_view.dart';
import 'package:graph/ui/widgets/dialogs/input_dialog.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade100,
        title: Row(
          children: [
            Image.asset(
              "assets/images/organization.png",
              scale: 15,
            ),
            const SizedBox(
              width: 8,
            ),
            const Text(
              "structure.ai",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat'),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: AddKeyButton(),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                height: 800,
                width: 1000,
                child: const GraphView(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const InputDialog();
            },
          );
        },
      ),
    );
  }
}
