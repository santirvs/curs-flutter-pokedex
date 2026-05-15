import 'package:flutter/material.dart';
import 'package:my_pokedex/myApp/list/data/troop_repository.dart';

import '../../widgets/cards/troop_card.dart';

class MyListScreen extends StatelessWidget {
  const MyListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // Barra superior con el título 

      /* Ara es gestiona a la home screen
      appBar: AppBar(
        title: const Text(
          'Llista de tropes oficials',
          style: TextStyle(
            fontFamily: 'CoC', // Tu fuente personalizada
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown[700], // Un color estilo Clash of Clans
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      */
      // El cuerpo es el ListView que creamos antes
      body: const TroopListView(),
    );
  }
}

class TroopListView extends StatelessWidget {
  const TroopListView({super.key});


  @override
  Widget build(BuildContext context) { 

    // Obtenemos la lista de tropas
    final troops = TroopRepository().getTroops();
 
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: troops.length,
      itemBuilder: (context, index) {
        final troop = troops[index];
        return TroopCard(troop:troop, official:true);
      },
    );
  }
}


