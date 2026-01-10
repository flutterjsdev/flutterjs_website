// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutterjs_website/app.dart';

void main() {
  testWidgets('FlutterJS App loads successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FlutterJSApp());

    // Verify that the app loads (FlutterJS text appears at least once)
    expect(find.text('FlutterJS'), findsWidgets);
    
    // Verify that the main content is present (hero headline)
    expect(find.textContaining('Build SEO-friendly'), findsOneWidget);
    
    // Verify features section is present
    expect(find.text('Why FlutterJS?'), findsOneWidget);
  });
}
