import 'package:flutter/material.dart';

class doctor extends StatefulWidget {
  @override
  State<doctor> createState() => _studentState();
}
class _studentState extends State<doctor> {
  List<Question> questions = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.teal,
        title: const Text('Please kindly enter your questions!!',style: TextStyle(fontSize: 20,fontFamily: 'Comic Sans MS',fontWeight: FontWeight.w500,color: Colors.black ),),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Question ${index + 1}: ${questions[index].questionText}'),
                      const SizedBox(height: 8),
                      for (int i = 0; i < questions[index].choices.length; i++)
                        Text('${String.fromCharCode(65 + i)}. ${questions[index].choices[i]}'),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              onPressed: () {
                _addQuestion();
              },
              child: const Text('Add Question',style: TextStyle(fontSize: 20,fontFamily: 'Comic Sans MS',fontWeight: FontWeight.w500,color: Colors.black ),),
            ),
          ),
        ],
      ),
    );
  }
  void _addQuestion() {
    TextEditingController questionController = TextEditingController();
    List<TextEditingController> choiceControllers = List.generate(5, (index) => TextEditingController());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Question & Choices:',style: TextStyle(fontSize: 20,fontFamily: 'Comic Sans MS',fontWeight: FontWeight.w500,color: Colors.black ),),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Question:',style: TextStyle(fontSize: 20,fontFamily: 'Comic Sans MS',fontWeight: FontWeight.w500,color: Colors.black ),),
                TextField(
                  controller: questionController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your question',
                  ),
                ),
                const SizedBox(height: 16),
                const Text('Choices:',style: TextStyle(fontSize: 20,fontFamily: 'Comic Sans MS',fontWeight: FontWeight.w500,color: Colors.black ),),
                for (int i = 0; i < 4; i++)
                  TextField(
                    controller: choiceControllers[i],
                    decoration: InputDecoration(
                      hintText: 'Choice ${String.fromCharCode(65 + i)}',
                    ),
                  ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel',style: TextStyle(fontSize: 20,fontFamily: 'Comic Sans MS',fontWeight: FontWeight.w500,color: Colors.black ),),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  List<String> choices = [];
                  for (int i = 0; i < 4; i++) {
                    choices.add(choiceControllers[i].text);
                  }
                  questions.add(Question(questionController.text, choices));
                });
                Navigator.of(context).pop();
              },
              child: const Text('Add questions',style: TextStyle(fontSize: 20,fontFamily: 'Comic Sans MS',fontWeight: FontWeight.w500,color: Colors.black ),),
            ),
          ],
        );
      },
    );
  }
}
class Question {
  String questionText;
  List<String> choices;
  Question(this.questionText, this.choices);
}