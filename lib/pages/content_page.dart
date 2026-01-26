import 'package:flutter/material.dart';
import 'package:flutterjs_seo/flutterjs_seo.dart';

class ContentPage extends StatelessWidget {
  final String title;
  final Widget child;
  final dynamic seoTitle;
  final dynamic seoDescription;
  final dynamic seoKeywords;

  const ContentPage({
    Key? key,
    required this.title,
    required this.child,
    this.seoTitle,
    this.seoDescription,
    this.seoKeywords,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Construct meta map safely
    final Map<String, String> meta = {};
    if (seoDescription != null) {
      meta["description"] = seoDescription;
      meta["og:description"] = seoDescription;
    }
    if (seoKeywords != null) {
      meta["keywords"] = seoKeywords;
    }
    meta["og:title"] = seoTitle ?? "$title - FlutterJS";

    return Seo(
      title: seoTitle ?? "$title - FlutterJS",
      meta: meta,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            _buildNavBar(context),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF111827),
                          letterSpacing: -1.0,
                        ),
                      ),
                      const SizedBox(height: 48),
                      child,
                      const SizedBox(height: 80),
                      Divider(color: Colors.grey.shade200),
                      const SizedBox(height: 32),
                      _buildFooter(context),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
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
            onTap: () => Navigator.pushNamed(context, '/'),
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
              onPressed: () => Navigator.pushNamed(context, '/docs'),
              child: const Text('Documentation'),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/showcase'),
              child: const Text('Showcase'),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/blog'),
              child: const Text('Blog'),
            ),
            const SizedBox(width: 16),
          ],
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/docs'),
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

  Widget _buildFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("© 2026 FlutterJS Team.",
            style: TextStyle(color: Colors.grey, fontSize: 14)),
        Row(
          children: [
            InkWell(
                onTap: () => Navigator.pushNamed(context, '/privacy'),
                child: const Text("Privacy",
                    style: TextStyle(color: Colors.grey, fontSize: 14))),
            const SizedBox(width: 16),
            InkWell(
                onTap: () => Navigator.pushNamed(context, '/terms'),
                child: const Text("Terms",
                    style: TextStyle(color: Colors.grey, fontSize: 14))),
          ],
        )
      ],
    );
  }
}
