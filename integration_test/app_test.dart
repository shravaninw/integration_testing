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

      for (int i = 1; i <= 156; i++) {
        final Finder fab1 = find.byTooltip('Increment');

        // Emulate a tap on the floating action button.
        await tester.tap(fab1);

        // Trigger a frame.
        await tester.pumpAndSettle();

        // Verify the counter increments by 1.
        expect(find.text('${i}'), findsOneWidget);
      }
    });
  });
}
