// String stlssPrompt(String prompt) {
//   return '''
// Given a prompt, extrapolate all legal relationships between discrete entities and provide a list of updates in JSON format. All entities require a node, direction matters.

// A node will have the format {"id": ENTITY,"next":[LIST OF OUTCOMES]}.

// Example:
// prompt: Alpha Holdings owns Beta Holdings Co. Beta Holdings has multiple subsidiaries, one is called Omega LLC.
// updates:
// [{"id":"Alpha Holdings","next":[{"outcome":"Beta Holdings Co"}]},{"id":"Beta Holdings Co","next":[{"outcome":"Omega LLC"}]},{"id":"Omega LLC","next":[]}]

// Example
// prompt: John is the CEO of Bluebook.
// updates:
// [{"id":"John","next":[{"outcome":"Bluebook"}]},{"id":"Bluebook","next":[]}]

// prompt: $prompt
// updates:
// ''';
// }

List stlssPrompt(String prompt) {
  return 
[
  {
    "role": "user",
    "content":
        "Given a prompt, extrapolate all legal relationships, ignoring duplicates, between discrete entities and provide a list of updates in Node format. All outcomes require a node, direction matters. A node will have the format {\"id\": ENTITY,\"next\":[LIST OF OUTCOMES]}. Each outcome will be the id of another node."
  },
  {
    "role": "user",
    "content":
        "Alpha Holdings owns Beta Holdings Co. Beta Holdings has multiple subsidiaries, one is called Omega LLC. Beta Holdings Co is a subsidiary of Alpha Holdings"
  },
  {
    "role": "assistant",
    "content":
        "[{\"id\":\"Alpha Holdings\",\"next\":[{\"outcome\":\"Beta Holdings Co\"}]},{\"id\":\"Beta Holdings Co\",\"next\":[{\"outcome\":\"Omega LLC\"}]},{\"id\":\"Omega LLC\",\"next\":[]}]"
  },
  {"role": "user", "content": "John is the CEO of Bluebook."},
  {
    "role": "assistant",
    "content":
        "[{\"id\":\"John\",\"next\":[{\"outcome\":\"Bluebook\"}]},{\"id\":\"Bluebook\",\"next\":[]}]"
  },
  {
    "role": "user",
    "content": prompt
  }
];
}

