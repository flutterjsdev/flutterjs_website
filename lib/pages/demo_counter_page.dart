import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../demos/counter_demo.dart';

/// Standalone Counter Demo Page
class DemoCounterPage extends StatelessWidget {
  const DemoCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Counter Demo',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 24),
              const SizedBox(
                width: 500,
                child: CounterDemo(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
