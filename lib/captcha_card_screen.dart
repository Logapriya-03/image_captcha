import 'package:flutter/material.dart';
import 'package:images_captcha/data/questions_answers.dart';
import 'package:images_captcha/image_card_shuffler.dart';
import 'package:images_captcha/question_card_shuffler.dart';


class CaptchaCardScreen extends StatefulWidget {
  const CaptchaCardScreen({super.key});



  @override
  State<CaptchaCardScreen> createState() => _CaptchaCardScreenState();
}

class _CaptchaCardScreenState extends State<CaptchaCardScreen> {

  List<String> questionImages = [
    'assets/downward_handle.png',
    'assets/right_strain.png',
    'assets/upward_handle.png',
    'assets/left_strain.png'
  ];

  List<String> directionImages = [
    'assets/downward.png',
    'assets/upward.png',
    'assets/left.png',
    'assets/right.png',
  ];
  var currentQuestionIndex = 0;
  var currentAnswerIndex;
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {


    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                  elevation: 50,
                  shadowColor: Colors.black,
                  color: Colors.white,
                  child: QuestionCardShuffler(questionImages: questionImages)),
              SizedBox(
                width: 20.0,
              ),
              Card(
                elevation: 50,
                shadowColor: Colors.black,
                color: _isSelected
                    ? (_isCorrect() ? Colors.green : Colors.red)
                    : Colors.white,
                child: ImageCardShuffler(images: directionImages,
                  onImageSelected: (index){
                  setState(() {
                    currentAnswerIndex = index;
                  });
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40.0,
          ),
          Text(
            'Select the correct direction of the handle',
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(
            height: 40.0,
          ),
          TextButton(
            onPressed: () {

              for (int i = 0; i < 4; i++) {
                setState(() {
                  currentQuestionIndex =
                      (currentQuestionIndex + 1) % questionsData.length;
                  print('value of currentQuestionIndex: $currentQuestionIndex');
                });
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Refresh',
                  style: TextStyle(fontSize: 18.0, color: Colors.blueAccent),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Icon(
                  Icons.refresh_outlined,
                  color: Colors.blueAccent,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool _isCorrect() {
    final currentQuestion = questionsData[currentQuestionIndex];
    return questionImages.contains(currentQuestion.questions) &&
        directionImages.contains(currentQuestion.correctAnswers);
  }
}
