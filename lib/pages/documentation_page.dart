// Copyright 2025 The FlutterJS Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'content_page.dart';

class DocumentationPage extends StatelessWidget {
  const DocumentationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentPage(
      title: 'Documentation',
      seoTitle: 'Documentation - FlutterJS',
      seoDescription:
          'Get started with FlutterJS. Learn how to install, build, and deploy high-performance web applications using Dart.',
      seoKeywords:
          'flutterjs documentation, tutorial, guide, flutter web seo, installation',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Installation'),
          _buildCodeBlock('flutter pub add flutterjs'),
          const SizedBox(height: 32),
          _buildSectionTitle('Getting Started'),
          const Text(
            'FlutterJS allows you to write standard Flutter code that compiles to lightweight, SEO-friendly JavaScript. Unlike Flutter Web (Canvas/WASM), FlutterJS renders to real HTML/DOM elements.',
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Color(0xFF4B5563),
            ),
          ),
          const SizedBox(height: 24),
          _buildSubTitle('1. Create a new project'),
          _buildCodeBlock('flutter create my_app\ncd my_app'),
          const SizedBox(height: 24),
          _buildSubTitle('2. Run with FlutterJS'),
          _buildCodeBlock('flutterjs run --to-js --serve'),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xFF111827),
        ),
      ),
    );
  }

  Widget _buildSubTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xFF374151),
        ),
      ),
    );
  }

  Widget _buildCodeBlock(String code) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        code,
        style: const TextStyle(
          fontFamily: 'Courier New',
          color: Color(0xFFE5E7EB),
          fontSize: 14,
        ),
      ),
    );
  }
}
