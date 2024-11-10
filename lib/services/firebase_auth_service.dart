import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthService{
  static Future<String> signIn({required String email, required String password}) async{
    try {
      final credentials = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return "Success";
      
    }on FirebaseAuthException catch (e) {

      
       if(e.code=="invalid-credential"){
        
          return "InvalideCred";
       }else{
          return "Wrong";
       }
    }
  }
}