import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String btnText;
  final GestureTapCallback? onTap;
  final bool isLoading;
  const CustomButton({
    super.key,
    required this.btnText,
    this.isLoading=false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap == null ? (){}:onTap!,
      child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.black),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: isLoading?
          SizedBox(
            width: 150,
            height: 35,
            child: Center(
              child:CircularProgressIndicator(color: Colors.white,) ,
            ),
          ):
          
          Text("SignIn",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 18),),
        ),
      ),
    );
  }
}
