import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

void main() {
  testWidgets('ContextMenu toggles the active menu instead of stacking',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ShadcnApp(
        theme: ThemeData(
          colorScheme: ColorSchemes.lightZinc(),
          radius: 0.7,
        ),
        home: const Scaffold(
          child: Center(
            child: ContextMenu(
              items: const [
                MenuButton(
                  child: Text('Menu Action'),
                ),
              ],
              child: SizedBox(
                key: Key('context-menu-target'),
                width: 120,
                height: 48,
              ),
            ),
          ),
        ),
      ),
    );

    final target = find.byKey(const Key('context-menu-target'));
    final tapPosition = tester.getCenter(target);

    await tester.tapAt(tapPosition);
    await tester.pumpAndSettle();
    expect(find.text('Menu Action'), findsOneWidget);

    await tester.tapAt(tapPosition);
    await tester.pumpAndSettle();
    expect(find.text('Menu Action'), findsNothing);

    await tester.tapAt(tapPosition);
    await tester.pumpAndSettle();
    expect(find.text('Menu Action'), findsOneWidget);
  });
}
