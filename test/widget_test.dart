import 'package:cs442_mp6/widgets/make_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cs442_mp6/model/make_model.dart';
import 'package:cs442_mp6/widgets/custom_fab.dart';
import 'package:cs442_mp6/widgets/custom_image.dart';
import 'package:cs442_mp6/widgets/custom_detail_image.dart';
import 'package:cs442_mp6/widgets/make_title.dart';

void main() {
  testWidgets('CustomFloatingActionButton renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: CustomFloatingActionButton()),
    );
    expect(find.byType(CustomFloatingActionButton), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsOneWidget);
  });

  testWidgets('CustomImage renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CustomImage(imagePath: 'assets/vehicle_a.png'),
      ),
    );
    expect(find.byType(CustomImage), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('CustomDetailImage renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CustomDetailImage(imagePath: 'assets/vehicle_b.png'),
      ),
    );
    expect(find.byType(CustomDetailImage), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('MakeTitle renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: MakeTitle(title: 'Test Vehicle Make'),
      ),
    );
    expect(find.byType(MakeTitle), findsOneWidget);
    expect(find.text('Test Vehicle Make'), findsOneWidget);
  });

  testWidgets('MakeCard renders correctly', (WidgetTester tester) async {
    final testMake = VehicleMake(
      makeId: 1,
      makeName: 'Test Make',
      image: 'assets/vehicle_a.png',
    );

    bool favoriteTapped = false;
    bool cardTapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MakeCard(
            make: testMake,
            isFavorite: true,
            onFavoriteToggle: () {
              favoriteTapped = true;
            },
            onTap: () {
              cardTapped = true;
            },
          ),
        ),
      ),
    );

    expect(find.byType(MakeCard), findsOneWidget);
    expect(find.byType(Card), findsOneWidget);
    expect(find.byType(CustomImage), findsOneWidget);
    expect(find.byType(MakeTitle), findsOneWidget);
    expect(find.text('Test Make'), findsOneWidget);

    final favoriteIcon =
        tester.widget<Icon>(find.byKey(const Key('likeIcon1')));
    expect(favoriteIcon.color, Colors.red);

    await tester.tap(find.byKey(const Key('likeIcon1')));
    expect(favoriteTapped, isTrue);

    await tester.tap(find.byType(ListTile));
    expect(cardTapped, isTrue);
  });
}
