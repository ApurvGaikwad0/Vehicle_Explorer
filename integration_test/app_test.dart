import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:cs442_mp6/main.dart' as app;
import 'package:cs442_mp6/pages/make_detail_page.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('vehicles_app integration test', () {
    testWidgets('1️⃣ Open detail page for the first make', (
      WidgetTester tester,
    ) async {
      app.main();
      await tester.pumpAndSettle();

      final firstMakeTile = find.byType(ListTile).first;
      expect(firstMakeTile, findsOneWidget);
      await tester.tap(firstMakeTile);

      await tester.pumpAndSettle();

      expect(find.byType(MakeDetailPage), findsOneWidget);

      expect(find.byType(Image), findsWidgets);
    });

    testWidgets('2️⃣ Favorite & unfavorite a make', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final firstCard = find.byType(Card).first;
      expect(firstCard, findsOneWidget);

      final cardWidget = tester.widget<Card>(firstCard);
      final rawKey = (cardWidget.key as ValueKey).value as String;
      final makeId = rawKey.replaceFirst('makeList', '');

      final favoriteIcon = find.byKey(Key('likeIcon$makeId'));
      expect(favoriteIcon, findsOneWidget);
      await tester.tap(favoriteIcon);
      await tester.pumpAndSettle();

      final fab = find.byType(FloatingActionButton);
      expect(fab, findsOneWidget);
      await tester.tap(fab);
      await tester.pumpAndSettle();

      final grid = find.byKey(const Key('favoriteMakeGrid'));
      expect(grid, findsOneWidget);
      expect(
        find.descendant(of: grid, matching: find.byKey(Key('favMake$makeId'))),
        findsOneWidget,
      );

      final heartInGrid = find.descendant(
        of: grid,
        matching: find.byIcon(Icons.favorite),
      );
      expect(heartInGrid, findsOneWidget);
      await tester.tap(heartInGrid);
      await tester.pumpAndSettle();

      expect(
        find.descendant(of: grid, matching: find.byKey(Key('favMake$makeId'))),
        findsNothing,
      );

      await tester.pageBack();
      await tester.pumpAndSettle();
    });
  });
}
