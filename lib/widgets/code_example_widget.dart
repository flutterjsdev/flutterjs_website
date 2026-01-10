import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

/// Code Example Widget
/// Displays syntax-highlighted code snippets showing FlutterJS usage
class CodeExampleWidget extends StatefulWidget {
  final String title;
  final List<CodeExample> examples;

  const CodeExampleWidget({
    super.key,
    required this.title,
    required this.examples,
  });

  @override
  State<CodeExampleWidget> createState() => _CodeExampleWidgetState();
}

class _CodeExampleWidgetState extends State<CodeExampleWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.examples.isEmpty ? 1 : widget.examples.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < AppTheme.mobileBreakpoint;
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      decoration: BoxDecoration(
        color: AppColors.backgroundDarkGray,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.borderLight.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: AppColors.textLight,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (widget.examples.isNotEmpty)
                IconButton(
                  icon: const Icon(Icons.copy, color: AppColors.textLight),
                  tooltip: 'Copy code',
                  onPressed: () => _copyCode(
                    context,
                    widget.examples[_tabController.index].code,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          // Tabs
          if (widget.examples.length > 1)
            TabBar(
              controller: _tabController,
              labelColor: AppColors.accentCyan,
              unselectedLabelColor: AppColors.textLight.withOpacity(0.6),
              indicatorColor: AppColors.accentCyan,
              onTap: (_) => setState(() {}),
              tabs: widget.examples
                  .map((ex) => Tab(text: ex.label))
                  .toList(),
            ),
          if (widget.examples.length <= 1) const SizedBox(height: 0),
          const SizedBox(height: 16),
          // Code content
          Container(
            width: double.infinity,
            constraints: const BoxConstraints(minHeight: 200),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: SelectableText(
                  widget.examples.isEmpty
                      ? '// No code examples available'
                      : widget.examples[_tabController.index].code,
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 14,
                    color: Color(0xFFE0E0E0),
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _copyCode(BuildContext context, String code) async {
    await Clipboard.setData(ClipboardData(text: code));
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Code copied to clipboard!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}

class CodeExample {
  final String label;
  final String code;

  const CodeExample({
    required this.label,
    required this.code,
  });
}
