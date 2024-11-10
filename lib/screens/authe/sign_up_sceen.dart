import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hotel_booking_app/services/firebase_auth_service.dart';
import 'package:hotel_booking_app/utility/validation/validation.dart';
import 'package:hotel_booking_app/widgets/custom_button.dart';
import 'package:hotel_booking_app/widgets/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController =TextEditingController();
  TextEditingController emailFieldController =TextEditingController(); 
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();



  String? nameFieldError;
  String? emailErrorText;
  String? passwordErrorText;
  String? addressErrorText;
  String? mobileNoErrorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Signup Screen",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24),
        ),
        CustomTextField(
          textFieldName: "Name",
          controller: nameController,
          errorText: nameFieldError,
        ),
        CustomTextField(
          textFieldName: "Email",
          controller: emailFieldController,
          errorText: emailErrorText,
        ),
        CustomTextField(
          textFieldName: "Address",
          controller: addressController,
          errorText: addressErrorText,
        ),
        CustomTextField(
          textFieldName: "Mobile Number",
          controller: mobileNoController,
          errorText: mobileNoErrorText,
        ),
        CustomTextField(
          textFieldName: "Password",
          controller: passwordController,
          errorText: passwordErrorText,
        ),
        CustomTextField(
          textFieldName: "Confirm Password",
        ),
        SizedBox(
          height: 10,
        ),
        CustomButton(btnText: "SignUp",
        onTap: () {
          
          FireBaseAuthService.signUp(
            email: emailFieldController.text.trim(),
            password:passwordController.text.trim(),
            address:addressController.text.trim(),
            mobileNo:mobileNoController.text.trim(),
            name: nameController.text.trim()

            );


        print(nameFieldError);
        },),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
