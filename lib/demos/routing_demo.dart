import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Routing Demo Widget
/// Demonstrates FlutterJS routing capabilities with multiple pages
class RoutingDemo extends StatefulWidget {
  const RoutingDemo({super.key});

  @override
  State<RoutingDemo> createState() => _RoutingDemoState();
}

class _RoutingDemoState extends State<RoutingDemo> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      'title': 'Home',
      'icon': Icons.home,
      'content': 'Welcome to the Home page! This demonstrates FlutterJS routing capabilities.',
      'color': Colors.blue,
    },
    {
      'title': 'About',
      'icon': Icons.info,
      'content': 'This is the About page. FlutterJS enables SEO-friendly routing for Flutter apps.',
      'color': Colors.green,
    },
    {
      'title': 'Contact',
      'icon': Icons.contact_mail,
      'content': 'Contact page is here! Each route works seamlessly with FlutterJS.',
      'color': Colors.orange,
    },
  ];

  void _navigateTo(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currentPage = _pages[_currentIndex];
    
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: AppColors.cardGradient,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.borderLight,
          width: 1,
        ),
        boxShadow: [
          AppColors.mediumShadow,
          BoxShadow(
            color: (currentPage['color'] as Color).withOpacity(0.1),
            blurRadius: 30,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Routing Demo',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          // Navigation tabs
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: List.generate(
              _pages.length,
              (index) => ChoiceChip(
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _pages[index]['icon'],
                      size: 16,
                    ),
                    const SizedBox(width: 6),
                    Text(_pages[index]['title']),
                  ],
                ),
                selected: _currentIndex == index,
                onSelected: (_) => _navigateTo(index),
                selectedColor: currentPage['color'].withOpacity(0.3),
                backgroundColor: Colors.grey.shade200,
                labelStyle: TextStyle(
                  color: _currentIndex == index
                      ? currentPage['color']
                      : Colors.black87,
                  fontWeight: _currentIndex == index
                      ? FontWeight.bold
                      : FontWeight.normal,
                  fontSize: 12,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Page content with animation
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  (currentPage['color'] as Color).withOpacity(0.15),
                  (currentPage['color'] as Color).withOpacity(0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: (currentPage['color'] as Color).withOpacity(0.4),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: (currentPage['color'] as Color).withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: (currentPage['color'] as Color).withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    currentPage['icon'],
                    size: 56,
                    color: currentPage['color'],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  currentPage['title'],
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: currentPage['color'],
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  currentPage['content'],
                  style: theme.textTheme.bodyLarge?.copyWith(
                    height: 1.7,
                    letterSpacing: 0.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.successGreen.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.successGreen.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle,
                  color: AppColors.successGreen,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    'Navigate between pages - All working with FlutterJS!',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.successGreen,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
