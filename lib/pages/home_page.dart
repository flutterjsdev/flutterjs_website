import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/footer.dart';
import '../widgets/hero_section.dart';
import '../widgets/features_section.dart';
import '../widgets/demos_section.dart';
import '../widgets/code_example_widget.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

/// Home Page
/// Main landing page combining all sections
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < AppTheme.mobileBreakpoint;
    
    return Scaffold(
      appBar: const NavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            const HeroSection(),
            
            // Features Section
            const FeaturesSection(),
            
            // Code Examples Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 64,
                vertical: 64,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.backgroundWhite,
                    AppColors.backgroundLightGray,
                  ],
                ),
              ),
              child: Column(
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => AppColors.primaryGradient.createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                    child: Text(
                      'Quick Start',
                      style: theme.textTheme.displaySmall?.copyWith(
                        fontSize: isMobile ? 36 : 48,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: -1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 700),
                    child: Text(
                      'Get started with FlutterJS in minutes. Convert your Flutter app to JavaScript with a single command.',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontSize: isMobile ? 18 : 22,
                        color: AppColors.textSecondary,
                        height: 1.7,
                        letterSpacing: 0.2,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 48),
                  // Code example widget
                  CodeExampleWidget(
                    title: 'FlutterJS Usage Examples',
                    examples: const [
                      CodeExample(
                        label: 'Quick Start',
                        code: '''// 1. Install FlutterJS
dart pub global activate flutterjs

// 2. Convert your Flutter app
flutterjs run --to-js --serve

// 3. That's it! Your app is now running as JavaScript.''',
                      ),
                      CodeExample(
                        label: 'Build for Production',
                        code: '''// Build for production
flutterjs build

// The output will be in the build/web directory
// Deploy to any static hosting service:
// - Netlify
// - Vercel
// - GitHub Pages
// - AWS S3
// - Or any web server''',
                      ),
                      CodeExample(
                        label: 'With Options',
                        code: '''// Run with custom options
flutterjs run --to-js --serve --port 4000 -v

// Options:
// --to-js      : Convert Flutter to JavaScript
// --serve      : Start development server
// --port       : Specify port (default: 8080)
// -v, --verbose: Enable verbose logging''',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Demos Section
            const DemosSection(),
            
            // Getting Started Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 64,
                vertical: 64,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primaryBlue.withOpacity(0.1),
                    AppColors.backgroundWhite,
                  ],
                ),
              ),
              child: Column(
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => AppColors.primaryGradient.createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                    child: Text(
                      'Get Started',
                      style: theme.textTheme.displaySmall?.copyWith(
                        fontSize: isMobile ? 36 : 48,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: -1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 700),
                    child: Text(
                      'Ready to build your first FlutterJS website? Follow these simple steps.',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontSize: isMobile ? 18 : 22,
                        color: AppColors.textSecondary,
                        height: 1.7,
                        letterSpacing: 0.2,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 48),
                  // Steps
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (isMobile) {
                        return Column(
                          children: _buildSteps(context),
                        );
                      } else {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: _buildSteps(context),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 48),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('Read Full Documentation'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      textStyle: theme.textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ),
            
            // Footer
            const Footer(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSteps(BuildContext context) {
    return [
      _StepCard(
        number: '1',
        title: 'Install',
        description: 'Install FlutterJS using Dart pub',
        icon: Icons.download,
      ),
      const SizedBox(height: 24, width: 24),
      _StepCard(
        number: '2',
        title: 'Convert',
        description: 'Convert your Flutter app to JavaScript',
        icon: Icons.transform,
      ),
      const SizedBox(height: 24, width: 24),
      _StepCard(
        number: '3',
        title: 'Deploy',
        description: 'Deploy to any static hosting service',
        icon: Icons.cloud_upload,
      ),
    ];
  }
}

class _StepCard extends StatelessWidget {
  final String number;
  final String title;
  final String description;
  final IconData icon;

  const _StepCard({
    required this.number,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Flexible(
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Center(
                  child: Text(
                    number,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Icon(
                icon,
                size: 32,
                color: AppColors.primaryBlue,
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
