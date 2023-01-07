import 'dart:convert';
import 'dart:io';

import 'package:dart_json_gen/listToJsonMap.dart';
import 'package:test/test.dart';

void main() {
  test('json', () {
    expect(json.encode(listToJsonMap(File('example.txt').readAsLinesSync())),
        '{"phone":"888-555-1212","relationship":"spouse","createEnv1":{"env":["111","222"],"version":[3.1,2],"quest":true,"dat":"2012-04-22 19:18:04.000Z","hello":{"world":{"id":42,"phone":"yes","haha":"aaaa"},"ssss":{"fadsfa":"sdfaf","asdfaf":"dfdff","emergency":[{"aks":"afdsaf","sd":"asas","sda":"sssssssss"},{"aks":"sdfsd[2","sd":"asas","sss":false}]}}},"email":["jd@example.com","jad@example.org"],"duck":"now"}');
  });
}
