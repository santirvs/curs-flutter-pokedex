import 'package:flutter/material.dart';

import 'package:my_pokedex/exemples/day3/widgets/block_hub.dart';
import 'pagination_screen.dart';
import 'search_screen.dart';

class Day5B3HubScreen extends StatelessWidget {
  const Day5B3HubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Day3BlockHub(
      appBarTitle: 'Paginació i cerca',
      items: [
        Day3DemoItem(
          title: 'Scroll infinit · skip/limit',
          subtitle:
              'ScrollController, càrrega per pàgines i RefreshIndicator (DummyJSON).',
          screen: PaginationScreen(),
        ),
        Day3DemoItem(
          title: 'Cerca amb debounce',
          subtitle:
              'Petició amb Timer (debounce) a /products/search (DummyJSON).',
          screen: SearchScreen(),
        ),
      ],
    );
  }
}
