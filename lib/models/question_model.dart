class questions{
  final String question;
  final List<answer>answerList;
  questions(this.question,this.answerList);
}
class answer{
  final String answers;
  final bool isCorrect;
  answer(this.answers,this.isCorrect);
}
class Questions{
  List<questions>OS(){
    List<questions>list=[];
    list.add(questions("What is an operating system?",
        [
          answer("a) interface between the hardware and application programs", false),
          answer("b) collection of programs that manages hardware resources", true),
          answer("c) system service provider to the application programs", false),
          answer("d) all of the mentioned", false),
        ]));
    list.add(questions("2. What is the main function of the command interpreter?",
        [
          answer("a) to provide the interface between the API and application program", false),
          answer("b) to handle the files in the operating system", false),
          answer("c) to get and execute the next user-specified command", true),
          answer("d) none of the mentioned", false),
        ]));
    list.add(questions("3. In Operating Systems, which of the following is/are CPU scheduling algorithms?",
        [
          answer("a) Priority", false),
          answer("b) Round Robin", false),
          answer("c) Shortest Job First", false),
          answer("d) All of the mentioned", true),
        ]));
    list.add(questions("4. To access the services of the operating system, the interface is provided by the _____",
        [
          answer("a) Library", false),
          answer("b) System calls", true),
          answer("c) Assembly instructions", false),
          answer("d) API", false),
        ]));
    list.add(questions("5. CPU scheduling is the basis of _____",
        [
          answer("a) multiprogramming operating systems", true),
          answer("b) larger memory sized systems", false),
          answer("c) multiprocessor systems", false),
          answer("d) none of the mentioned", false),
        ]));

    return list;
  }
  List<questions>Java(){
    List<questions>list=[];
    list.add(questions("1. Which class cannot be subclassed (or extended) in java?",
        [
          answer("a) abstract class", false),
          answer("b) parent class", false),
          answer("c) Final class", true),
          answer("d) None of above", false),
        ]));
    list.add(questions("2. Can we declare abstract static method",
        [
          answer("a) Yes", false),
          answer("b) No", true),
        ]));
    list.add(questions("3. Can we access private class outside the package",
        [
          answer("a) Yes", false),
          answer("b) No", true),
        ]));
    list.add(questions("4. Why we use array as a parameter of main method?",
        [
          answer("a) it is syntax", false),
          answer("b) Can store multiple values", true),
          answer("c) Both of above", false),
          answer("d) None of above", false),
        ]));
    list.add(questions("5. Suspend thread can be revived by using______",
        [
          answer("a) start() method", false),
          answer("b) Suspend() method", false),
          answer("c) resume() method", true),
          answer("d) yield() method", false),
        ]));

    return list;
  }
  List<questions>English(){
    List<questions>list=[];
    list.add(questions("1. They ______ her and trusted her for years",
        [
          answer("a) know", false),
          answer("b) had known", false),
          answer("c) knew", true),
          answer("d) known", false),
        ]));
    list.add(questions("2. Every morning she ______ up early and gets ready for work.",
        [
          answer("a) is waking", false),
          answer("b) has woken", false),
          answer("c) had woken", false),
          answer("d) wakes", true),
        ]));
    list.add(questions("3. People ______ walk on grass.",
        [
          answer("a) couldn't", false),
          answer("b) needn't", false),
          answer("c) mustn't", true),
          answer("d) may not", false),
        ]));
    list.add(questions("4. ______ you speak any foreign languages?",
        [
          answer("a) can't", false),
          answer("b) should", false),
          answer("c) couldn't", false),
          answer("d) can", true),
        ]));
    list.add(questions("5. World war I and World war II took place ______ the 20th century.",
        [
          answer("a) on", false),
          answer("b) in", true),
          answer("c) at", false),
          answer("d) into", false),
        ]));

    return list;
  }
}