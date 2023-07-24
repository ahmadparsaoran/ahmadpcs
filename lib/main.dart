import 'package:ahmad_parsaoran/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() =>runApp(const ProviderScope(
  child: MyApp())
  );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color.fromARGB(255, 22, 6, 112),
          secondary: Color.fromARGB(255, 233, 176, 221),
        )
      ),
      home: const HomeScreen(),
    );
  }
}