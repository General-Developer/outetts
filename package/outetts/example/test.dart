import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:outetts/ffi/bindings.dart';

void main(List<String> args) {
  OutettsSharedBindingsByGeneralDeveloper
      outettsSharedBindingsByGeneralDeveloper =
      OutettsSharedBindingsByGeneralDeveloper(
    DynamicLibrary.open("liboutetts.so"),
  );

  final String modelVocoderPath =
      "/home/galaxeus/Documents/big-data/wavtokenizer/WavTokenizer-Large-75-F16.gguf";
  final String modelPath =
      "/home/galaxeus/Documents/big-data/outetts/OuteTTS-0.2-500M-Q8_0.gguf";

  final String text = """
Outetts Is Library for generate neural Text To Speech on Edge Device Without api key or internet quota created by General Developer
"""
      .trim();
  final String outputPath = "audio.wav";

  final options = calloc<outetts_options_t>();
  options.ref.n_threads = 4;
  options.ref.text = text.toNativeUtf8().cast<Char>();
  options.ref.output_path = outputPath.toNativeUtf8().cast<Char>();
  options.ref.model_path = modelPath.toNativeUtf8().cast<Char>();
  options.ref.model_vocoder_path = modelVocoderPath.toNativeUtf8().cast<Char>();
  {
    outettsSharedBindingsByGeneralDeveloper.outetts_inference(options.ref);
  }
}
