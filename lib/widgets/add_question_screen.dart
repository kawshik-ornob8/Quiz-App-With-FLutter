import 'package:flutter/material.dart';
import '/models/question.dart';
import 'package:quiz_app_tutorial/main.dart';
import 'package:quiz_app_tutorial/widgets/next_button.dart';

class AddQuestionScreen extends StatefulWidget {
  @override
  _AddQuestionScreenState createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State {
  final TextEditingController questionController = TextEditingController();
  final TextEditingController option1Controller = TextEditingController();
  final TextEditingController option2Controller = TextEditingController();
  final TextEditingController option3Controller = TextEditingController();
  final TextEditingController option4Controller = TextEditingController();
  int correctAnswerIndex = 0; // Index of the correct answer

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Question'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: questionController,
              decoration: InputDecoration(labelText: 'Question'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: option1Controller,
              decoration: InputDecoration(labelText: 'Option 1'),
            ),
            TextFormField(
              controller: option2Controller,
              decoration: InputDecoration(labelText: 'Option 2'),
            ),
            TextFormField(
              controller: option3Controller,
              decoration: InputDecoration(labelText: 'Option 3'),
            ),
            TextFormField(
              controller: option4Controller,
              decoration: InputDecoration(labelText: 'Option 4'),
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<int>(
              value: correctAnswerIndex,
              items: [
                DropdownMenuItem(
                  value: 0,
                  child: Text('Option 1'),
                ),
                DropdownMenuItem(
                  value: 1,
                  child: Text('Option 2'),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text('Option 3'),
                ),
                DropdownMenuItem(
                  value: 3,
                  child: Text('Option 4'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  correctAnswerIndex = value!;
                });
              },
              decoration: InputDecoration(labelText: 'Correct Answer'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Create a new question object with user input
                Question newQuestion = Question(
                  question: questionController.text,
                  options: [
                    option1Controller.text,
                    option2Controller.text,
                    option3Controller.text,
                    option4Controller.text,
                  ],
                  correctAnswerIndex: correctAnswerIndex,
                );

                // TODO: Save the new question to your questions list or database

                // Clear the text fields after adding the question
                questionController.clear();
                option1Controller.clear();
                option2Controller.clear();
                option3Controller.clear();
                option4Controller.clear();

                // Reset the correct answer index
                setState(() {
                  correctAnswerIndex = 0;
                });

                // Show a confirmation dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Question Added'),
                      content:
                          Text('The question has been added successfully!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Close the dialog
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Add Question'),
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
