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

      // Verify the counter starts at 0.
      expect(find.text('0'), findsOneWidget);

      // Finds the floating action button to tap on.
      final Finder fab1 = find.byTooltip('Increment');

      // Emulate a tap on the floating action button.
      await tester.tap(fab1);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 1.
      expect(find.text('1'), findsOneWidget);

      final Finder fab2 = find.byTooltip('Increment');

      // Emulate a tap on the floating action button.
      await tester.tap(fab2);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 2.
      expect(find.text('2'), findsOneWidget);
      final Finder fab3 = find.byTooltip('Increment');

      // Emulate a tap on the floating action button.
      await tester.tap(fab3);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 3.
      expect(find.text('3'), findsOneWidget);
      final Finder fab4 = find.byTooltip('Increment');

      // Emulate a tap on the floating action button.
      await tester.tap(fab4);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 4.
      expect(find.text('4'), findsOneWidget);
      final Finder fab5 = find.byTooltip('Increment');

      // Emulate a tap on the floating action button.
      await tester.tap(fab5);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 5.
      expect(find.text('5'), findsOneWidget);
    });
  });
}
