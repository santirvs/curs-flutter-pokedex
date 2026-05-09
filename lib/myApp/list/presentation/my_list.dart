import 'package:flutter/material.dart';
import 'package:pokedex/myApp/list/data/troop_repository.dart';
import 'package:pokedex/myApp/admin/domain/troop_model.dart';

class MyListScreen extends StatelessWidget {
  const MyListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // Barra superior con el título
      appBar: AppBar(
        title: const Text(
          'Llista de tropes',
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

        return Card(
          color: troop.movement.color,
          elevation: 4,
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                // Imagen de la tropa
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    troop.imageUrl!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                    // Evita errores si la imagen aún no existe
                    errorBuilder: (context, error, stackTrace) => 
                        const Icon(Icons.person, size: 80),
                  ),
                ),
                const SizedBox(width: 16),
                // Información detallada
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        troop.name,
                        style: const TextStyle(
                          fontFamily: 'CoC', // Tu fuente personalizada
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text('Nivel: ${troop.level}', 
                           style: TextStyle(color: Colors.grey[700])),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _StatIcon(Icons.favorite, Colors.red, '${troop.life}'),
                          _StatIcon(Icons.flash_on, Colors.orange, '${troop.damage}'),
                          _StatIcon(Icons.ads_click, Colors.blue, '${troop.range}'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Widget auxiliar para los iconos de estadísticas (Vida, Daño, Rango)
class _StatIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String value;

  const _StatIcon(this.icon, this.color, this.value);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 16),
        const SizedBox(width: 4),
        Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
