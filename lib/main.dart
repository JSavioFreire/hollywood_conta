import 'package:flutter/material.dart';
import 'package:hollywood_conta/provider/provider.dart';
import 'package:hollywood_conta/screens/home_screen.dart';
import 'package:hollywood_conta/theme/my_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => MyProvider())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hollywood',
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      home: const HomeScreen(),
    );
  }
}
