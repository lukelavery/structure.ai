import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graph/services/openai_service.dart';
import 'package:graph/utils/exceptions/custom_exception.dart';
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
    try {
      final response = await _ref
          .read(openAiServiceProvider)
          .generateChatCompletion(prompt: prompt, apiKey: apiKey);
      if (response != null) {
        _setGraph(response);
      }
      print("Response: $response");
    } on CustomException catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  void _setGraph(String response) {
    try {
      final nodesJson = jsonDecode(response);
      // final nodeList = NodeInput.fromJson(json);
      final nodeList = nodeInputFromJson(response);
      state = AsyncValue.data(nodeList);
    } catch (e) {
      state = AsyncValue.error(
          CustomException(message: e.toString()), StackTrace.current);
    }
  }
}
