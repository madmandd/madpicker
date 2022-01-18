import 'package:flutter/material.dart';
import 'package:madpicker/madpicker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color _color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: MadColorPicker(
            selectedColor: _color,
            onColorSelected: (color) {
              setState(() {
                _color = color;
                print(_color);
              });
            }),
      ),
    );
  }
}
