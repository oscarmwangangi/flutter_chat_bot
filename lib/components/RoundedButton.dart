import 'package:flutter/material.dart';

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
