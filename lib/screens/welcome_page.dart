import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/screen.dart';
import '../constants.dart';
import '../widgets/my_text_button.dart';

class WelcomePage extends StatelessWidget {
  static const String routeName = "welcome_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("WELCOME! Hope you enjoy!!",style: kButtonText2),backgroundColor: Colors.transparent,elevation: 0,centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: const Image(
                          image:
                              AssetImage('lib/images/quiz_img.jpg'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: MyTextButton(
                          bgColor: Colors.white,
                          buttonName: 'Register',
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => RegisterPage()));
                          },
                          textColor: Colors.black87,
                        ),
                      ),
                      Expanded(
                        child: MyTextButton(
                          bgColor: Colors.transparent,
                          buttonName: 'Sign In',
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => SignInPage(),
                                ));
                          },
                          textColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}