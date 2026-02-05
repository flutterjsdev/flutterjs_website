// Copyright 2025 The FlutterJS Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'content_page.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentPage(
      title: 'Privacy Policy',
      seoTitle: 'Privacy Policy - FlutterJS',
      seoDescription:
          'Privacy policy for the FlutterJS website and documentation. We value your privacy.',
      seoKeywords: 'privacy policy, flutterjs privacy, data collection',
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Last Updated: January 2026',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          SizedBox(height: 32),
          Text(
            '1. Information We Collect',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111827)),
          ),
          SizedBox(height: 16),
          Text(
            'We collect minimal information necessary to improve our documentation and website. This may include anonymous usage statistics and error reports.',
            style:
                TextStyle(fontSize: 16, height: 1.6, color: Color(0xFF4B5563)),
          ),
          SizedBox(height: 32),
          Text(
            '2. How We Use Information',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111827)),
          ),
          SizedBox(height: 16),
          Text(
            'We use the collected information to analyze trends, administer the site, and gather demographic information about our user base as a whole.',
            style:
                TextStyle(fontSize: 16, height: 1.6, color: Color(0xFF4B5563)),
          ),
        ],
      ),
    );
  }
}
