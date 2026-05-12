// Basic smoke test for the Pokédex app.

import 'package:flutter_test/flutter_test.dart';

import 'package:my_pokedex/main.dart';

void main() {
  testWidgets('App boots and shows the title', (tester) async {
    await tester.pumpWidget(const PokedexApp());

    expect(find.text('Pokédex'), findsOneWidget);
  });
}
