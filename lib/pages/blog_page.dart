import 'package:flutter/material.dart';
import 'content_page.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentPage(
      title: 'Blog',
      seoTitle: 'FlutterJS Blog - News and Tutorials',
      seoDescription:
          'Read the latest updates, tutorials, and technical deep dives about FlutterJS and Dart on the web.',
      seoKeywords: 'flutterjs blog, dart web, flutter tutorials, webdev news',
      child: Column(
        children: [
          _buildBlogPost(
            title: 'Introducing FlutterJS',
            date: 'Jan 26, 2026',
            excerpt:
                'Today we are announcing FlutterJS, a new way to build web apps with Dart. Learn how we optimize for performance and SEO.',
            tag: 'Announcement',
          ),
          const SizedBox(height: 32),
          _buildBlogPost(
            title: 'Why SEO Matters for Flutter Apps',
            date: 'Jan 20, 2026',
            excerpt:
                'Canvas-based rendering is great for apps, but bad for websites. See how FlutterJS solves the SEO puzzle.',
            tag: 'Technical',
          ),
          const SizedBox(height: 32),
          _buildBlogPost(
            title: 'Dart on the Server? Yes.',
            date: 'Jan 15, 2026',
            excerpt:
                'Combine FlutterJS with Dart backend frameworks for a full-stack Dart experience.',
            tag: 'Tutorial',
          ),
        ],
      ),
    );
  }

  Widget _buildBlogPost({
    required String title,
    required String date,
    required String excerpt,
    required String tag,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEF2FF),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  tag,
                  style: const TextStyle(
                      color: Color(0xFF4F46E5),
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                date,
                style: const TextStyle(color: Color(0xFF6B7280), fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111827)),
          ),
          const SizedBox(height: 12),
          Text(
            excerpt,
            style: const TextStyle(
                color: Color(0xFF4B5563), fontSize: 16, height: 1.6),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
            ),
            child: const Text('Read more →'),
          ),
        ],
      ),
    );
  }
}
