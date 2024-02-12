import 'package:flutter/material.dart';
import 'package:images_captcha/images_captcha_screen.dart';
import 'package:images_captcha/picture_question_answer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImagesCaptchaScreen(),
    );
  }
}
