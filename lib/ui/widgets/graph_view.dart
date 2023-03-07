import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graph/controller/graph_controller.dart';
import 'package:graph/controller/input_form_controller.dart';
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
            defaultCellSize: const Size(104.0, 104.0),
            cellPadding: const EdgeInsets.all(14),
            contactEdgesDistance: 5.0,
            orientation: MatrixOrientation.Vertical,
            // pathBuilder: customEdgePathBuilder,
            centered: false,
            nodeBuilder: (ctx, node) {
              return Card(
                color: Colors.lightBlue.shade100,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      node.id,
                      style: const TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              // color: Colors.red,
                            ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
            paintBuilder: (edge) {
              var p = Paint()
                ..color = Colors.blueGrey
                ..style = PaintingStyle.stroke
                ..strokeCap = StrokeCap.round
                ..strokeJoin = StrokeJoin.round
                ..strokeWidth = 2;
              return p;
            },
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
