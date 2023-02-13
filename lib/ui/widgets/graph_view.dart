import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graph/controller/graph_controller.dart';
import 'package:graphite/graphite.dart';

class GraphView extends ConsumerWidget {
  const GraphView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphState = ref.watch(graphControllerProvider);

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
              const Text(
                'Add a new prompt to get started.',
                style: TextStyle(
                    fontFamily: 'Montserrat', fontWeight: FontWeight.w500),
              ),
              const Spacer()
            ],
          ));
        }
      },
      error: (error, stackTrace) => Text(error.toString()),
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
