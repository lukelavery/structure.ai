import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graph/controller/graph_controller.dart';
import 'package:graph/model/input_model.dart';

final inputControllerProvider =
    StateNotifierProvider<InputController, InputModel>(
        (ref) => InputController(ref));

class InputController extends StateNotifier<InputModel> {
  InputController(this._ref) : super(const InputModel(apiKey: '', input: ''));

  final Ref _ref;

  void onChangedApiKey(String apiKey) {
    state = InputModel(apiKey: apiKey, input: state.input);
  }

  void onChangedInput(String input) {
    state = InputModel(apiKey: state.apiKey, input: input);
  }

  // Future<void> onSubmit() async {
  //   final response = await _ref
  //       .read(openAiServiceProvider)
  //       .generateCompletion(prompt: state.input, apiKey: state.apiKey);
  //   _ref.read(graphControllerProvider.notifier).input(response);
  // }
  void onSubmit() {
    _ref
        .read(graphControllerProvider.notifier)
        .generateResponse(prompt: state.input, apiKey: state.apiKey);
  }
}
