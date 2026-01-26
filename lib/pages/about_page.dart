import 'package:flutter/material.dart';
import 'content_page.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentPage(
      title: 'About Us',
      seoTitle: 'About Us - FlutterJS Team',
      seoDescription:
          'Learn about the mission and team behind FlutterJS, the native web framework for Dart.',
      seoKeywords:
          'about flutterjs, flutter web team, dart web framework mission',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'We are building the future of web development with Dart.',
            style:
                TextStyle(fontSize: 20, height: 1.5, color: Color(0xFF4B5563)),
          ),
          const SizedBox(height: 32),
          const Text(
            'Our Mission',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111827)),
          ),
          const SizedBox(height: 16),
          const Text(
            'FlutterJS aims to bridge the gap between the productivity of Flutter and the performance of the native web platform. By compiling Flutter widgets to optimized HTML, CSS, and JavaScript, we enable developers to reach more users with faster experiences.',
            style:
                TextStyle(fontSize: 16, height: 1.6, color: Color(0xFF4B5563)),
          ),
          const SizedBox(height: 32),
          const Text(
            'The Team',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111827)),
          ),
          const SizedBox(height: 16),
          const Text(
            'We are a passionate group of open source contributors dedicated to the Dart ecosystem.',
            style:
                TextStyle(fontSize: 16, height: 1.6, color: Color(0xFF4B5563)),
          ),
        ],
      ),
    );
  }
}
