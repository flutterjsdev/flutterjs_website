// Copyright 2025 The FlutterJS Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:http/http.dart' as http;
import 'dart:convert';

/// Service to fetch dynamic content from GitHub content registry
class ContentService {
  static const String _contentRegistryUrl =
      'https://raw.githubusercontent.com/flutterjsdev/flutterjs_website/master/content/registry.json';

  static const String _contentBaseUrl =
      'https://raw.githubusercontent.com/flutterjsdev/flutterjs_website/master/content';

  /// Fetch the content registry
  Future<Map<String, dynamic>> fetchContentRegistry() async {
    try {
      final response = await http.get(Uri.parse(_contentRegistryUrl));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception(
            'Failed to load content registry: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching content registry: $e');
      return _getDefaultRegistry();
    }
  }

  /// Fetch page content by page name
  Future<Map<String, dynamic>> fetchPageContent(String pageName) async {
    try {
      final registry = await fetchContentRegistry();

      // Get the path from registry
      final pages = registry['pages'] as Map<String, dynamic>?;
      final contentPath = pages?[pageName];

      if (contentPath == null) {
        throw Exception('Page "$pageName" not found in registry');
      }

      // Fetch the page content
      final url = '$_contentBaseUrl/$contentPath';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load page content: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching page content for "$pageName": $e');
      return _getDefaultPageContent(pageName);
    }
  }

  /// Fetch specific content by key from registry
  Future<String> fetchContent(String contentKey) async {
    try {
      final registry = await fetchContentRegistry();

      // Get the path from registry
      final contentPath = registry[contentKey];
      if (contentPath == null) {
        throw Exception('Content key "$contentKey" not found in registry');
      }

      // Fetch the content
      final url = '$_contentBaseUrl/$contentPath';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to load content: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching content for key "$contentKey": $e');
      rethrow;
    }
  }

  /// Fetch multiple content items by keys
  Future<Map<String, String>> fetchMultipleContents(
      List<String> contentKeys) async {
    final results = <String, String>{};

    for (final key in contentKeys) {
      try {
        final content = await fetchContent(key);
        results[key] = content;
      } catch (e) {
        print('Failed to fetch content for key "$key": $e');
        results[key] = _getDefaultContent(key);
      }
    }

    return results;
  }

  /// Fetch all content defined in registry
  Future<Map<String, String>> fetchAllContent() async {
    try {
      final registry = await fetchContentRegistry();
      final results = <String, String>{};

      for (final entry in registry.entries) {
        final key = entry.key;
        final path = entry.value;

        try {
          final url = '$_contentBaseUrl/$path';
          final response = await http.get(Uri.parse(url));

          if (response.statusCode == 200) {
            results[key] = response.body;
          } else {
            results[key] = _getDefaultContent(key);
          }
        } catch (e) {
          print('Error fetching content at path "$path": $e');
          results[key] = _getDefaultContent(key);
        }
      }

      return results;
    } catch (e) {
      print('Error fetching all content: $e');
      return {};
    }
  }

  /// Default registry fallback
  Map<String, dynamic> _getDefaultRegistry() {
    return {
      'version': '1.0.0',
      'updated_at': DateTime.now().toIso8601String(),
      'pages': {
        'landing': 'pages/landing.json',
        'docs': 'pages/docs.json',
        'showcase': 'pages/showcase.json',
        'blog': 'pages/blog.json',
        'about': 'pages/about.json',
      }
    };
  }

  /// Default page content fallback
  Map<String, dynamic> _getDefaultPageContent(String pageName) {
    switch (pageName) {
      case 'landing':
        return {
          'hero': {
            'title': 'Build Native Web Apps\nwith the Power of Dart',
            'subtitle': 'Tiny bundles. Perfect SEO. Direct DOM rendering.',
            'description': 'Experience the developer experience of Flutter with the performance of native HTML & CSS.',
          },
          'features': {
            'title': 'Why developers love FlutterJS',
            'subtitle': 'Everything you need to build production-ready web applications.',
            'items': [],
          }
        };
      default:
        return {'error': 'Page not found'};
    }
  }

  /// Default content fallback
  String _getDefaultContent(String key) {
    switch (key) {
      case 'hero_title':
        return '# Build Native Web Apps with the Power of Dart';
      case 'hero_subtitle':
        return 'Tiny bundles. Perfect SEO. Direct DOM rendering.';
      case 'quickstart':
        return '''
## Quick Start

\`\`\`bash
# Install FlutterJS
dart pub global activate flutterjs

# Create a new project
flutterjs create my_app
cd my_app

# Run the dev server
flutterjs run
\`\`\`
''';
      default:
        return 'Content not available';
    }
  }

  /// Fetch content with caching
  static final Map<String, String> _cache = {};
  static final Map<String, DateTime> _cacheTimestamps = {};
  static const Duration _cacheDuration = Duration(minutes: 5);

  Future<String> fetchContentCached(String contentKey) async {
    final now = DateTime.now();
    final cachedTime = _cacheTimestamps[contentKey];

    // Check if cache is valid
    if (_cache.containsKey(contentKey) &&
        cachedTime != null &&
        now.difference(cachedTime) < _cacheDuration) {
      print('Using cached content for "$contentKey"');
      return _cache[contentKey]!;
    }

    // Fetch fresh content
    try {
      final content = await fetchContent(contentKey);
      _cache[contentKey] = content;
      _cacheTimestamps[contentKey] = now;
      return content;
    } catch (e) {
      // Return cached content if available, even if expired
      if (_cache.containsKey(contentKey)) {
        print('Using stale cache for "$contentKey" due to error');
        return _cache[contentKey]!;
      }
      rethrow;
    }
  }

  /// Clear the cache
  void clearCache() {
    _cache.clear();
    _cacheTimestamps.clear();
  }
}
