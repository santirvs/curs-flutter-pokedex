import 'package:flutter/material.dart';

import 'package:my_pokedex/exemples/day3/widgets/block_hub.dart';
import 'dio_basics_screen.dart';
import 'future_stream_builder_screen.dart';
import 'http_basics_screen.dart';

class Day5B1HubScreen extends StatelessWidget {
  const Day5B1HubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Day3BlockHub(
      appBarTitle: 'Crides API (http i dio)',
      items: [
        Day3DemoItem(
          title: 'http · GET bàsic',
          subtitle:
              'http.get, statusCode, jsonDecode, headers i timeouts.',
          screen: HttpBasicsScreen(),
        ),
        Day3DemoItem(
          title: 'dio · BaseOptions i interceptors',
          subtitle:
              'baseUrl, timeouts, queryParameters, DioException i logging.',
          screen: DioBasicsScreen(),
        ),
        Day3DemoItem(
          title: 'FutureBuilder i StreamBuilder',
          subtitle:
              'Pintar loading/data/error a partir de Future i Stream.',
          screen: FutureStreamBuilderScreen(),
        ),
      ],
    );
  }
}
