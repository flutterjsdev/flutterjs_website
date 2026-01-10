import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../demos/routing_demo.dart';

/// Standalone Routing Demo Page
class DemoRoutingPage extends StatelessWidget {
  const DemoRoutingPage({super.key});

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
                'Routing Demo',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 24),
              const SizedBox(
                width: 500,
                child: RoutingDemo(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
