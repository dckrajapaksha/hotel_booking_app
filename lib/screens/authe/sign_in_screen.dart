import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/services/firebase_auth_service.dart';

import 'package:hotel_booking_app/widgets/custom_text_field.dart';

import '../../widgets/custom_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  
  
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

 TextEditingController emailFieldController = TextEditingController();
 TextEditingController passwordController = TextEditingController();

 String? emailErrorText;
 String? passwordErrorText;
 bool isLoading = false;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    authStateCheck();
  }




  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "SignIn Screen",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24),
        ),
        SizedBox(
          height: 50,
        ),
        CustomTextField(
          textFieldName: "E-mail",
          controller: emailFieldController,
          errorText: emailErrorText,
        ),
        CustomTextField(
          textFieldName: "Password",
          controller: passwordController,
          errorText: passwordErrorText,
        ),
        SizedBox(
          height: 30,
        ),
        CustomButton(
          btnText: "SignIn",
          isLoading: isLoading,
          onTap: () {
            setState(() {
              isLoading=true;
            });
            FireBaseAuthService.signIn(email: emailFieldController.text.trim(), password: passwordController.text.trim()).then((value){
              FirebaseAuth.instance.authStateChanges().listen((user){
                if(user==null){
                  if(mounted){

              setState(() {
              isLoading=false;
            });
                  };

                }
              });
              if(value=="InvalideCred"){
                if(mounted){

                setState(() {
                  emailErrorText = "Invalied Credential";
                  passwordErrorText = "Invalied credential";
                });
                }
              }else if(value=="Wrong"){
                if(mounted){

                setState(() {
                  emailErrorText = "Enter Valied Email";
                  passwordErrorText = "Enter Valied password";
                });
                }
              }else if(value=="Success"){
                if(mounted){
                  setState(() {
                    
                emailErrorText = null;
                passwordErrorText = null;
                  });
                }
              }
            });
          },
        ),
        
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  

  authStateCheck() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User: ${user.email} is signed in!');
      }
    });
  }
}
