import 'package:custom_painter_assignment/landscape_mode.dart';
import 'package:custom_painter_assignment/portrait_mode.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Vinyl Record',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: const MyHomePage(title: 'Custom Vinyl record'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.orientationOf(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 22, 22, 22),
      body: orientation == Orientation.portrait
          ? const PortraitMode()
          : const LandScapeMode(),
    );
  }
}
