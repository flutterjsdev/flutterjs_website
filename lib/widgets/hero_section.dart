import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

/// Hero Section Widget
/// Large banner section with headline, tagline, and CTA buttons
class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _slideAnimation = Tween<double>(begin: 30.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutCubic,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < AppTheme.mobileBreakpoint;
    
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: AppColors.heroGradient,
      ),
      child: Stack(
        children: [
          // Animated background elements - More prominent
          Positioned(
            right: -150,
            top: -150,
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _animationController.value * 2 * math.pi * 0.5,
                  child: Opacity(
                    opacity: 0.12,
                    child: Container(
                      width: 500,
                      height: 500,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            AppColors.primaryBlue,
                            AppColors.accentPurple.withOpacity(0.5),
                            AppColors.primaryBlue.withOpacity(0),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            left: -100,
            bottom: -100,
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.rotate(
                  angle: -_animationController.value * 2 * math.pi * 0.3,
                  child: Opacity(
                    opacity: 0.08,
                    child: Container(
                      width: 400,
                      height: 400,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            AppColors.accentPink,
                            AppColors.accentCyan.withOpacity(0.5),
                            AppColors.accentPink.withOpacity(0),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            margin: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 64,
              vertical: isMobile ? 48 : 96,
            ),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.3),
                  end: Offset.zero,
                ).animate(_slideAnimation),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Headline with gradient text - More prominent
                    ShaderMask(
                      shaderCallback: (bounds) => AppColors.vibrantGradient.createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      ),
                      child: Text(
                        'Build SEO-friendly\nwebsites with Flutter',
                        style: (isMobile
                                ? theme.textTheme.displaySmall?.copyWith(
                                    fontSize: 42,
                                    fontWeight: FontWeight.w900,
                                    height: 1.1,
                                    color: Colors.white,
                                    letterSpacing: -1,
                                  )
                                : theme.textTheme.displayLarge?.copyWith(
                                    fontSize: 80,
                                    fontWeight: FontWeight.w900,
                                    height: 1.05,
                                    color: Colors.white,
                                    letterSpacing: -2,
                                  ))
                            ?.copyWith(
                          shadows: [
                            Shadow(
                              color: AppColors.primaryBlue.withOpacity(0.4),
                              blurRadius: 30,
                              offset: const Offset(0, 6),
                            ),
                            Shadow(
                              color: AppColors.accentPurple.withOpacity(0.3),
                              blurRadius: 20,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        textAlign: isMobile ? TextAlign.center : TextAlign.left,
                      ),
                    ),
                    SizedBox(height: isMobile ? 20 : 32),
                    // Subtitle/Tagline - Better styling
                    Container(
                      constraints: BoxConstraints(maxWidth: isMobile ? double.infinity : 680),
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 0 : 0,
                        vertical: isMobile ? 0 : 8,
                      ),
                      child: Text(
                        'FlutterJS transforms your Flutter apps into production-ready, SEO-optimized web applications. Write once in Flutter, deploy everywhere with JavaScript.',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontSize: isMobile ? 18 : 22,
                          color: AppColors.textSecondary,
                          height: 1.8,
                          letterSpacing: 0.3,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: isMobile ? TextAlign.center : TextAlign.left,
                      ),
                    ),
                    SizedBox(height: isMobile ? 32 : 48),
                    // CTA Buttons
                    Wrap(
                      alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
                      spacing: 20,
                      runSpacing: 16,
                      children: [
                        _AnimatedButton(
                          onPressed: () {
                            // Scroll to getting started section
                          },
                          icon: Icons.rocket_launch,
                          label: 'Get Started',
                          isPrimary: true,
                          theme: theme.textTheme,
                          isMobile: isMobile,
                        ),
                        _AnimatedButton(
                          onPressed: () {
                            // Scroll to demos section
                          },
                          icon: Icons.play_circle_outline,
                          label: 'View Examples',
                          isPrimary: false,
                          theme: theme.textTheme,
                          isMobile: isMobile,
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    // Key points
                    if (!isMobile)
                      Wrap(
                        spacing: 40,
                        runSpacing: 20,
                        children: const [
                          _HeroFeature(
                            icon: Icons.search,
                            text: 'SEO-Friendly',
                          ),
                          _HeroFeature(
                            icon: Icons.speed,
                            text: 'High Performance',
                          ),
                          _HeroFeature(
                            icon: Icons.code,
                            text: 'Full Flutter Support',
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedButton extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;
  final bool isPrimary;
  final TextTheme theme;
  final bool isMobile;

  const _AnimatedButton({
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.isPrimary,
    required this.theme,
    required this.isMobile,
  });

  @override
  State<_AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<_AnimatedButton>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _isHovered ? _scaleAnimation.value : 1.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: widget.isPrimary ? AppColors.buttonGradient : null,
                borderRadius: BorderRadius.circular(12),
                boxShadow: _isHovered
                    ? [
                        BoxShadow(
                          color: (widget.isPrimary
                                  ? AppColors.primaryBlue
                                  : AppColors.primaryBlue)
                              .withOpacity(0.4),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ]
                    : AppColors.softShadow != null
                        ? [AppColors.softShadow!]
                        : null,
              ),
              child: widget.isPrimary
                  ? ElevatedButton.icon(
                      onPressed: widget.onPressed,
                      icon: const Icon(Icons.rocket_launch),
                      label: Text(widget.label),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(
                          horizontal: widget.isMobile ? 28 : 36,
                          vertical: 18,
                        ),
                        textStyle: widget.theme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    )
                  : OutlinedButton.icon(
                      onPressed: widget.onPressed,
                      icon: const Icon(Icons.play_circle_outline),
                      label: Text(widget.label),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.primaryBlue,
                        side: const BorderSide(color: AppColors.primaryBlue, width: 2),
                        padding: EdgeInsets.symmetric(
                          horizontal: widget.isMobile ? 28 : 36,
                          vertical: 18,
                        ),
                        textStyle: widget.theme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: _isHovered
                            ? AppColors.primaryBlue.withOpacity(0.1)
                            : Colors.transparent,
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}

class _HeroFeature extends StatefulWidget {
  final IconData icon;
  final String text;

  const _HeroFeature({
    required this.icon,
    required this.text,
  });

  @override
  State<_HeroFeature> createState() => _HeroFeatureState();
}

class _HeroFeatureState extends State<_HeroFeature>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
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
          return Transform.translate(
            offset: Offset(0, _isHovered ? -4 : 0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue.withOpacity(_controller.value * 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.primaryBlue.withOpacity(_controller.value * 0.3),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue.withOpacity(_isHovered ? 0.2 : 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      widget.icon,
                      color: AppColors.primaryBlue,
                      size: 20 + (_controller.value * 4),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    widget.text,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: AppColors.textSecondary,
                      fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
