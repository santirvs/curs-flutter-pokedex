import 'package:flutter/material.dart';
import 'package:my_pokedex/features/authentication/presentation/loading_screen.dart'; // ignore: unused_import
import 'package:my_pokedex/features/home/presentation/home_screen.dart'; // ignore: unused_import
import 'package:my_pokedex/myApp/authentication/presentation/my_loading_screen.dart';

import 'exemples/day1/day1_hub_screen.dart'; // ignore: unused_import
import 'exemples/day2/day2_hub_screen.dart'; // ignore: unused_import
import 'exemples/day3/day3_hub_screen.dart'; // ignore: unused_import
import 'exemples/day4/day4_hub_screen.dart'; // ignore: unused_import
import 'exemples/day5/day5_hub_screen.dart'; // ignore: unused_import


void main() {
  runApp(const PokedexApp());
}

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Theme per CoC
      theme: ThemeData(
          fontFamily: 'CoC', // Configuración de la fuente global
          useMaterial3: true,
        ),

      //home: const Day5HubScreen(),
      // home: const LoadingScreen(),

      home: const MyLoadingScreen(),
    );
  }
}
