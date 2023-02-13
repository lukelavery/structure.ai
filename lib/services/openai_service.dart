import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graph/prompt.dart';
import 'package:http/http.dart';

final openAiServiceProvider = Provider.autoDispose<OpenAiService>(
    (ref) => OpenAiService());

class OpenAiService {
  final Client _client = Client();
  final Uri _completionUrl = Uri.https('api.openai.com', '/v1/completions');

  Future<String> generateCompletion({required String prompt, required String apiKey}) async {
    final Response response = await _client.post(
      _completionUrl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'model': 'text-davinci-003',
        'prompt': stlssPrompt(prompt),
        'max_tokens': 800,
        'temperature': 0.1,
        'top_p': 1,
        'n': 1,
        'stream': false,
        'logprobs': null,
        // 'stop': '\n'
        "frequency_penalty": 0,
        "presence_penalty": 0
      }),
    );
    Map<String, dynamic> decodeResponse = jsonDecode(response.body);
    return decodeResponse['choices'][0]['text'];
  }
}