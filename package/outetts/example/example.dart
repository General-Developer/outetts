/* <!-- START LICENSE -->


This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
Social Media:

   - Youtube: https://youtube.com/@Global_Corporation 
   - Github: https://github.com/globalcorporation
   - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

If you wan't edit you must add credit me (don't change)

If this Software / Program / Source Code has you

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */

import 'dart:io';
import 'package:outetts/outetts.dart';

void main(List<String> args) async {
  print("start");

  final String modelVocoderPath =
      "../../../../../big-data/wavtokenizer/WavTokenizer-Large-75-F16.gguf";
  final String modelPath =
      "../../../../../big-data/outetts/OuteTTS-0.2-500M-Q8_0.gguf";

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
    numberThreads: 4,
    text: text,
    ouputPath: outputPath,
  );
  exit(0);
}
