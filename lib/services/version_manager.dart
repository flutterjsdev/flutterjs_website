// Copyright 2025 The FlutterJS Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'github_service.dart';

/// Manages version comparison and content selection
class VersionManager {
  static const String localVersion = 'v0.0.1';

  final GitHubService _githubService = GitHubService();

  /// Compare versions and return the higher one
  /// Returns: {version: String, source: 'local'|'github'}
  Future<Map<String, String>> getLatestVersion() async {
    try {
      // Fetch GitHub releases
      final releases = await _githubService.fetchReleases(limit: 1);

      if (releases.isEmpty) {
        return {'version': localVersion, 'source': 'local'};
      }

      final githubVersion = releases[0]['tag_name'] ?? localVersion;

      // Compare versions
      if (_compareVersions(githubVersion, localVersion) > 0) {
        // GitHub version is higher
        return {'version': githubVersion, 'source': 'github'};
      } else {
        // Local version is higher or equal
        return {'version': localVersion, 'source': 'local'};
      }
    } catch (e) {
      print('Error getting latest version: $e');
      return {'version': localVersion, 'source': 'local'};
    }
  }

  /// Fetch content based on version source
  /// If local version is higher, use local content
  /// If GitHub version is higher, fetch from GitHub
  Future<String> getContent(String path,
      {String? localContent, bool preferGitHub = false}) async {
    try {
      final versionInfo = await getLatestVersion();
      final source = versionInfo['source'];

      // If local version is higher or equal, use local content
      if (source == 'local' && localContent != null && !preferGitHub) {
        return localContent;
      }

      // Otherwise fetch from GitHub
      return await _githubService.fetchFile(path);
    } catch (e) {
      print('Error getting content: $e');
      // Fallback to local content if provided
      if (localContent != null) {
        return localContent;
      }
      rethrow;
    }
  }

  /// Compare two semantic versions
  /// Returns: -1 if v1 < v2, 0 if equal, 1 if v1 > v2
  int _compareVersions(String v1, String v2) {
    // Remove 'v' prefix if present
    v1 = v1.replaceFirst(RegExp('^v'), '');
    v2 = v2.replaceFirst(RegExp('^v'), '');

    final parts1 = v1.split('.').map((e) => int.tryParse(e) ?? 0).toList();
    final parts2 = v2.split('.').map((e) => int.tryParse(e) ?? 0).toList();

    // Ensure both have at least 3 parts (major.minor.patch)
    while (parts1.length < 3) {
      parts1.add(0);
    }
    while (parts2.length < 3) {
      parts2.add(0);
    }

    // Compare major, minor, patch
    for (int i = 0; i < 3; i++) {
      if (parts1[i] > parts2[i]) return 1;
      if (parts1[i] < parts2[i]) return -1;
    }

    return 0; // Equal
  }

  /// Get version as comparable integer (for caching)
  int versionToInt(String version) {
    version = version.replaceFirst(RegExp('^v'), '');
    final parts = version.split('.').map((e) => int.tryParse(e) ?? 0).toList();

    while (parts.length < 3) {
      parts.add(0);
    }

    // Encode as: major * 1000000 + minor * 1000 + patch
    return parts[0] * 1000000 + parts[1] * 1000 + parts[2];
  }
}
