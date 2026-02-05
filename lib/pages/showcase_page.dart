// Copyright 2025 The FlutterJS Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'content_page.dart';

class ShowcasePage extends StatelessWidget {
  const ShowcasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentPage(
      title: 'Showcase',
      seoTitle: 'Showcase - Apps Built with FlutterJS',
      seoDescription:
          'Explore real-world examples of high-performance web applications built with FlutterJS.',
      seoKeywords:
          'flutterjs examples, showcase, demo, flutter web sites, portfolio',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'See what developers are building with FlutterJS.',
            style: TextStyle(fontSize: 18, color: Color(0xFF6B7280)),
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            children: [
              _buildShowcaseCard(
                title: 'Personal Portfolio',
                description: 'A sleek, fast-loading portfolio site with SEO.',
                icon: Icons.person,
                color: Colors.blue,
              ),
              _buildShowcaseCard(
                title: 'E-commerce Landing',
                description: 'High conversion landing page with instant LCP.',
                icon: Icons.shopping_bag,
                color: Colors.green,
              ),
              _buildShowcaseCard(
                title: 'Documentation Site',
                description: 'Documentation generator with markdown support.',
                icon: Icons.library_books,
                color: Colors.orange,
              ),
              _buildShowcaseCard(
                title: 'SaaS Dashboard',
                description: 'Responsive dashboard layout with charts.',
                icon: Icons.dashboard,
                color: Colors.purple,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildShowcaseCard({
    required String title,
    required String description,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(color: Color(0xFF6B7280), height: 1.5),
          ),
        ],
      ),
    );
  }
}
