
import 'package:contact/dail%20page.dart';
import 'package:contact/dailpad.dart';
import 'package:contact/detail%20page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Dailpage(),
        'dial': (context) =>Dialpad(),
        'detail': (context) => Detailpage(),
      },
    ),
  );
}
