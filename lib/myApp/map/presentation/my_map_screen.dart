import 'package:flutter/material.dart';

import '../../admin/domain/pokemon_model.dart';
import 'my_map_screen_controller.dart';
import 'widgets/pannable_map.dart';
import 'widgets/pokemon_map_marker.dart';

class MyMapScreen extends StatefulWidget {
  const MyMapScreen({super.key});

  @override
  State<MyMapScreen> createState() => _MyMapScreenState();
}

class _MyMapScreenState extends State<MyMapScreen> {
  late final List<PokemonMapPlacement> _placements;
  final List<Pokemon> _mapPokemons = [];

  @override
  void initState() {
    super.initState();
    _placements = randomPlacementsForPokemons(_mapPokemons);
  }

  void _onPokemonTap(Pokemon pokemon) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(pokemon.name)));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final viewportSize = Size(constraints.maxWidth, constraints.maxHeight);
        final mapSize = MyMapScreenController.layoutMapSize(viewportSize);

        return PannableMap(
          mapSize: mapSize,
          viewportSize: viewportSize,
          child: Stack(
            children: [
              Image.asset(
                'assets/images/map.jpg',
                width: mapSize.width,
                height: mapSize.height,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.medium,
              ),
              for (final placement in _placements)
                PokemonMapMarker(
                  placement: placement,
                  mapSize: mapSize,
                  onTap: _onPokemonTap,
                  size: 40,
                  opacity: 0.7,
                ),
            ],
          ),
        );
      },
    );
  }
}
