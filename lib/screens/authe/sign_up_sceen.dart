import 'package:flutter/material.dart';
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
  String? nameFieldError;
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
        ),
        CustomTextField(
          textFieldName: "Address",
        ),
        CustomTextField(
          textFieldName: "Mobile Number",
        ),
        CustomTextField(
          textFieldName: "Password",
        ),
        CustomTextField(
          textFieldName: "Confirm Password",
        ),
        SizedBox(
          height: 10,
        ),
        CustomButton(btnText: "SignUp",
        onTap: () {
          setState(() {
            
        nameFieldError = Validation.nameValidator(nameValue: nameController.text.toString());
          });

        print(nameFieldError);
        },),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
