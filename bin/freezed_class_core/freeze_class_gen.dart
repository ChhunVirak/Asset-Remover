// ignore_for_file: constant_identifier_names

import 'dart:io';
import 'dart:convert';
import '../util/string_helper.dart';
import 'freezed_class_core.dart';
/*
@freezed
class ClassName with _$ClassName {
  factory ClassName() = _ClassName;

  factory ClassName.fromJson(Map<String, dynamic> json) =>
      _$ClassNameFromJson(json);
  Map<String, dynamic> toJson() => _$ClassNameToJson(this);
}
*/

String syntax(String key, String value) =>
    'final ${value.asDataType()}? ${camelCaseFirstLower(key)};\n';

String constr(String key) => 'this.${camelCaseFirstLower(key)},';

const CLASS_NAME = 'InvestOptionModel';

void main() async {
  var getJsonFile = File('assets/data.json');
  var a = await getJsonFile.readAsString();

  String result = "class $CLASS_NAME with _\$$CLASS_NAME {\n";
  String constructor = 'factory $CLASS_NAME({';
  String endConstructor = "  }) = _$CLASS_NAME;";
  String fromJsonSyntax =
      " factory $CLASS_NAME.fromJson(Map<String, dynamic> json) =>_\$$CLASS_NAME(json);";

  Map<String, dynamic> decoded = JsonDecoder().convert(a);
  decoded.entries.map((e) {
    constructor =
        constructor + freezedSyntax(e.key, e.value.runtimeType.toString());
  }).toList();
  constructor = constructor + endConstructor;
  result = '$result$constructor $fromJsonSyntax \n}';
  File('generated/gen.dart').writeAsString(result);
}
