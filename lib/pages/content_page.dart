import 'package:flutter/material.dart';
import '../main.dart'; // Import for access to common widgets if needed, or we might need to refactor NavBar

class ContentPage extends StatelessWidget {
  final String title;
  final Widget child;
  final VoidCallback onHomePressed;
  final VoidCallback? onDocsPressed;
  final VoidCallback? onShowcasePressed;
  final VoidCallback? onBlogPressed;

  const ContentPage({
    Key? key,
    required this.title,
    required this.child,
    required this.onHomePressed,
    this.onDocsPressed,
    this.onShowcasePressed,
    this.onBlogPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildNavBar(context),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 48, horizontal: 24),
                    color: const Color(0xFFF9FAFB),
                    child: Center(
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 800),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF111827),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 48, horizontal: 24),
                    child: Center(
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 800),
                        child: child,
                      ),
                    ),
                  ),
                  // We can add the footer here later, ideally refactored into a reusable widget
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey.shade100)),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: onHomePressed,
            child: Row(
              children: [
                const Icon(Icons.flutter_dash,
                    color: Color(0xFF4F46E5), size: 32),
                const SizedBox(width: 12),
                const Text(
                  'FlutterJS',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF111827)),
                ),
              ],
            ),
          ),
          const Spacer(),
          if (MediaQuery.of(context).size.width > 700) ...[
            TextButton(
                onPressed: onDocsPressed, child: const Text('Documentation')),
            TextButton(
                onPressed: onShowcasePressed, child: const Text('Showcase')),
            TextButton(onPressed: onBlogPressed, child: const Text('Blog')),
            const SizedBox(width: 16),
          ],
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4F46E5),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            ),
            child: const Text('Get Started',
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
