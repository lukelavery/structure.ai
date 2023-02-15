String stlssPrompt(String prompt) {
  return '''
Given a prompt, extrapolate all legal relationships between discrete entities and provide a list of updates in JSON format. All entities require a node, direction matters.

A node will have the format {"id": ENTITY,"next":[LIST OF OUTCOMES]}.

Example:
prompt: Alpha Holdings owns Beta Holdings Co. Beta Holdings has multiple subsidiaries, one is called Omega LLC.
updates:
[{"id":"Alpha Holdings","next":[{"outcome":"Beta Holdings Co"}]},{"id":"Beta Holdings Co","next":[{"outcome":"Omega LLC"}]},{"id":"Omega LLC","next":[]}]

Example
prompt: John is the CEO of Bluebook.
updates:
[{"id":"John","next":[{"outcome":"Bluebook"}]},{"id":"Bluebook","next":[]}]

prompt: $prompt
updates:
''';
}
