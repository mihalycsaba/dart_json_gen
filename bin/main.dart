import 'dart:io';
import 'dart:convert';
import 'package:dart_json_gen/listToJsonMap.dart';
void main(List<String> arguments) {
  try {
    //print(json.encode(listToJsonMap(File(arguments[0]).readAsLinesSync())));
    print(json.encode(listToJsonMap(File('example.txt').readAsLinesSync())));
  } catch (e) {
    print(e);
  }
}
