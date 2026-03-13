// Copyright 2025 The FlutterJS Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:http/http.dart' as http;
import 'dart:convert';

/// Service to fetch content from GitHub
class GitHubService {
  static const String _baseUrl = 'https://api.github.com';
  static const String _rawContentUrl = 'https://raw.githubusercontent.com';
  static const String _owner = 'flutterjsdev';
  static const String _repo = 'flutterjs';
  static const String _branch = 'master';

  /// Fetch README.md content
  Future<String> fetchReadme() async {
    try {
      final url = '$_rawContentUrl/$_owner/$_repo/$_branch/README.md';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to load README: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching README: $e');
      return _getDefaultReadme();
    }
  }

  /// Fetch repository statistics (stars, forks, etc.)
  Future<Map<String, dynamic>> fetchRepoStats() async {
    try {
      final url = '$_baseUrl/repos/$_owner/$_repo';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load repo stats: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching repo stats: $e');
      return _getDefaultStats();
    }
  }

  /// Fetch latest releases
  Future<List<dynamic>> fetchReleases({int limit = 5}) async {
    try {
      final url = '$_baseUrl/repos/$_owner/$_repo/releases?per_page=$limit';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load releases: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching releases: $e');
      return [];
    }
  }

  /// Fetch file content from repository
  Future<String> fetchFile(String path) async {
    try {
      final url = '$_rawContentUrl/$_owner/$_repo/$_branch/$path';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to load file: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching file $path: $e');
      rethrow;
    }
  }

  /// Fetch recent commits
  Future<List<dynamic>> fetchCommits({int limit = 10}) async {
    try {
      final url = '$_baseUrl/repos/$_owner/$_repo/commits?per_page=$limit';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load commits: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching commits: $e');
      return [];
    }
  }

  /// Fetch contributors
  Future<List<dynamic>> fetchContributors({int limit = 20}) async {
    try {
      final url = '$_baseUrl/repos/$_owner/$_repo/contributors?per_page=$limit';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load contributors: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching contributors: $e');
      return [];
    }
  }

  /// Default README fallback
  String _getDefaultReadme() {
    return '''
# FlutterJS

Build high-performance web applications with Dart and Flutter's widget system.

## Features
- Tiny bundles
- Perfect SEO
- Direct DOM rendering
- Type-safe development

Visit our [GitHub repository](https://github.com/$_owner/$_repo) for more information.
''';
  }

  /// Default stats fallback
  Map<String, dynamic> _getDefaultStats() {
    return {
      'stargazers_count': 0,
      'forks_count': 0,
      'open_issues_count': 0,
      'watchers_count': 0,
    };
  }
}
