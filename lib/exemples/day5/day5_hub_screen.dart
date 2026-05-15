import 'package:flutter/material.dart';

import 'block1_api_calls/b1_hub_screen.dart';
import 'block2_json_conversion/b2_hub_screen.dart';
import 'block3_pagination_search/b3_hub_screen.dart';
import 'widgets/root_hub.dart';

class Day5HubScreen extends StatelessWidget {
  const Day5HubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Day5RootHub(
      title: 'Dia 5 · Exemples',
      sections: [
        Day5HubSection(
          badge: '1',
          title: 'Bloc 1 · Crides API',
          subtitle: 'http, dio i FutureBuilder/StreamBuilder.',
          screen: Day5B1HubScreen(),
        ),
        Day5HubSection(
          badge: '2',
          title: 'Bloc 2 · Conversió JSON',
          subtitle:
              'fromJson manual i codegen amb json_serializable / freezed.',
          screen: Day5B2HubScreen(),
        ),
        Day5HubSection(
          badge: '3',
          title: 'Bloc 3 · Paginació i cerca',
          subtitle:
              'Scroll infinit (offset/limit) i cerca amb debounce.',
          screen: Day5B3HubScreen(),
        ),
      ],
    );
  }
}
