import 'package:flutter/material.dart';

class ConfigScreen extends StatefulWidget {
  const ConfigScreen({Key? key}) : super(key: key);

  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        children: [
          Column(
            children: [Text('Hola soy Config')],
          ),
        ],
      ),
    );
  }
}
