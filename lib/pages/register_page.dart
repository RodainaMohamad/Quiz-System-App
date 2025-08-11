import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_system/Core/Constants/Strings/strings.dart';
import 'package:quiz_system/Core/widgets/my_password_field.dart';
import 'package:quiz_system/Core/widgets/my_text_button.dart';
import 'package:quiz_system/Core/widgets/my_text_field.dart';
import 'package:quiz_system/pages/who_are_u.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool passwordVisibility = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back,color: Colors.black,size:50),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Register",
                            style: kHeadline,
                          ),
                          const Text(
                            "Create new account to get started.",
                            style: kBodyText2,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          MyTextField(
                            hintText: 'Name',
                            inputType: TextInputType.name,
                          ),
                          MyTextField(
                            hintText: 'Email',
                            inputType: TextInputType.emailAddress,
                          ),
                          MyTextField(
                            hintText: 'Phone',
                            inputType: TextInputType.phone,
                          ),
                          Builder(
                            builder: (context) {
                              return MyPasswordField(
                                isPasswordVisible: passwordVisibility,
                                onTap: () {
                                  setState(() {
                                    passwordVisibility = !passwordVisibility;
                                  });
                                },
                              );
                            }
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account? ",
                          style: kBodyText,
                        ),
                        Text(
                          "Sign In",
                          style: kBodyText.copyWith(
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextButton(
                      buttonName: 'Register',
                      onTap: () {Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => who_are_u(),
                          ));},
                      bgColor: Colors.white38,
                      textColor: Colors.black87,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}