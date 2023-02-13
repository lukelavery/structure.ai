import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graph/services/openai_service.dart';
import 'package:graphite/core/typings.dart';

final graphControllerProvider = StateNotifierProvider.autoDispose<
    GraphController,
    AsyncValue<List<NodeInput>>>((ref) => GraphController(ref));

class GraphController extends StateNotifier<AsyncValue<List<NodeInput>>> {
  GraphController(this._ref) : super(const AsyncValue.loading()) {
    state = AsyncValue.data(nodes);
  }

  final Ref _ref;
  final List<NodeInput> nodes = [];

  Future<void> generateResponse(
      {required String prompt, required String apiKey}) async {
    state = const AsyncValue.loading();
    final response = await _ref
        .read(openAiServiceProvider)
        .generateCompletion(prompt: prompt, apiKey: apiKey);
    _updateGraph(response);
  }

  void _updateGraph(String response) {
    state = AsyncValue.data(nodeInputFromJson(response));
  }
}
