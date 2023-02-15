import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graph/controller/graph_controller.dart';
import 'package:graph/controller/input_form_controller.dart';
import 'package:graph/services/openai_service.dart';
import 'package:graph/utils/exceptions/custom_exception.dart';
import 'package:graphite/graphite.dart';

class GraphView extends ConsumerWidget {
  const GraphView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphState = ref.watch(graphControllerProvider);
    final inputState = ref.watch(inputControllerProvider);

    return graphState.when(
      data: (data) {
        if (data.isNotEmpty) {
          return DirectGraph(
            list: data,
            defaultCellSize: const Size(100.0, 100.0),
            cellPadding: const EdgeInsets.all(20),
            orientation: MatrixOrientation.Vertical,
          );
        } else {
          return Center(
              child: Column(
            children: [
              const Spacer(),
              Image.asset(
                "assets/images/organization.png",
                scale: 9,
              ),
              const SizedBox(
                height: 10,
              ),
              inputState.apiKey == ''
                  ? const Text(
                      'Add your OpenAI API key to get started.',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500),
                    )
                  : const Text(
                      'Add a new prompt to generate a structure.',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500),
                    ),
              const Spacer()
            ],
          ));
        }
      },
      error: (error, stackTrace) {
        final customException = error as CustomException;
        return Center(
            child: Column(
          children: [
            const Spacer(),
            const Icon(Icons.error),
            const SizedBox(
              height: 10,
            ),
            Text(
              customException.message,
              style: const TextStyle(
                  fontFamily: 'Montserrat', fontWeight: FontWeight.w500),
            ),
            const Spacer()
          ],
        ));
      },
      loading: () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
