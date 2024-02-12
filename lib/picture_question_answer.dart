import 'package:flutter/material.dart';


class PictureCaptcha extends StatefulWidget {
  @override
  _PictureCaptchaState createState() => _PictureCaptchaState();
}

class _PictureCaptchaState extends State<PictureCaptcha> {
  List<String> questionImages = [
    'assets/downward_handle.png',
    'assets/right_strain.png',
    'assets/upward_handle.png',
    'assets/left_strain.png'
  ];

  List<String> answerImages = [
    'assets/downward.png',
    'assets/upward.png',
    'assets/left.png',
    'assets/right.png',
  ];
  int correctAnswerIndex = 1; // For example, let's assume the correct answer index is 1

  int selectedAnswerIndex = -1; // -1 represents unselected state
  String feedbackMessage = '';

  void refreshCaptcha() {
    setState(() {
      selectedAnswerIndex = -1;
      feedbackMessage = '';
    });
  }

  void verifyAnswer(int index) {
    if (index == correctAnswerIndex) {
      setState(() {
        feedbackMessage = 'Correct answer!';
      });
    } else {
      setState(() {
        feedbackMessage = 'Wrong answer!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Picture Captcha'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                refreshCaptcha();
              },
              child: Text('Refresh'),
            ),
            SizedBox(height: 20),
            Wrap(
              children: List.generate(
                questionImages.length,
                    (index) => Visibility(
                  visible: selectedAnswerIndex != -1,
                  child: Image.asset(
                    questionImages[index],
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Wrap(
              children: List.generate(
                answerImages.length,
                    (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedAnswerIndex = index;
                      verifyAnswer(index);
                    });
                  },
                  child: Container(
                    color: selectedAnswerIndex == index
                        ? (index == correctAnswerIndex
                        ? Colors.green
                        : Colors.red)
                        : Colors.white,
                    child: Image.asset(
                      answerImages[index],
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(feedbackMessage),
          ],
        ),
      ),
    );
  }
}