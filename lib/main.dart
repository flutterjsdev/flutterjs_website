import 'package:flutter/material.dart';
import 'package:flutterjs_seo/flutterjs_seo.dart';
import 'pages/documentation_page.dart';
import 'pages/showcase_page.dart';
import 'pages/blog_page.dart';
import 'pages/about_page.dart';
import 'pages/contact_page.dart';
import 'pages/privacy_page.dart';
import 'pages/terms_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterJS - Native Web Apps',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4F46E5),
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            textStyle: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF4B5563),
            textStyle: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        '/docs': (context) => const DocumentationPage(),
        '/showcase': (context) => const ShowcasePage(),
        '/blog': (context) => const BlogPage(),
        '/about': (context) => const AboutPage(),
        '/contact': (context) => const ContactPage(),
        '/privacy': (context) => const PrivacyPage(),
        '/terms': (context) => const TermsPage(),
      },
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String _seoTitle = "FlutterJS - The Native Web Framework";

  @override
  Widget build(BuildContext context) {
    return Seo(
      title: _seoTitle,
      debug: false,
      meta: {
        "description":
            "Build high-performance web applications with Dart and Flutter's widget system. Tiny bundles, SEO friendly, and direct DOM manipulation.",
        "keywords": "flutter, web, javascript, framework, dart, seo",
        "og:title": "FlutterJS - The Native Web Framework",
        "og:description":
            "The power of Flutter widgets, now compiled to lightweight, SEO-friendly JavaScript."
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            _buildNavBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildHeroSection(),
                    _buildFeaturesSection(),
                    _buildCodePreviewSection(),
                    _buildCommunitySection(),
                    _buildFooter(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavBar() {
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
          // Hide links on very small screens if needed, but for now we look fine
          if (MediaQuery.of(context).size.width > 700) ...[
            TextButton(
                onPressed: () => Navigator.pushNamed(context, '/docs'),
                child: const Text('Documentation')),
            TextButton(
                onPressed: () => Navigator.pushNamed(context, '/showcase'),
                child: const Text('Showcase')),
            TextButton(
                onPressed: () => Navigator.pushNamed(context, '/blog'),
                child: const Text('Blog')),
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

  Widget _buildHeroSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 80, 24, 80),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFEEF2FF),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Text(
              "🚀 v0.0.1 is now available!",
              style: TextStyle(
                  color: Color(0xFF4F46E5),
                  fontWeight: FontWeight.w600,
                  fontSize: 13),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Build Native Web Apps\nwith the Power of Dart',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w800,
              color: Color(0xFF111827), // Gray 900
              height: 1.1,
              letterSpacing: -1.0,
            ),
          ),
          const SizedBox(height: 24),
          const SizedBox(
            width: 700,
            child: Text(
              'Tiny bundles. Perfect SEO. Direct DOM rendering.\nExperience the developer experience of Flutter with the performance of native HTML & CSS.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF6B7280), // Gray 500
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/docs'),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                child: const Text('Start Building'),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF4B5563),
                  side: BorderSide(color: Colors.grey.shade300),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                child: const Text('View on GitHub'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturesSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      color: const Color(0xFFF9FAFB), // Gray 50
      child: Column(
        children: [
          const Text(
            'Why developers love FlutterJS',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111827)),
          ),
          const SizedBox(height: 16),
          const Text(
            'Everything you need to build production-ready web applications.',
            style: TextStyle(fontSize: 18, color: Color(0xFF6B7280)),
          ),
          const SizedBox(height: 64),
          Wrap(
            spacing: 32,
            runSpacing: 32,
            alignment: WrapAlignment.center,
            children: [
              _buildFeatureCard(
                icon: Icons.flash_on,
                title: 'Blazing Fast',
                description:
                    'Optimized for instant load times with bundles starting at just 50KB gzipped.',
                color: Colors.orange,
              ),
              _buildFeatureCard(
                icon: Icons.search,
                title: 'SEO Optimized',
                description:
                    'Content is rendered as semantic HTML, making it fully indexable by search engines.',
                color: Colors.green,
              ),
              _buildFeatureCard(
                icon: Icons.code,
                title: 'Type Safe',
                description:
                    'Leverage the full power of Dart\'s sound null safety and strong typing.',
                color: Colors.blue,
              ),
              _buildFeatureCard(
                icon: Icons.widgets,
                title: 'Widget System',
                description:
                    'Use the familiar Flutter widget API to compose your UI declaratively.',
                color: Colors.indigo,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(
      {required IconData icon,
      required String title,
      required String description,
      required Color color}) {
    return Container(
      width: 280,
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
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111827)),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(color: Color(0xFF6B7280), height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildCodePreviewSection() {
    final codeSnippet = '''
class Counter extends StatefulWidget {
  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count: \$count'),
        ElevatedButton(
           onPressed: () => setState(() => count++),
           child: Text('Increment'),
        ),
      ],
    );
  }
}
''';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFEEF2FF),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Text(
              "Simple & Declarative",
              style: TextStyle(
                  color: Color(0xFF4F46E5),
                  fontWeight: FontWeight.w600,
                  fontSize: 13),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Write Dart. Run everywhere.',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111827)),
          ),
          const SizedBox(height: 48),
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 900),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B), // Slate 800
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                  width: 10,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFFF5F56),
                                      shape: BoxShape.circle)),
                              const SizedBox(width: 8),
                              Container(
                                  width: 10,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFFFBD2E),
                                      shape: BoxShape.circle)),
                              const SizedBox(width: 8),
                              Container(
                                  width: 10,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFF27C93F),
                                      shape: BoxShape.circle)),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            codeSnippet,
                            style: const TextStyle(
                              fontFamily: 'Courier New',
                              color: Color(0xFFE2E8F0),
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(width: 1, color: Colors.white.withOpacity(0.1)),
                  // Preview Area
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("Count: 0",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                          const SizedBox(height: 16),
                          ElevatedButton(
                              onPressed: () {}, child: const Text("Increment"))
                        ],
                      )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommunitySection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      color: Colors.white,
      child: Column(
        children: [
          const Text(
            'Join the Community',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111827)),
          ),
          const SizedBox(height: 16),
          const Text(
            "Open source and built for the future web.",
            style: TextStyle(color: Color(0xFF6B7280), fontSize: 16),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: const Icon(Icons.code, size: 32),
                  onPressed: () {},
                  color: Colors.indigo), // Placeholder for GitHub
              const SizedBox(width: 24),
              IconButton(
                  icon: const Icon(Icons.chat_bubble, size: 32),
                  onPressed: () {},
                  color: Colors.indigo), // Placeholder for Discord
              const SizedBox(width: 24),
              IconButton(
                  icon: const Icon(Icons.thumb_up, size: 32),
                  onPressed: () {},
                  color: Colors.indigo), // Placeholder for Twitter/X
            ],
          )
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      color: const Color(0xFF111827), // Gray 900
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.flutter_dash,
                              color: Colors.white, size: 24),
                          SizedBox(width: 8),
                          Text("FlutterJS",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text("Write Flutter. Ship the Web.",
                          style: TextStyle(
                              color: Colors.grey.shade400, height: 1.5)),
                    ],
                  ),
                  const SizedBox(width: 24),
                  if (MediaQuery.of(context).size.width > 600)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFooterLinksColumn("Product", [
                          _FooterLink("Features", () {}),
                          _FooterLink("Showcase",
                              () => Navigator.pushNamed(context, '/showcase')),
                          _FooterLink("Roadmap", () {}),
                        ]),
                        const SizedBox(width: 48),
                        _buildFooterLinksColumn("Resources", [
                          _FooterLink("Documentation",
                              () => Navigator.pushNamed(context, '/docs')),
                          _FooterLink("API Reference", () {}),
                          _FooterLink("Examples", () {}),
                        ]),
                        const SizedBox(width: 48),
                        _buildFooterLinksColumn("Company", [
                          _FooterLink("About",
                              () => Navigator.pushNamed(context, '/about')),
                          _FooterLink("Blog",
                              () => Navigator.pushNamed(context, '/blog')),
                          _FooterLink("Contact",
                              () => Navigator.pushNamed(context, '/contact')),
                        ]),
                      ],
                    ),
                ],
              ),
              const SizedBox(height: 48),
              Divider(color: Colors.grey.shade800),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("© 2026 FlutterJS Team. Apache 2.0 License.",
                      style:
                          TextStyle(color: Colors.grey.shade500, fontSize: 14)),
                  Row(
                    children: [
                      InkWell(
                          onTap: () => Navigator.pushNamed(context, '/privacy'),
                          child: const Text("Privacy",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14))),
                      const SizedBox(width: 16),
                      InkWell(
                          onTap: () => Navigator.pushNamed(context, '/terms'),
                          child: const Text("Terms",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14))),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooterLinksColumn(String title, List<_FooterLink> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14)),
        const SizedBox(height: 16),
        ...links.map((link) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: InkWell(
                onTap: link.onTap,
                child: Text(link.title,
                    style:
                        TextStyle(color: Colors.grey.shade400, fontSize: 14)),
              ),
            )),
      ],
    );
  }
}

class _FooterLink {
  final String title;
  final VoidCallback onTap;

  _FooterLink(this.title, this.onTap);
}

