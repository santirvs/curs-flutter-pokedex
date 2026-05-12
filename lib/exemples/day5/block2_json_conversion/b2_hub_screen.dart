import 'package:flutter/material.dart';

import 'package:my_pokedex/exemples/day3/widgets/block_hub.dart';
import 'codegen_parsing_screen.dart';
import 'manual_parsing_screen.dart';

class Day5B2HubScreen extends StatelessWidget {
  const Day5B2HubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Day3BlockHub(
      appBarTitle: 'Conversió JSON ↔ classes Dart',
      items: [
        Day3DemoItem(
          title: 'Conversió manual',
          subtitle: 'fromJson / toJson sense codegen.',
          screen: ManualParsingScreen(),
        ),
        Day3DemoItem(
          title: 'json_serializable i freezed',
          subtitle: 'Mateix JSON, build_runner.',
          screen: CodegenParsingScreen(),
        ),
      ],
    );
  }
}
