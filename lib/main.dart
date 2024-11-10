import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/main_page.dart';
import 'package:hotel_booking_app/providers/hotel_provider.dart';
import 'package:hotel_booking_app/screens/authe/auth_screen.dart';
import 'package:hotel_booking_app/screens/authe/sign_in_screen.dart';
import 'package:hotel_booking_app/screens/authe/sign_up_sceen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HotelProvider()),
        
      ],

    child:const MyApp(),),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotel Management App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home:  StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
       builder: (context,snapshot){
        if(snapshot.data != null){
          return MainPage();
        }else{
          return AuthScreen();
        }
      }),
    );
  }
}

