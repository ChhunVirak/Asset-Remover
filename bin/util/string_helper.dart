extension StringUtils on String {
  String clean() =>
      replaceAll(' ', '').replaceAll('-', '').replaceAll('_', '').toLowerCase();

  String asDataType() => this == '_InternalLinkedHashMap<String, dynamic>'
      ? 'Map<String,dynamic>'
      : this;
}

String camelCase(String text) {
  String capitalize(Match m) =>
      m[0]!.substring(0, 1).toUpperCase() + m[0]!.substring(1);
  String skip(String s) => "";
  return text.splitMapJoin(RegExp(r'[a-zA-Z0-9]+'),
      onMatch: capitalize, onNonMatch: skip);
}

String camelCaseFirstLower(String text) {
  final camelCaseText = camelCase(text);
  final firstChar = camelCaseText.substring(0, 1).toLowerCase();
  final rest = camelCaseText.substring(1);
  return '$firstChar$rest';
}

const Map<String, bool> allType = {
  'int': true,
  'double': true,
  'String': true,
  'bool': true,
  'DateTime': false,
  'List<DateTime>': false,
  'List<int>': true,
  'List<double>': true,
  'List<String>': true,
  'List<bool>': true,
  'Null': true,
};

// enum Type {
//   string('String'),
//   int('int'),
//   double('double');

//   final String value;
//   const Type(this.value);
// }
