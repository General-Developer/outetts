// ignore_for_file: public_member_api_docs, use_build_context_synchronously, empty_catches, unnecessary_brace_in_string_interps

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

import 'package:general_framework/flutter/loading/loading.dart';
import 'package:outetts_app/core/core.dart';
import 'package:outetts_app/scheme/scheme/application_outetts_database.dart';
import 'package:flutter/material.dart';
import 'package:general_framework/flutter/ui/alert/core.dart';
import 'package:general_framework/flutter/widget/widget.dart';
import 'package:general_lib/general_lib.dart';
import 'package:general_lib_flutter/general_lib_flutter.dart';
import 'package:general_system_device/core/core.dart';
import "package:path/path.dart" as path;

class OutettsTextToSpeechPage extends StatefulWidget {
  const OutettsTextToSpeechPage({super.key});

  @override
  State<OutettsTextToSpeechPage> createState() => _SpeechToTextPageState();
}

class _SpeechToTextPageState extends State<OutettsTextToSpeechPage>
    with GeneralLibFlutterStatefulWidget {
  late final GeneralSystemDeviceLibraryPlayerControllerBase playerController;

  final TextEditingController textEditingController = TextEditingController(
      text:
          "Hello World This Outetts Text To Speech Created By General Developer");
  @override
  void initState() {
    //  initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ensureInitialized();
      await initialized();
      await refresh();
    });
  }

  @override
  void dispose() {
    try {
      playerController.stop();
    } catch (e) {}
    playerController.dispose();
    super.dispose();
  }

  @override
  void ensureInitialized() {
    //  ensureInitialized
    super.ensureInitialized();
    playerController = OutettsAppClientFlutter.generalFlutter.media_player
        .createPlayer(player_id: "player");
  }

  Future<void> initialized() async {
    setState(() {
      isLoading = true;
    });
    await Future(() async {
      final ApplicationOutettsDatabase applicationOutettsDatabase =
          getApplicationOutettsDatabase();

      loadModel(
        outettsModel: File(applicationOutettsDatabase.outetts_model_path ?? ""),
        outettsModelVocoder:
            File(applicationOutettsDatabase.outetts_model_vocoder_path ?? ""),
      );
    });
    setState(() {
      isLoading = false;
    });
  }

  bool loadModel({
    required File outettsModel,
    required File outettsModelVocoder,
  }) {
    if (outettsModel.existsSync() == false ||
        outettsModelVocoder.existsSync() == false) {
      return false;
    }
    final bool isLoadedModel = OutettsAppClientFlutter.outetts.loadModel(
      modelPath: outettsModel.path,
      modelVocoderPath: outettsModelVocoder.path,
    );
    if (isLoadedModel == false) {
      context.showSnackBar("Model Cant Loaded");
      return false;
    }
    updateModel(outettsModel: outettsModel);
    updateModelVocoder(outettsModelVocoder: outettsModelVocoder);
    return true;
  }

  void updateModel({
    required File outettsModel,
  }) {
    setState(() {
      modelSize = outettsModel.statSync().size;
      modelName = path.basename(outettsModel.path);
    });
    return;
  }

  void updateModelVocoder({
    required File outettsModelVocoder,
  }) {
    setState(() {
      modelVocoderSize = outettsModelVocoder.statSync().size;
      modelVocoderName = path.basename(outettsModelVocoder.path);
    });
    return;
  }

  int modelSize = 0;
  String modelName = "";

  int modelVocoderSize = 0;
  String modelVocoderName = "";

  @override
  Future<void> refresh() async {
    if (isLoading) {
      return;
    }
    setState(() {
      isLoading = true;
    });
    await Future(() async {});
    setState(() {
      isLoading = false;
    });
  }

  final File fileAudioSaved = () {
    return File(path.join(
        OutettsAppClientFlutter.generalFrameworkClientFlutterAppDirectory
            .app_support_directory.path,
        "audio.wav"));
  }();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: appBarGlobalKey,
        title: Text(
          "Outetts Library - General Developer",
          style: context.theme.textTheme.titleLarge,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: context.height, minWidth: context.width),
            child: Column(
              children: [
                MenuContainerResponsiveGeneralFrameworkWidget(
                  isLoading: isLoading,
                  decorationBuilder: (context, decoration) {
                    return decoration.copyWith(
                      borderRadius: BorderRadius.circular(15),
                    );
                  },
                  titleBuilder: (context) {
                    return MenuContainerGeneralFrameworkWidget.title(
                      context: context,
                      title: "Information",
                    );
                  },
                  menuBuilder: (context) {
                    return [
                      MenuContainerGeneralFrameworkWidget.lisTile(
                        context: context,
                        contentPadding: EdgeInsets.all(5),
                        title: "Support",
                        trailing: Icon(
                          (OutettsAppClientFlutter.outetts.isDeviceSupport() ==
                                  true)
                              ? Icons.verified
                              : Icons.close,
                        ),
                      ),
                      MenuContainerGeneralFrameworkWidget.lisTile(
                        context: context,
                        contentPadding: EdgeInsets.all(5),
                        title: "Model Vocoder",
                        subtitle: [
                          "- Model Vocoder Name: ${modelVocoderName}",
                          "- Model Vocoder Size: ${FileSize.filesize(
                            size: modelVocoderSize,
                          )}",
                        ].join("\n"),
                        trailing: IconButton(
                          onPressed: () {
                            handleFunction(
                              onFunction: (context, statefulWidget) async {
                                final file =
                                    await OutettsAppClientFlutter.pickFile(
                                  dialogTitle: "Outetts Model Vocoder",
                                );
                                if (file == null) {
                                  context.showAlertGeneralFramework(
                                    alertGeneralFrameworkOptions:
                                        AlertGeneralFrameworkOptions(
                                      title:
                                          "Failed Load Model Vocoder Outetts",
                                      builder: (context,
                                          alertGeneralFrameworkOptions) {
                                        return "Coba lagi";
                                      },
                                    ),
                                  );
                                  return;
                                }

                                /// save to application settings
                                {
                                  final ApplicationOutettsDatabase
                                      applicationOutettsDatabase =
                                      getApplicationOutettsDatabase();
                                  applicationOutettsDatabase
                                      .outetts_model_vocoder_path = file.path;
                                  saveApplicationOutettsDatabase();
                                }

                                updateModelVocoder(outettsModelVocoder: file);
                              },
                            );
                          },
                          icon: Icon(Icons.create),
                        ),
                      ),
                      MenuContainerGeneralFrameworkWidget.lisTile(
                        context: context,
                        contentPadding: EdgeInsets.all(5),
                        title: "Model",
                        subtitle: [
                          "- Model Name: ${modelName}",
                          "- Model Size: ${FileSize.filesize(
                            size: modelSize,
                          )}",
                        ].join("\n"),
                        trailing: IconButton(
                          onPressed: () {
                            handleFunction(
                              onFunction: (context, statefulWidget) async {
                                final file =
                                    await OutettsAppClientFlutter.pickFile(
                                  dialogTitle: "Outetts Model",
                                );
                                if (file == null) {
                                  context.showAlertGeneralFramework(
                                    alertGeneralFrameworkOptions:
                                        AlertGeneralFrameworkOptions(
                                      title: "Failed Load Model Outetts",
                                      builder: (context,
                                          alertGeneralFrameworkOptions) {
                                        return "Coba lagi";
                                      },
                                    ),
                                  );
                                  return;
                                }

                                /// save to application settings
                                {
                                  final ApplicationOutettsDatabase
                                      applicationOutettsDatabase =
                                      getApplicationOutettsDatabase();
                                  applicationOutettsDatabase
                                      .outetts_model_path = file.path;
                                  saveApplicationOutettsDatabase();
                                }
                                updateModel(outettsModel: file);
                              },
                            );
                          },
                          icon: Icon(Icons.create),
                        ),
                      ),
                      MenuContainerGeneralFrameworkWidget.lisTile(
                        context: context,
                        contentPadding: EdgeInsets.all(5),
                        title: "Reload Model",
                        onTap: () {
                          handleFunction(
                            onFunction: (context, statefulWidget) async {
                              final ApplicationOutettsDatabase
                                  applicationOutettsDatabase =
                                  getApplicationOutettsDatabase();

                              final bool isLoadOutettsModel = loadModel(
                                outettsModel: File(applicationOutettsDatabase
                                        .outetts_model_path ??
                                    ""),
                                outettsModelVocoder: File(
                                    applicationOutettsDatabase
                                            .outetts_model_vocoder_path ??
                                        ""),
                              );
                              context.showSnackBar(isLoadOutettsModel
                                  ? "Succes Load Model Outetts"
                                  : "Failed Load Model Outetts");
                            },
                          );
                        },
                      ),
                    ];
                  },
                ),
                Row(
                  children: [
                    Flexible(
                      child: TextFormFieldGeneralFrameworkWidget(
                        maxLines: 9,
                        minLines: 1,
                        prefixIconData: Icons.text_fields,
                        controller: textEditingController,
                        inputDecorationBuilder: (context, inputDecoration) {
                          return inputDecoration.copyWith(
                            contentPadding: EdgeInsets.all(5),
                          );
                        },
                        onChanged: (value) {},
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        handleFunction(
                          onFunction: (context, statefulWidget) async {
                            final String text =
                                textEditingController.text.trim();
                            if (text.isEmpty) {
                              context.showAlertGeneralFramework(
                                alertGeneralFrameworkOptions:
                                    AlertGeneralFrameworkOptions(
                                  title: "Please Fill Form First",
                                  builder:
                                      (context, alertGeneralFrameworkOptions) {
                                    return "Require Fill Text Form";
                                  },
                                ),
                              );
                            }
                            LoadingGeneralFrameworkController
                                loadingGeneralFrameworkController =
                                LoadingGeneralFrameworkController(
                                    loadingText: "Generate Speech");

                            LoadingGeneralFramework.show(
                                context: context,
                                loadingGeneralFrameworkController:
                                    loadingGeneralFrameworkController);
                            await Future(() async {
                              try {
                                await OutettsAppClientFlutter.outetts
                                    .textToSpeech(
                                  numberThreads: 1,
                                  text: text,
                                  ouputPath: fileAudioSaved.path,
                                );
                                await playerController.open(
                                    GeneralSystemDeviceLibraryPlayerMediaBase(
                                        fileAudioSaved.path));
                              } catch (e) {}
                            });
                            context.navigator().pop();
                          },
                        );
                      },
                      icon: Icon(Icons.speaker),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.mediaQueryData.padding.bottom,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
