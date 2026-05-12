import 'package:flutter/material.dart';

import 'package:my_pokedex/exemples/day3/widgets/block_hub.dart';
import 'provider_counter_screen.dart';
import 'riverpod_dio_post_screen.dart';
import 'riverpod_generator_counter_screen.dart';
import 'riverpod_manual_counter_screen.dart';

class Day5B4HubScreen extends StatelessWidget {
  const Day5B4HubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Day3BlockHub(
      appBarTitle: 'State management',
      items: [
        Day3DemoItem(
          title: 'Provider · ChangeNotifier',
          subtitle:
              'ChangeNotifierProvider, context.watch / context.read i un comptador.',
          screen: ProviderCounterScreen(),
        ),
        Day3DemoItem(
          title: 'Riverpod manual · Notifier',
          subtitle:
              'Notifier + NotifierProvider escrits a mà, sense codegen.',
          screen: RiverpodManualCounterScreen(),
        ),
        Day3DemoItem(
          title: 'Riverpod generator · @riverpod',
          subtitle:
              'Mateixa lògica amb riverpod_generator i un .g.dart generat.',
          screen: RiverpodGeneratorCounterScreen(),
        ),
        Day3DemoItem(
          title: 'Riverpod + dio · API call',
          subtitle:
              '@riverpod + AsyncValue.when per fer un GET amb dio i refrescar.',
          screen: RiverpodDioPostScreen(),
        ),
      ],
    );
  }
}
