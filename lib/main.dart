import 'package:depi_final_project/presentation/widgets/drawer.dart';
import 'package:depi_final_project/presentation/widgets/wordly_appbar_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: WordlyAppbarWidget(),
        drawer: WordlyDrawer(),
        body: Center(child: Text("Hello Wordly")),
      ),
    );
  }
}
