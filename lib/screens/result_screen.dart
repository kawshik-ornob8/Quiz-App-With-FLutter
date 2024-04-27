import 'package:flutter/material.dart';
import 'package:quiz_app_tutorial/widgets/next_button.dart';
import '/models/questions.dart';
import 'quiz_screen.dart'; // Import your quiz screen directly
import 'package:quiz_app_tutorial/main.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalTimeInSeconds;

  const ResultScreen({
    Key? key,
    required this.score,
    required this.totalTimeInSeconds,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            Text(
              'Total Time: ${totalTimeInSeconds}s',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 24),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 250,
                  width: 250,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    value: score / 9,
                    color: Colors.green,
                    backgroundColor: Colors.white,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      score.toString(),
                      style: const TextStyle(fontSize: 80),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${(score / questions.length * 100).round()}%',
                      style: const TextStyle(fontSize: 25),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),
            RectangularButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => QuizScreen(),
                  ),
                );
              },
              label: 'Start Again',
            ),
            SizedBox(height: 24),
            RectangularButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HomeScreen(),
                  ),
                );
              },
              label: 'HOME',
            ),
          ],
        ),
      ),
    );
  }
}
