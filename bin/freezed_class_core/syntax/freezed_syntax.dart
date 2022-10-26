import '../../util/string_helper.dart';

String jsonKey(String key) => "@JsonKey(name: \"$key\")";

String freezedSyntax(String key, String value) =>
    '${jsonKey(key)} final ${value.asDataType()}? ${camelCaseFirstLower(key)},\n';
