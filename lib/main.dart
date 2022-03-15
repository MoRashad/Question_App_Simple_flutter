import 'questions_model.dart';
import 'package:flutter/material.dart';

QuestionModel questionModel = QuestionModel();
void main() {
  runApp(const questionApp());
}

// ignore: camel_case_types
class questionApp extends StatelessWidget {
  const questionApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text('Questions App'),
        ),
        body: const QuesPage(),
      ),
    );
  }
}

class QuesPage extends StatefulWidget {
  const QuesPage({Key? key}) : super(key: key);

  @override
  State<QuesPage> createState() => _QuesPageState();
}

checkAnswer(answer, useranswer) {
  if (answer == useranswer) {
    return const Padding(
      padding: EdgeInsets.all(3.0),
      child: Icon(
        Icons.thumb_up,
        color: Colors.green,
      ),
    );
  } else {
    return const Padding(
      padding: EdgeInsets.all(3.0),
      child: Icon(
        Icons.thumb_down,
        color: Colors.red,
      ),
    );
  }
}

class _QuesPageState extends State<QuesPage> {
  List<Widget> result = [];
  int questionNumber = 0;
  int images = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Row(
            children: result,
          ),
          Image.asset('images/image-$images.jpg'),
          Text(
            questionModel.getQuestionText(questionNumber),
            textAlign: TextAlign.center,
            // ignore: prefer_const_constructors
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                result.add(checkAnswer(
                    questionModel.getAnswerText(questionNumber), 'yes'));
                questionNumber++;
                images++;
                if (questionNumber == questionModel.getArrayLength()) {
                  questionNumber = 0;
                  images = 1;
                }
              });
            },
            child: const Text('YES'),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                textStyle:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                result.add(checkAnswer(
                    questionModel.getAnswerText(questionNumber), 'no'));
                questionNumber++;
                images++;
                if (questionNumber == questionModel.getArrayLength()) {
                  questionNumber = 0;
                  images = 1;
                  result.clear();
                }
              });
            },
            child: const Text('NO'),
            style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                textStyle:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
