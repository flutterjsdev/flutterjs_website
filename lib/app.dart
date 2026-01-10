import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'pages/home_page.dart';

class FlutterJSApp extends StatelessWidget {
  const FlutterJSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterJS - Build SEO-friendly websites with Flutter',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}
