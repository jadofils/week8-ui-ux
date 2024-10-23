import 'package:flutter/material.dart';
import 'send_money_page.dart';
import 'app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Send Money App',
      theme: AppTheme.themeData,
      home: SendMoneyPage(),
    );
  }
}
