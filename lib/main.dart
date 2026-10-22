import 'package:depi_final_project/drawer.dart';
import 'package:depi_final_project/presentation/utils/app_colors.dart';
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
        appBar: AppBar(
          backgroundColor: AppColors.paleLavender,
          title: Text("Wordly"),
        ),
        drawer: WordlyDrawer(),
        body: Center(child: Text("Hello Wordly")),
      ),
    );
  }
}
