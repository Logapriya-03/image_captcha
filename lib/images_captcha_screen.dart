import 'package:flutter/material.dart';
import 'package:images_captcha/captcha_card_screen.dart';

class ImagesCaptchaScreen extends StatefulWidget {
  const ImagesCaptchaScreen({super.key});

  @override
  State<ImagesCaptchaScreen> createState() => _ImagesCaptchaScreenState();
}

class _ImagesCaptchaScreenState extends State<ImagesCaptchaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(80, 231, 172, 226),
              Color.fromARGB(80, 164, 214, 222)
            ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
        child: CaptchaCardScreen(),
      ),
    );

  }
}
