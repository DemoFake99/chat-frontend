import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/constant/themes.dart';
import 'screens/chat_screen.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A-Chat',
      theme: AppTheme.themeData,
      debugShowCheckedModeBanner: false,
      home: const ChatScreen(),
    );
  }
}
