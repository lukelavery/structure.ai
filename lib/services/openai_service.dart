import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graph/prompt.dart';
import 'package:graph/utils/exceptions/custom_exception.dart';
import 'package:http/http.dart';

final openAiServiceProvider =
    Provider.autoDispose<OpenAiService>((ref) => OpenAiService());

class OpenAiService {
  final Client _client = Client();
  final Uri _completionUrl = Uri.https('api.openai.com', '/v1/chat/completions');

  // Future<String?> generateCompletion(
  //     {required String prompt, required String apiKey}) async {
  //   try {
  //     final Response response = await _client.post(
  //       _completionUrl,
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer $apiKey',
  //       },
  //       body: jsonEncode({
  //         'model': 'text-davinci-003',
  //         'prompt': stlssPrompt(prompt),
  //         'max_tokens': 800,
  //         'temperature': 0.1,
  //         'top_p': 1,
  //         'n': 1,
  //         'stream': false,
  //         'logprobs': null,
  //         // 'stop': '\n'
  //         "frequency_penalty": 0,
  //         "presence_penalty": 0
  //       }),
  //     );

  //     print(response.statusCode);

  //     if (response.statusCode == 401) {
  //       throw const CustomException(message: 'Invalid API Key');
  //     }

  //     if (response.statusCode == 404) {
  //       throw const CustomException(message: 'Invalid API Key');
  //     }

  //     if (response.statusCode == 429) {
  //       throw const CustomException(message: 'Rate limit reached for requests');
  //     }

  //     if (response.statusCode == 500) {
  //       throw const CustomException(
  //           message: 'The server had an error while processing your request.');
  //     }

  //     Map<String, dynamic> decodeResponse = jsonDecode(response.body);
  //     return decodeResponse['choices'][0]['text'];
  //   } on Error catch (e) {
  //     print(e);
  //   }
  // }

  Future<String?> generateChatCompletion(
      {required String prompt, required String apiKey}) async {
    try {
      final Response response = await _client.post(
        _completionUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
            "model": "gpt-3.5-turbo",
            "messages": stlssPrompt(prompt),
          
        }),
      );

      print(response.body);

      print(response.statusCode);

      if (response.statusCode == 401) {
        throw const CustomException(message: 'Invalid API Key');
      }

      if (response.statusCode == 404) {
        throw const CustomException(message: 'Invalid API Key');
      }

      if (response.statusCode == 429) {
        throw const CustomException(message: 'Rate limit reached for requests');
      }

      if (response.statusCode == 500) {
        throw const CustomException(
            message: 'The server had an error while processing your request.');
      }

      Map<String, dynamic> decodeResponse = jsonDecode(response.body);
      return decodeResponse['choices'][0]['message']['content'];
    } on Error catch (e) {
      print(e);
    }
  }
}
