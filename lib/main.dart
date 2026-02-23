// lib/main.dart
import 'package:flutter/material.dart';
import 'features/auth/screens/login_screen.dart';

void main() => runApp(const CivicIssueApp());

class CivicIssueApp extends StatelessWidget {
  const CivicIssueApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal, useMaterial3: true),
      home: const LoginScreen(), // Start with Login
    );
  }
}