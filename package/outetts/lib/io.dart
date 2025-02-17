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
import 'dart:async';
import 'dart:ffi';
import 'dart:isolate';

import 'package:ffi/ffi.dart';

import 'base.dart';
import 'ffi/bindings.dart';

///
class Outetts extends OutettsBase {
  // ignore: prefer_final_fields
  bool _isInIsolate = false;

  ///
  Outetts({
    String? sharedLibraryPath,
  }) : super(
          sharedLibraryPath:
              sharedLibraryPath ?? OutettsBase.getLibraryWhisperPathDefault(),
        );

  ///
  static late final OutettsSharedBindingsByGeneralDeveloper _outetts;

  static bool _isEnsureInitialized = false;

  static String _modelPath = "";
  static String _modelVocoderPath = "";

  @override
  Future<void> ensureInitialized() async {
    if (_isEnsureInitialized) {
      return;
    }

    try {
      Outetts._outetts = OutettsSharedBindingsByGeneralDeveloper(
        DynamicLibrary.open(
          sharedLibraryPath,
        ),
      );
      _isDeviceSupport = true;
    } catch (e) {
      _isCrash = true;
    }

    _isEnsureInitialized = true;
  }

  bool _isCrash = false;
  bool _isDeviceSupport = false;
  @override
  bool isCrash() {
    return _isCrash;
  }

  @override
  bool isDeviceSupport() {
    if (_isCrash) {
      return false;
    }
    return _isDeviceSupport;
  }

  @override
  bool loadModel({
    required String modelPath,
    required String modelVocoderPath,
  }) {
    if (_isInIsolate) {}
    {
      Outetts._modelPath = modelPath;
      Outetts._modelVocoderPath = modelVocoderPath;
    }
    if (_isInIsolate == false) {
      return true;
    }

    if (isDeviceSupport() == false || isCrash()) {
      return false;
    }

    return true;
  }

  @override
  Future<void> initialized() async {
    // Isolate isolate = await Isolate.spawn(entryPoint, message);
  }

  @override
  FutureOr<void> dispose() async {}

  @override
  FutureOr<String> textToSpeech({
    required int numberThreads,
    required String text,
    required String ouputPath,
  }) async {
    if (_isInIsolate == false) {
      final String modelPath = Outetts._modelPath;
      final String modelVocoderPath = Outetts._modelVocoderPath;
      return await Isolate.run(() async {
        final Outetts outetts = Outetts();
        outetts._isInIsolate = true;
        await outetts.ensureInitialized();
        await outetts.initialized();

        outetts.loadModel(
          modelPath: modelPath,
          modelVocoderPath: modelVocoderPath,
        );

        return await outetts.textToSpeech(
          numberThreads: numberThreads,
          text: text,
          ouputPath: ouputPath,
        );
      });
    }

    final options = calloc<outetts_options_t>();
    options.ref.n_threads = numberThreads;
    options.ref.text = text.toNativeUtf8().cast<Char>();
    options.ref.output_path = ouputPath.toNativeUtf8().cast<Char>();
    options.ref.model_path = Outetts._modelPath.toNativeUtf8().cast<Char>();
    options.ref.model_vocoder_path =
        Outetts._modelVocoderPath.toNativeUtf8().cast<Char>();
    Outetts._outetts.outetts_inference(options.ref);
    return ouputPath;
  }
}
