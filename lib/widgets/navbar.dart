import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

/// Navigation Bar Widget
/// Sticky navigation bar with FlutterJS branding and navigation links
class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < AppTheme.mobileBreakpoint;
    
    return AppBar(
      backgroundColor: AppColors.backgroundWhite,
      elevation: 1,
      shadowColor: Colors.black.withOpacity(0.1),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(isMobile ? 6 : 8),
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'FJS',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: isMobile ? 14 : 16,
              ),
            ),
          ),
          if (!isMobile) ...[
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                'FlutterJS',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryBlue,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ],
      ),
      actions: isMobile ? _buildMobileMenu(context) : _buildDesktopMenu(context),
    );
  }

  List<Widget> _buildDesktopMenu(BuildContext context) {
    return [
      _NavLink(text: 'Home', onTap: () {}),
      _NavLink(text: 'Features', onTap: () {}),
      _NavLink(text: 'Demos', onTap: () {}),
      _NavLink(text: 'Docs', onTap: () {}),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.code, size: 18),
          label: const Text('GitHub'),
        ),
      ),
      const SizedBox(width: 16),
    ];
  }

  List<Widget> _buildMobileMenu(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          // Mobile menu drawer would go here
        },
      ),
    ];
  }
}

class _NavLink extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _NavLink({
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
