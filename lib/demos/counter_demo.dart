import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Interactive Counter Demo Widget
/// Demonstrates FlutterJS capability to run Flutter widgets with state management
class CounterDemo extends StatefulWidget {
  const CounterDemo({super.key});

  @override
  State<CounterDemo> createState() => _CounterDemoState();
}

class _CounterDemoState extends State<CounterDemo> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      _counter--;
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
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
            color: AppColors.primaryBlue.withOpacity(0.1),
            blurRadius: 30,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Counter Demo',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 32),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primaryBlue.withOpacity(0.15),
                  AppColors.primaryLightBlue.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.primaryBlue.withOpacity(0.3),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryBlue.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Text(
              '$_counter',
              style: theme.textTheme.displayLarge?.copyWith(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.w800,
                letterSpacing: 2,
                shadows: [
                  Shadow(
                    color: AppColors.primaryBlue.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 12,
            runSpacing: 12,
            children: [
              _AnimatedActionButton(
                onPressed: _decrement,
                icon: Icons.remove,
                label: 'Decrement',
                color: Colors.red,
                theme: theme.textTheme,
              ),
              _AnimatedActionButton(
                onPressed: _reset,
                icon: Icons.refresh,
                label: 'Reset',
                color: Colors.grey,
                theme: theme.textTheme,
                isOutlined: true,
              ),
              _AnimatedActionButton(
                onPressed: _increment,
                icon: Icons.add,
                label: 'Increment',
                color: AppColors.primaryBlue,
                theme: theme.textTheme,
              ),
            ],
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
                    'This counter works in real-time with FlutterJS!',
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

class _AnimatedActionButton extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;
  final Color color;
  final TextTheme theme;
  final bool isOutlined;

  const _AnimatedActionButton({
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.color,
    required this.theme,
    this.isOutlined = false,
  });

  @override
  State<_AnimatedActionButton> createState() => _AnimatedActionButtonState();
}

class _AnimatedActionButtonState extends State<_AnimatedActionButton>
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
            child: widget.isOutlined
                ? OutlinedButton.icon(
                    onPressed: widget.onPressed,
                    icon: Icon(widget.icon, size: 18),
                    label: Text(widget.label),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: widget.color,
                      side: BorderSide(color: widget.color, width: 2),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: _isHovered
                          ? widget.color.withOpacity(0.1)
                          : Colors.transparent,
                    ),
                  )
                : ElevatedButton.icon(
                    onPressed: widget.onPressed,
                    icon: Icon(widget.icon, size: 18),
                    label: Text(widget.label),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: widget.color,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      elevation: _isHovered ? 8 : 4,
                      shadowColor: widget.color.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
