import 'package:flutter/material.dart';
import '../demos/counter_demo.dart';
import '../demos/routing_demo.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

/// Demos Section Widget
/// Showcase cards for Counter and Routing demos with embedded demos
class DemosSection extends StatelessWidget {
  const DemosSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < AppTheme.mobileBreakpoint;
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 64,
        vertical: 80,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.backgroundLightGray,
            AppColors.backgroundWhite,
            AppColors.backgroundLightGray,
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
      child: Column(
        children: [
          // Section header - More prominent
          ShaderMask(
            shaderCallback: (bounds) => AppColors.vibrantGradient.createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
            child: Text(
              'Try FlutterJS',
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
              'See FlutterJS in action with these interactive demos. All running in real-time!',
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
          // Demos grid
          LayoutBuilder(
            builder: (context, constraints) {
              if (isMobile) {
                return Column(
                  children: const [
                    _DemoCard(
                      title: 'Counter App',
                      description:
                          'A simple counter app demonstrating state management in FlutterJS.',
                      demo: CounterDemo(),
                    ),
                    SizedBox(height: 32),
                    _DemoCard(
                      title: 'Routing App',
                      description:
                          'Multi-page navigation demo showing FlutterJS routing capabilities.',
                      demo: RoutingDemo(),
                    ),
                  ],
                );
              } else {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Expanded(
                      child: _DemoCard(
                        title: 'Counter App',
                        description:
                            'A simple counter app demonstrating state management in FlutterJS.',
                        demo: CounterDemo(),
                      ),
                    ),
                    SizedBox(width: 32),
                    Expanded(
                      child: _DemoCard(
                        title: 'Routing App',
                        description:
                            'Multi-page navigation demo showing FlutterJS routing capabilities.',
                        demo: RoutingDemo(),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class _DemoCard extends StatelessWidget {
  final String title;
  final String description;
  final Widget demo;

  const _DemoCard({
    required this.title,
    required this.description,
    required this.demo,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 24),
        // Embedded demo
        Center(child: demo),
      ],
    );
  }
}
