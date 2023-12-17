import 'package:flutter/material.dart';

class MessageWidget extends StatefulWidget {
  final String message;

  const MessageWidget({Key? key, required this.message}) : super(key: key);

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors
              .blue, // Puedes cambiar el color de fondo según tus preferencias
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          widget.message,
          style: const TextStyle(
            color: Colors
                .white, // Puedes cambiar el color del texto según tus preferencias
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
