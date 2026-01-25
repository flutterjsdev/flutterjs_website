import 'package:flutter/material.dart';
import 'package:flutterjs_seo/flutterjs_seo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterJS Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _counter = 0;
  String _seoTitle = "FlutterJS - Build Native Web Apps [Checking]";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterJS'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo,
        elevation: 1,
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child:
                IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
              color: const Color(0xFFEEF2FF), // Light Indigo/Blue
              child: Column(
                children: [
                  Seo(
                    title: _seoTitle,
                    debug: true,
                    meta: {
                      "description":
                          "Tiny bundles, SEO friendly, and real HTML rendering.",
                      "keywords": "flutter, web, seo, fast",
                      "og:title": "FlutterJS - Native Web Apps"
                    },
                    child: SizedBox.shrink(),
                  ),
                  const Icon(Icons.star, size: 64, color: Colors.indigo),
                  const SizedBox(height: 24),
                  const Text(
                    'Build Web Apps with FlutterJS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Tiny bundles. SEO friendly. Real HTML rendering.\nThe power of Flutter, now native to the web.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 48),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 48, vertical: 24),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    child: const Text('GET STARTED',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 24),
                  // SEO Verification Controls
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.indigo.withOpacity(0.2)),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "SEO Verification",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Current Title: $_seoTitle",
                          style: const TextStyle(fontSize: 12),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _seoTitle = "Home | FlutterJS";
                                });
                              },
                              child: const Text("Set Title: Home"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _seoTitle =
                                      "Verified @ ${DateTime.now().second}s";
                                });
                              },
                              child: const Text("Set Random Title"),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Open Browser Console (F12) to see verification logs.",
                          style: TextStyle(
                              fontSize: 10,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 60),

            // Features Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Text(
                    'Why FlutterJS?',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 40),
                  // Using Wrap for responsive layout
                  Wrap(
                    spacing: 30,
                    runSpacing: 30,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildFeatureCard(
                        Icons.star,
                        'Blazing Fast',
                        'Optimized for instant load times and 60fps performance.',
                        Colors.orange,
                      ),
                      _buildFeatureCard(
                        Icons.search,
                        'SEO Ready',
                        'Content is rendered as real HTML, fully indexable by Google.',
                        Colors.green,
                      ),
                      _buildFeatureCard(
                        Icons.download,
                        'Tiny Bundles',
                        'Minimal footprint starting at just 50KB gzipped.',
                        Colors.blue,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 80),

            // Interactive Demo Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(60),
              color: const Color(0xFFF9FAFB), // Grey 50
              child: Column(
                children: [
                  const Text(
                    'Interactive Demo',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'This is a real Flutter widget running independently.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    width: 320,
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Counter App',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        const Divider(height: 40),
                        const Text(
                          'Button pushed:',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '$_counter',
                          style: const TextStyle(
                              fontSize: 72,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () => _incrementCounter(),
                              backgroundColor: Colors.indigo,
                              child: const Icon(Icons.add, color: Colors.white),
                            ),
                            const SizedBox(width: 16),
                            FloatingActionButton(
                              onPressed: () => _decrementCounter(),
                              backgroundColor: Colors.indigo,
                              child:
                                  const Icon(Icons.remove, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Footer
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 32),
              color: const Color(0xFF111827), // Dark grey
              child: const Column(
                children: [
                  Text('FlutterJS',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  SizedBox(height: 8),
                  Text(
                    '© 2026 FlutterJS Team. All rights reserved.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
      IconData icon, String title, String description, Color color) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 32, color: color),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black.withOpacity(0.6), height: 1.5),
          ),
        ],
      ),
    );
  }
}

// Force rebuild - very final verification
