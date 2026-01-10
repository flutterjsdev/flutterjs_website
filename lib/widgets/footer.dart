import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

/// Footer Widget
/// Footer with links to documentation, GitHub, examples, and copyright
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < AppTheme.mobileBreakpoint;
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 64,
        vertical: 48,
      ),
      decoration: BoxDecoration(
        color: AppColors.backgroundDarkGray,
        border: Border(
          top: BorderSide(
            color: AppColors.borderLight.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isMobile) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _FooterColumn(
                  title: 'FlutterJS',
                  links: [
                    {'text': 'About', 'url': '#'},
                    {'text': 'Getting Started', 'url': '#'},
                    {'text': 'Examples', 'url': '#'},
                  ],
                ),
                _FooterColumn(
                  title: 'Resources',
                  links: [
                    {'text': 'Documentation', 'url': '#'},
                    {'text': 'API Reference', 'url': '#'},
                    {'text': 'GitHub', 'url': '#'},
                  ],
                ),
                _FooterColumn(
                  title: 'Community',
                  links: [
                    {'text': 'Discord', 'url': '#'},
                    {'text': 'Twitter', 'url': '#'},
                    {'text': 'Stack Overflow', 'url': '#'},
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
          // Mobile layout
          if (isMobile) ...[
            _FooterColumn(
              title: 'FlutterJS',
              links: [
                {'text': 'About', 'url': '#'},
                {'text': 'Getting Started', 'url': '#'},
                {'text': 'Examples', 'url': '#'},
              ],
            ),
            const SizedBox(height: 24),
            _FooterColumn(
              title: 'Resources',
              links: [
                {'text': 'Documentation', 'url': '#'},
                {'text': 'API Reference', 'url': '#'},
                {'text': 'GitHub', 'url': '#'},
              ],
            ),
            const SizedBox(height: 24),
            _FooterColumn(
              title: 'Community',
              links: [
                {'text': 'Discord', 'url': '#'},
                {'text': 'Twitter', 'url': '#'},
                {'text': 'Stack Overflow', 'url': '#'},
              ],
            ),
            const SizedBox(height: 32),
          ],
          // Copyright
          Container(
            padding: const EdgeInsets.only(top: 24),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: AppColors.borderLight.withOpacity(0.2),
                  width: 1,
                ),
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  '© ${DateTime.now().year} FlutterJS. Built with Flutter and converted with FlutterJS.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.textLight.withOpacity(0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterColumn extends StatelessWidget {
  final String title;
  final List<Map<String, String>> links;

  const _FooterColumn({
    required this.title,
    required this.links,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            color: AppColors.textLight,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ...links.map((link) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: InkWell(
            onTap: () {},
            child: Text(
              link['text']!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.textLight.withOpacity(0.7),
              ),
            ),
          ),
        )),
      ],
    );
  }
}
