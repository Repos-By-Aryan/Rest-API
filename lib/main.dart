// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:rest_api/example_five.dart';
import 'package:rest_api/example_three.dart';
import 'package:rest_api/example_two.dart';
import 'package:rest_api/home_screen.dart';
import 'package:rest_api/example_four.dart';
import 'package:rest_api/login.dart';
import 'package:rest_api/signup.dart';
import 'package:rest_api/up.dart';
import 'package:rest_api/upload_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const UpImg(),
    );
  }
}