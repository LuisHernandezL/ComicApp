import 'package:html/parser.dart';
import 'dart:convert' show utf8;

String getCleanString(String str) {
  final validator = parse(str).body!.nodes.isEmpty;
  String htmlToString = validator ? '' : parse(str).body!.nodes[0].text ?? '';

  try {
    return utf8.decode(htmlToString.codeUnits);
  } catch (e) {
    return htmlToString.replaceAll(RegExp(r'/[^\x00-\x7F]+/g'), " ");
  }
}
