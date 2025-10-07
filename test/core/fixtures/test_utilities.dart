import 'dart:io';

String getFixture(String name) =>
    File('test/core/fixtures/$name').readAsStringSync();
