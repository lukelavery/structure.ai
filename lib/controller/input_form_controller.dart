import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graph/controller/graph_controller.dart';
import 'package:graph/model/input_model.dart';

final inputControllerProvider =
    StateNotifierProvider<InputController, InputModel>(
        (ref) => InputController(ref));

class InputController extends StateNotifier<InputModel> {
  InputController(this._ref) : super(const InputModel(apiKey: '', input: ''));

  final Ref _ref;
  InputModel previousState = const InputModel(apiKey: '', input: '');

  onEdit() {
    previousState = state;
  }

  void onChangedApiKey(String apiKey) {
    state = InputModel(apiKey: apiKey, input: state.input);
  }

  void onChangedInput(String input) {
    state = InputModel(apiKey: state.apiKey, input: input);
  }

  void onCancelApiKey() {
    state = previousState;
  }

  void onSubmit() {
    _ref
        .read(graphControllerProvider.notifier)
        .generateResponse(prompt: state.input, apiKey: state.apiKey);
  }
}
