import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hollywood_conta/firebase_options.dart';
import 'package:hollywood_conta/provider/provider.dart';
import 'package:hollywood_conta/screens/home_screen.dart';
import 'package:hollywood_conta/theme/my_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
