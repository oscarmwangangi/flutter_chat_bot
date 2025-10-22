import 'package:flutter/material.dart';
import 'package:flutter_chat_bot/components/RoundedButton.dart';
import 'package:flutter_chat_bot/constants.dart';
import 'registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';



  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(

        inAsyncCall: showSpinner,

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your password')
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                Buttontitle:   'Log In',
                color: Colors.lightBlueAccent,
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });

                    try {
                      final loggedInUser = await _auth.signInWithEmailAndPassword(
                        email: email.trim(),
                        password: password.trim(),
                      );

                      if (loggedInUser.user != null) {
                        debugPrint('✅ Login successful for ${loggedInUser.user!.email}');
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                    } on FirebaseAuthException catch (e) {
                      debugPrint('❌ Firebase Auth Error: ${e.code} - ${e.message}');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Login failed: ${e.message}')),
                      );
                    } catch (e) {
                      debugPrint('❌ Unexpected Error: $e');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('An error occurred. Please try again.')),
                      );
                    } finally {
                      setState(() {
                        showSpinner = false;
                      });
                    }
                  },

              )
            ],
          ),
        ),
      ),
    );
  }
}
