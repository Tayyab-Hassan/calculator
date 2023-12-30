import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String title;
  final Color color;
  final VoidCallback onpress;
  const Button(
      {Key? key,
      required this.title,
      required this.color,
      required this.onpress})
      : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 10, 15, 0),
      child: Expanded(
        child: InkWell(
          onTap: widget.onpress,
          child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [
                  Colors.black,
                  Colors.deepOrange,
                ])),
            child: Center(
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
