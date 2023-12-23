import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({
    Key? key,
    required this.sizeFont,
    required this.alingText,
    required this.textIndentation,
  }) : super(key: key);
  final double sizeFont;
  final Alignment alingText;
  final double textIndentation;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alingText,
      child: Padding(
        padding: EdgeInsets.only(left: textIndentation),
        child: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: sizeFont, // Utiliza sizeFont directamente aquí
              fontFamily: 'Fredoka',
              fontWeight: FontWeight.bold,
            ),
            children: const <TextSpan>[
              TextSpan(
                text: 'S',
                style: TextStyle(color: Colors.blue),
              ),
              TextSpan(
                text: 'm',
                style: TextStyle(color: Colors.orange),
              ),
              TextSpan(
                text: 'a',
                style: TextStyle(color: Colors.green),
              ),
              TextSpan(
                text: 'r',
                style: TextStyle(color: Colors.red),
              ),
              TextSpan(
                text: 't',
                style: TextStyle(color: Colors.purple),
              ),
              TextSpan(
                text: ' ',
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                text: 'Q',
                style: TextStyle(color: Colors.cyan),
              ),
              TextSpan(
                text: 'u',
                style: TextStyle(color: Colors.deepOrange),
              ),
              TextSpan(
                text: 'i',
                style: TextStyle(color: Colors.teal),
              ),
              TextSpan(
                text: 'z',
                style: TextStyle(color: Colors.pink),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
