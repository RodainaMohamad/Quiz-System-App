import 'package:flutter/material.dart';

class who_are_u extends StatelessWidget {
  static const String routeName = "who_are_u";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 235, 239, 240),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('images/quizhci.png'),
                  ),
                ),
                const SizedBox(height: 25,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize:const Size.fromRadius(75),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10),
                    backgroundColor: Colors.white38,
                  ),
                  onPressed:(){ Navigator.pushReplacementNamed(context, "doctor");},
                  child: const Text('Doctor',style: TextStyle(fontSize: 24,fontFamily: 'Comic Sans MS',fontWeight: FontWeight.w500,color: Colors.black ),),
                ),
                const SizedBox(height: 25,),
                ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    fixedSize:const Size.fromRadius(75),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10),
                    backgroundColor: Colors.white38,
                  ),
                  onPressed:(){ Navigator.pushReplacementNamed(context, "student");},
                  child: const Text('Student',style: TextStyle(fontSize: 24,fontFamily: 'Comic Sans MS',fontWeight: FontWeight.w500,color: Colors.black ),),
                ),
              ],
            ),
          ),
        )
    );
  }
}