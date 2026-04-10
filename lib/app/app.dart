import 'package:flutter/material.dart';
import '../core/themes/app_theme.dart';

class MenuMasterApp extends StatelessWidget {
  const MenuMasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MenuMaster',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: Text('MenuMaster - En construcción'),
        ),
      ),
    );
  }
}