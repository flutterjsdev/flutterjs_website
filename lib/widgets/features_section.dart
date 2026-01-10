import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

/// Features Section Widget
/// Grid layout showing key FlutterJS features
class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < AppTheme.mobileBreakpoint;
    final isTablet = MediaQuery.of(context).size.width < AppTheme.tabletBreakpoint;
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 64,
        vertical: 64,
      ),
      color: AppColors.backgroundWhite,
      child: Column(
        children: [
          // Section header - More prominent
          ShaderMask(
            shaderCallback: (bounds) => AppColors.primaryGradient.createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
            child: Text(
              'Why FlutterJS?',
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
              'Everything you need to build beautiful, production-ready web applications from Flutter code.',
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
          // Features grid
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);
              final spacing = isMobile ? 24.0 : 32.0;
              
              return GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: spacing,
                mainAxisSpacing: spacing,
                childAspectRatio: isMobile ? 1.2 : 0.9,
                children: [
                  _FeatureCard(
                    icon: Icons.search,
                    title: 'SEO-Friendly',
                    description:
                        'Generate SEO-optimized HTML that search engines can crawl and index effectively.',
                    color: AppColors.primaryBlue,
                  ),
                  _FeatureCard(
                    icon: Icons.widgets,
                    title: 'Full Flutter Compatibility',
                    description:
                        'All Flutter widgets and features work seamlessly. Write Flutter, get JavaScript.',
                    color: Colors.green,
                  ),
                  _FeatureCard(
                    icon: Icons.speed,
                    title: 'High Performance',
                    description:
                        'Optimized output ensures fast load times and smooth user interactions.',
                    color: Colors.orange,
                  ),
                  _FeatureCard(
                    icon: Icons.cloud_upload,
                    title: 'Easy Deployment',
                    description:
                        'Deploy anywhere JavaScript runs. No special servers or infrastructure needed.',
                    color: Colors.purple,
                  ),
                  _FeatureCard(
                    icon: Icons.refresh,
                    title: 'Hot Reload Support',
                    description:
                        'Fast development workflow with hot reload during development.',
                    color: Colors.teal,
                  ),
                  _FeatureCard(
                    icon: Icons.code,
                    title: 'Clean JavaScript',
                    description:
                        'Produces clean, readable JavaScript code that\'s easy to debug and maintain.',
                    color: Colors.indigo,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  State<_FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<_FeatureCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _elevationAnimation = Tween<double>(begin: 2.0, end: 8.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Transform.translate(
              offset: Offset(0, -_controller.value * 8),
              child: Container(
                decoration: BoxDecoration(
                  gradient: _isHovered
                      ? LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            widget.color.withOpacity(0.05),
                            AppColors.backgroundWhite,
                          ],
                        )
                      : null,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: widget.color.withOpacity(_controller.value * 0.3),
                      blurRadius: 20 * _elevationAnimation.value / 4,
                      offset: Offset(0, 4 + (_controller.value * 8)),
                      spreadRadius: _controller.value * 2,
                    ),
                    AppColors.softShadow!,
                  ],
                ),
                child: Card(
                  elevation: 0,
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: widget.color.withOpacity(_controller.value * 0.3),
                      width: 1 + (_controller.value * 1),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: EdgeInsets.all(14 + (_controller.value * 2)),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                widget.color.withOpacity(0.15 + (_controller.value * 0.1)),
                                widget.color.withOpacity(0.05 + (_controller.value * 0.05)),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: widget.color.withOpacity(0.2 * _controller.value),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Icon(
                            widget.icon,
                            color: widget.color,
                            size: 36 + (_controller.value * 4),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          widget.title,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: _isHovered
                                ? widget.color
                                : AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Expanded(
                          child: Text(
                            widget.description,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: AppColors.textSecondary,
                              height: 1.7,
                              letterSpacing: 0.1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
