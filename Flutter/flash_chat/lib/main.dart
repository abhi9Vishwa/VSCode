import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAEkypI1ETEZO_7i2SIkKlr47HqP8OtrDc",
      authDomain: "flash-chat-abhi9.firebaseapp.com",
      projectId: "flash-chat-abhi9",
      storageBucket: "flash-chat-abhi9.appspot.com",
      messagingSenderId: "331946721811",
      appId: "1:331946721811:web:09a52b49508c94019cf5e6",
      measurementId: "G-B79T5WDVE4",
    ),
  );
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(
          color: Color.fromARGB(111, 0, 0, 0),
        )),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/regis': (context) => RegistrationScreen(),
        '/chat': (context) => ChatScreen(),
      },
    );
  }
}
