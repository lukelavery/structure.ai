<h1 align="center">
  <br>
  <img src="https://github.com/lukelavery/structure.ai/blob/main/assets/images/logo.png" alt="structure.ai" width="200">
  <br>
  structure.ai
  <br>
</h1>

<div align="center">
  <h4>A web app that creates diagrams from unstructured legal text.</h4>
  <a href="https://lukelavery.github.io/structure.ai-demo" >View Demo</a>
</div>

## Description
* Structure.ai is a web application that automates the creation of flowcharts from unstructured legal text using natural language processing (NLP) technology.
* The software uses ChatGPT's API to extract legal relationships from text and converts to a structured format which can be displayed as a diagram.
* The full prompt passed to the GPT model can be read at `lib/prompt.dart`.

## How to use

1. Add your OpenAI API key.
2. Input any text describing a company structure.
3. Submit.

## Examples

### Input

> In their latest 2018 annual report (10-K). Alphabet Inc. disclosed that it owns four significant subsidiaries. They were: Google LLC,
XXVI Holdings Inc., Google Ireland Holdings and
Alphabet Capital US LLC. <br> <br>
> Alphabet Holding LLC is a holding company that is a direct subsidiary of XXVI Holdings, Inc. It is focused mainly on managing Google/Alphabet investments. Both Alphabet investment managing firms CapitalG and GV are housed under this holding.

### Output

<div align="center">
  <img src="https://github.com/lukelavery/structure.ai/blob/main/assets/images/example_output_1.png">
</div>

### Input

> As of its latest 2020 annual report, some of its significant subsidiaries include Berkshire Hathaway Energy and Berkshire Hathaway Automotive. <br> <br>
> Berkshire Hathaway Energy is a subsidiary of Berkshire Hathaway that owns and operates several energy-related businesses, including PacifiCorp, NV Energy, and Northern Powergrid. PacifiCorp, in turn, has several subsidiaries, including Pacific Power and Rocky Mountain Power. NV Energy has several subsidiaries, including Sierra Pacific Power and Nevada Power Company. <br> <br>
> Berkshire Hathaway Automotive is a subsidiary of Berkshire Hathaway that owns and operates several automotive dealerships across the United States. One of its subsidiaries, Berkshire Hathaway Automotive Group, owns and operates several automotive dealerships across multiple states, including Texas, California, and Florida.

### Output

<div align="center">
  <img src="https://github.com/lukelavery/structure.ai/blob/main/assets/images/example_output_2.png">
</div>

## Credits

This software uses the following open source packages:

- [Flutter](https://flutter.dev/)
- [Riverpod](https://riverpod.dev/)
- [Graphite](https://pub.dev/packages/graphite)
