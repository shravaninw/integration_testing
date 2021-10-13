import 'package:flutter/cupertino.dart';
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

//
//      }
    });
  });
}
