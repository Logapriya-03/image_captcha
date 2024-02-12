import 'dart:math';

import 'package:flutter/material.dart';
import 'package:images_captcha/data/questions_answers.dart';

class QuestionCardShuffler extends StatefulWidget {
  const QuestionCardShuffler({super.key,required this.questionImages});

  final List<String> questionImages;

  @override
  State<QuestionCardShuffler> createState() => _QuestionCardShufflerState();
}

class _QuestionCardShufflerState extends State<QuestionCardShuffler> {

  int currentQuestionIndex = Random().nextInt(3);

  @override
  Widget build(BuildContext context) {

    List<String> shuffledImages = List.from(widget.questionImages)..shuffle();

    return Container(
      height: 180,
      width: 180,
      child: Image.asset(shuffledImages[currentQuestionIndex],
        height: 50,
        width: 50,
      )
    );
}
}
