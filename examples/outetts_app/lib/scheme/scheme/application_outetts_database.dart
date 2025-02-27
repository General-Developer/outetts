// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

/// Generated
class ApplicationOutettsDatabase extends JsonScheme {
  /// Generated
  ApplicationOutettsDatabase(super.rawData);

  /// return default data
  ///
  static Map get defaultData {
    return {
      "@type": "applicationOutettsDatabase",
      "outetts_model_path": "",
      "outetts_model_vocoder_path": "",
      "file_audio_path": ""
    };
  }

  /// check data
  /// if raw data
  /// - rawData["@type"] == applicationOutettsDatabase
  /// if same return true
  bool json_scheme_utils_checkDataIsSameBySpecialType() {
    return rawData["@type"] == defaultData["@type"];
  }

  /// check value data whatever do yout want
  bool json_scheme_utils_checkDataIsSameBuilder({
    required bool Function(Map rawData, Map defaultData) onResult,
  }) {
    return onResult(rawData["@type"], defaultData["@type"]);
  }

  /// create [ApplicationOutettsDatabase]
  /// Empty
  static ApplicationOutettsDatabase empty() {
    return ApplicationOutettsDatabase({});
  }

  /// Generated
  String? get special_type {
    try {
      if (rawData["@type"] is String == false) {
        return null;
      }
      return rawData["@type"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set special_type(String? value) {
    rawData["@type"] = value;
  }

  /// Generated
  String? get outetts_model_path {
    try {
      if (rawData["outetts_model_path"] is String == false) {
        return null;
      }
      return rawData["outetts_model_path"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set outetts_model_path(String? value) {
    rawData["outetts_model_path"] = value;
  }

  /// Generated
  String? get outetts_model_vocoder_path {
    try {
      if (rawData["outetts_model_vocoder_path"] is String == false) {
        return null;
      }
      return rawData["outetts_model_vocoder_path"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set outetts_model_vocoder_path(String? value) {
    rawData["outetts_model_vocoder_path"] = value;
  }

  /// Generated
  String? get file_audio_path {
    try {
      if (rawData["file_audio_path"] is String == false) {
        return null;
      }
      return rawData["file_audio_path"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set file_audio_path(String? value) {
    rawData["file_audio_path"] = value;
  }

  /// Generated
  static ApplicationOutettsDatabase create({
    bool schemeUtilsIsSetDefaultData = false,
    String special_type = "applicationOutettsDatabase",
    String? outetts_model_path,
    String? outetts_model_vocoder_path,
    String? file_audio_path,
  }) {
    // ApplicationOutettsDatabase applicationOutettsDatabase = ApplicationOutettsDatabase({
    final Map applicationOutettsDatabase_data_create_json = {
      "@type": special_type,
      "outetts_model_path": outetts_model_path,
      "outetts_model_vocoder_path": outetts_model_vocoder_path,
      "file_audio_path": file_audio_path,
    };

    applicationOutettsDatabase_data_create_json
        .removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (applicationOutettsDatabase_data_create_json.containsKey(key) ==
            false) {
          applicationOutettsDatabase_data_create_json[key] = value;
        }
      });
    }
    return ApplicationOutettsDatabase(
        applicationOutettsDatabase_data_create_json);
  }
}
