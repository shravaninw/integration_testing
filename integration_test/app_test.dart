import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integrationtesting/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter',
        (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();

      // Verify the counter starts at 0
      for (int i = 1; i <= 15; i++) {
        final Finder fab1 = find.byTooltip('Increment');

        // Emulate a tap on the floating action button.
        await tester.tap(fab1);

        // Trigger a frame.
        await tester.pumpAndSettle();

        // Verify the counter increments by 1.
        expect(find.text('$i'), findsOneWidget);
      }
    });
    testWidgets('scroll Test', (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();

      final Finder fab = find.text('Next');
      await tester.tap(fab);
      await tester.pumpAndSettle();

      final listFinder = find.byType(Scrollable);
      final itemFinder = find.text('Item 56');

      // Scroll until the item to be found appears.
      await tester.scrollUntilVisible(
        itemFinder,
        500.0,
        scrollable: listFinder,
      );
      expect(itemFinder, findsOneWidget);

      // Verify that the item contains the correct text.
      await tester.tap(itemFinder);

      await tester.pumpAndSettle();

      expect(find.text('56'), findsOneWidget);
    });
  });
}
