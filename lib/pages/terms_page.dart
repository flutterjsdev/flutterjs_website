// Copyright 2025 The FlutterJS Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'content_page.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentPage(
      title: 'Terms of Service',
      seoTitle: 'Terms of Service - FlutterJS',
      seoDescription:
          'Terms and conditions for using the FlutterJS framework and website.',
      seoKeywords: 'terms of service, flutterjs license, usage policy',
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '1. Acceptance of Terms',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF111827),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'By accessing and using the FlutterJS website and documentation, you accept and agree to be bound by the terms and provision of this agreement.',
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Color(0xFF4B5563),
            ),
          ),
          SizedBox(height: 32),
          Text(
            '2. License',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF111827),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'The FlutterJS framework is licensed under the Apache 2.0 License. The documentation and website content are licensed under CC-BY 4.0.',
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Color(0xFF4B5563),
            ),
          ),
        ],
      ),
    );
  }
}
