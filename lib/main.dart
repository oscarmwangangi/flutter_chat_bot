import 'package:flutter/material.dart';
import 'package:flutter_chat_bot/screens/welcome_screen.dart';
import 'package:flutter_chat_bot/screens/login_screen.dart';
import 'package:flutter_chat_bot/screens/registration_screen.dart';
import 'package:flutter_chat_bot/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // simple init without options
  runApp(FlashChat());
}


class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.id,

      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen()
      },
    );
  }
}
