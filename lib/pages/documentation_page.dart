import 'package:flutter/material.dart';
import 'content_page.dart';

class DocumentationPage extends StatelessWidget {
  final VoidCallback onHomePressed;
  final VoidCallback onDocsPressed;
  final VoidCallback onShowcasePressed;
  final VoidCallback onBlogPressed;

  const DocumentationPage({
    Key? key,
    required this.onHomePressed,
    required this.onDocsPressed,
    required this.onShowcasePressed,
    required this.onBlogPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentPage(
      title: 'Documentation',
      onHomePressed: onHomePressed,
      onDocsPressed: onDocsPressed,
      onShowcasePressed: onShowcasePressed,
      onBlogPressed: onBlogPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection('Installation', '''
### Option 1: npm (Recommended)

```bash
npm install -g flutterjs
```

### Option 2: From Source

```bash
git clone https://github.com/flutterjsdev/flutterjs.git
dart pub global activate --source path .
```
'''),
          const SizedBox(height: 32),
          _buildSection('Quick Start', '''
1. **Create a New Project**

```bash
flutterjs init my-app
cd my-app
```

2. **Run Development Server**

```bash
flutterjs dev
```

3. **Build for Production**

```bash
flutterjs build
```
'''),
          const SizedBox(height: 32),
          _buildSection('Core Concepts', '''
**FlutterJS** compiles your Flutter/Dart code to Semantic HTML + CSS.
It bypasses the Canvas/WASM rendering engine used by standard Flutter Web, offering:

- **SEO**: Content is visible to search engines.
- **Performance**: Smaller bundles (~50KB vs 2MB+).
- **Native Feel**: Selectable text, accessibility, and CSS styling.
'''),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111827))),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(8),
          ),
          width: double.infinity,
          child: Text(
            content,
            style: const TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Color(0xFF4B5563),
                fontFamily: 'Courier New'),
          ),
        ),
      ],
    );
  }
}
