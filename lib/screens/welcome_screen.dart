import 'package:flutter/material.dart';
import 'package:flutter_chat_bot/screens/login_screen.dart';
import 'package:flutter_chat_bot/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {

  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<Color?> animation;

  @override
  void initState(){
    controller = AnimationController(
      duration: Duration(seconds: 1,),
      vsync: this, );

    controller.forward();
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);


    controller.addListener((){
      setState(() {

      });
    });
  }
  @override
  void dispose() {
    controller.dispose(); // ✅ always dispose controllers
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Flash Chat',
                     textStyle: const TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                     ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              color: Colors.lightBlue,
              Buttontitle: 'Log in',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            RoundedButton(
                color: Colors.blueAccent,
              Buttontitle: 'Register',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {

  final Color color;
  final String Buttontitle;
  final VoidCallback onPressed;


  const RoundedButton({
    Key? key,
    required this.color,
    required this. Buttontitle,
    required this.onPressed

  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed:onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            Buttontitle,
            style: const TextStyle(
              color: Colors.white, // ✅ Apply color here

            ),
          ),
        ),
      ),
    );
  }
}
