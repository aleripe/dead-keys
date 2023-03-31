import 'package:dead_keys/dead_keys.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final DeadKeysTextEditingController _controller =
      DeadKeysTextEditingController(keyMap: unitedStatesInternationalKeyMap);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: TextField(
            controller: _controller,
          ),
        ),
      ),
    );
  }
}
