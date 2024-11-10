import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/screens/authe/sign_in_screen.dart';
import 'package:hotel_booking_app/screens/authe/sign_up_sceen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isSignInPage = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            isSignInPage ? SignInScreen() : SignupScreen(),
            isSignInPage
                ? RichText(
                    text: TextSpan(children: <TextSpan>[
                    TextSpan(text: "Don't have an account ",style: TextStyle(color: Colors.black)),
                    TextSpan(text: "SignUp",style: TextStyle(color: Colors.black,decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()..onTap=(){
                      setState(() {
                        isSignInPage=false;
                      });
                    }),
                  ]))
                : RichText(
                    text: TextSpan(children: <TextSpan>[
                    TextSpan(text: "All ready have an account ",style: TextStyle(color: Colors.black)),                
                    TextSpan(text: "SignIn",style: TextStyle(color: Colors.black,decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()..onTap=(){
                      setState(() {
                        isSignInPage=true;
                      });
                    }),
                  ])),
          ],
        ),
      ),
    );
  }
}
