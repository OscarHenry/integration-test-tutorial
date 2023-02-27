import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_test_tutorial/main.dart' as app;
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {

    testWidgets('tap on increment action button, verify counter',
            (tester) async {
      app.main();
          await tester.pumpAndSettle();

          // Verify the counter starts at 0.
          expect(find.text('0'), findsOneWidget);

          // Finds the Increment button to tap on.
          final Finder fab = find.byKey(const Key('Increment'));

          // Emulate a tap on button.
          await tester.tap(fab);

          // Trigger a frame.
          await tester.pumpAndSettle();

          // Verify the counter increments by 1.
          expect(find.text('1'), findsOneWidget);
        });

    testWidgets('tap on decrement button, verify counter',
            (tester) async {
              app.main();

              await tester.pumpAndSettle();

          // Verify the counter starts at 0.
          expect(find.text('0'), findsOneWidget);

          // Finds the decrement action button to tap on.
          final Finder fab = find.byKey(const Key('Decrement'));

          // Emulate a tap on action button.
          await tester.tap(fab);

          // Trigger a frame.
          await tester.pumpAndSettle();

          // Verify the counter decrement by -1.
          expect(find.text('-1'), findsOneWidget);
        });
  });
}