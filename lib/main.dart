import 'package:flutter/material.dart';
import 'package:pokedex/features/authentication/presentation/loading_screen.dart'; // ignore: unused_import
import 'package:pokedex/features/home/presentation/home_screen.dart'; // ignore: unused_import
import 'package:pokedex/myApp/authentication/presentation/my_loading_screen.dart';

import 'exemples/day1/day1_hub_screen.dart'; // ignore: unused_import
import 'exemples/day2/day2_hub_screen.dart'; // ignore: unused_import
import 'exemples/day3/day3_hub_screen.dart'; // ignore: unused_import
import 'exemples/day4/day4_hub_screen.dart'; // ignore: unused_import

void main() {
  runApp(const PokedexApp());
}

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: const Day4HubScreen(),
      //home: const LoadingScreen(),

      home: const MyLoadingScreen(),
    );
  }
}
