import 'package:flutter/material.dart';
import 'package:quiz_system/models/question_model.dart';
import 'package:video_player/video_player.dart';

class Student extends StatefulWidget {
  static const String routeName = "student";
  @override
  State<Student> createState() => _StudentState();
}
class _StudentState extends State<Student> {
  List<questions> OsList = Questions().OS();
  List<questions> JavaList = Questions().Java();
  List<questions> EngList = Questions().English();
  int currentQuestionIndex = 0;
  int sumMarks = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 239, 240),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 25),
                const Text(
                  'Choose subject!!',
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'Comic Sans MS',
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromRadius(75),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10),
                    backgroundColor: Colors.white38,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestionWidget(
                          OsList,
                              (isCorrect) {
                            if (isCorrect) {
                              setState(() {
                                sumMarks += 1;
                              });
                            }
                          },
                          sumMarks,
                          OsList.length, // add this line
                        ),
                      ),
                    );
                  },
                  child: const Text('OS',
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Comic Sans MS',
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromRadius(75),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10),
                    backgroundColor: Colors.white38,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestionWidget(
                          JavaList,
                              (isCorrect) {
                            if (isCorrect) {
                              setState(() {
                                sumMarks += 1;
                              });
                            }
                          },
                          sumMarks,
                          JavaList.length, // add this line
                        ),
                      ),
                    );
                  },
                  child: const Text('Java',
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Comic Sans MS',
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromRadius(75),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10),
                    backgroundColor: Colors.white38,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestionWidget(
                          EngList,
                              (isCorrect) {
                            if (isCorrect) {
                              setState(() {
                                sumMarks += 1;
                              });
                            }
                          },
                          sumMarks,
                          EngList.length, // add this line
                        ),
                      ),
                    );
                  },
                  child: const Text('English',
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Comic Sans MS',
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class QuestionWidget extends StatefulWidget {
  final List<questions> Questions;
  final void Function(bool isCorrect) onAnswerSelected;
  int sumMarks;
  final int totalMarks;
  QuestionWidget(this.Questions, this.onAnswerSelected, this.sumMarks, this.totalMarks);
  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int selectedOptionIndex = -1;
  int currentQuestionIndex = 0;
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    selectedOptionIndex = -1;
    // Initialize the VideoPlayerController outside the AlertDialog
    _controller = VideoPlayerController.asset('images/failure.mp4');
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question Screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              widget.Questions[currentQuestionIndex].question,
              style: const TextStyle(
                fontSize: 24,
                fontFamily: 'Comic Sans MS',
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.Questions[currentQuestionIndex].answerList.length,
              itemBuilder: (context, index) {
                return RadioListTile(
                  title: Text(
                    widget.Questions[currentQuestionIndex].answerList[index].answers,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Comic Sans MS',
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  value: index,
                  groupValue: selectedOptionIndex,
                  onChanged: (value) {
                    setState(() {
                      selectedOptionIndex = value!;
                    });
                    widget.onAnswerSelected(widget.Questions[currentQuestionIndex].answerList[selectedOptionIndex].isCorrect);
                  },
                );
              },
            ),
          ),
          Container(
            color: Colors.lightBlue,
            width: 100,
            margin: const EdgeInsets.symmetric(vertical: 8),
            height: 50,
            child: Center(
              child: TextButton(
                onPressed: () {
                  nextButton(widget.Questions[currentQuestionIndex].answerList[selectedOptionIndex].isCorrect);
                },
                child: const Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'Comic Sans MS',
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void nextButton(bool isCorrect) {
    if (currentQuestionIndex < widget.Questions.length - 1) {
      setState(() {
        selectedOptionIndex = -1;
        currentQuestionIndex++;
      });
      if (isCorrect) {
        widget.sumMarks += 1;
      }
    } else {
      if (widget.sumMarks == 0) {
        displayVideo('images/zero.mp4');
      } else if (widget.sumMarks < 3) {
        displayVideo('images/failure.mp4');
      } else if (widget.sumMarks > 3) {
        displayVideo('images/morethan3.mp4');}
      else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Quiz Completed'),
              content: Text('Your Score: ${widget.sumMarks} / ${widget.Questions.length}\nTotal Marks: ${widget.sumMarks}/${widget.totalMarks}'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }
  void displayVideo(String videoPath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Initialize the VideoPlayerController
        _controller = VideoPlayerController.asset(videoPath);

        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Display Marks
              Text(
                'Your Score: ${widget.sumMarks} / ${widget.Questions.length}',
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Comic Sans MS',
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const SizedBox(height: 8),
              // Display Video
              FutureBuilder(
                future: _controller!.initialize(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    _controller!.play();
                    return AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: VideoPlayer(_controller!),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                _controller!.pause();
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },);}}