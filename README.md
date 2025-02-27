# Outetts
 
**Outetts** Is Library for generate neural Text To Speech on Edge Device Without api key or internet quota

[![](https://raw.githubusercontent.com/General-Developer/outetts/refs/heads/main/assets/demo_background.png)](https://youtu.be/drlqUwJEOg4)

https://github.com/user-attachments/assets/5f0e9085-b0ff-49d6-bdac-69c8c2edc6d9

[![](https://raw.githubusercontent.com/globalcorporation/.github/main/.github/logo/powered.png)](https://www.youtube.com/@Global_Corporation)

**Copyright (c) 2024 GLOBAL CORPORATION - GENERAL DEVELOPER**

## 📚️ Docs

1. [Documentation](https://youtube.com/@GENERAL_DEV)
2. [Youtube](https://youtube.com/@GENERAL_DEV)
3. [Telegram Support Group](https://t.me/DEVELOPER_GLOBAL_PUBLIC)
4. [Contact Developer](https://github.com/General-Developer) (check social media or readme profile github)

## 🔖️ Features

1. [x] 📱️ **Cross Platform** support (Device, Edge Severless functions)
2. [x] 📜️ **Standarization** Style Code
3. [x] ⌨️ **Cli** (Terminal for help you use this library or create project)
4. [x] 🔥️ **Api** (If you developer bot / userbot you can use this library without interact cli just add library and use 🚀️)
5. [x] 🧩️ **Customizable Extension** (if you want add extension so you can more speed up on development)
6. [x] ✨️ **Pretty Information** (user friendly for newbie)
 
## ❔️ Fun Fact

- **This library 100%** use on every my create project (**App, Server, Bot, Userbot**)
 
## 📈️ Proggres
 
- **10-02-2025**
  Starting **Release Stable** With core Features

## Resources

1. [MODEL TOKENIZER](https://huggingface.co/ggml-org)
2. [MODEL TEXT TO SPEECH](https://huggingface.co/OuteAI/)

### 📥️ Install Library

1. **Dart**

```bash
dart pub add outetts
```

2. **Flutter**

```bash
flutter pub add outetts_flutter ggml_library_flutter llama_library_flutter
```

## 🚀️ Quick Start

Example Quickstart script minimal for insight you or make you use this library because very simple

```dart
import 'dart:io';
import 'package:outetts/outetts.dart';

void main(List<String> args) async {
  print("start");

  final String modelVocoderPath = "../../../../../big-data/wavtokenizer/WavTokenizer-Large-75-F16.gguf";
  final String modelPath = "../../../../../big-data/outetts/OuteTTS-0.2-500M-Q8_0.gguf";

  final String text = """
Outetts Is Library for generate neural Text To Speech on Edge Device Without api key or internet quota created by General Developer.

**Copyright (c) 2024 GLOBAL CORPORATION - GENERAL DEVELOPER**

"""
      .trim();
  final String outputPath = "audio.wav";

  final Outetts outetts = Outetts();
  await outetts.ensureInitialized();
  outetts.loadModel(
    modelPath: modelPath,
    modelVocoderPath: modelVocoderPath,
  );
  await outetts.textToSpeech(
    numberThreads: 1,
    text: text,
    ouputPath: outputPath,
  );
  exit(0);
}
```

## Reference


**Copyright (c) 2024 GLOBAL CORPORATION - GENERAL DEVELOPER**

