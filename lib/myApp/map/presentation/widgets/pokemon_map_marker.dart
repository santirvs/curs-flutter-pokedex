import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../admin/domain/pokemon_model.dart';

class PokemonMapPlacement {
  const PokemonMapPlacement({
    required this.pokemon,
    required this.relativeX,
    required this.relativeY,
  });

  final Pokemon pokemon;
  final double relativeX;
  final double relativeY;
}

List<PokemonMapPlacement> randomPlacementsForPokemons(
  List<Pokemon> pokemons, {
  double margin = 0.08,
}) {
  final random = math.Random();
  final minValue = margin;
  final maxValue = 1 - margin;
  return [
    for (final pokemon in pokemons)
      PokemonMapPlacement(
        pokemon: pokemon,
        relativeX: minValue + random.nextDouble() * (maxValue - minValue),
        relativeY: minValue + random.nextDouble() * (maxValue - minValue),
      ),
  ];
}

class PokemonMapMarker extends StatelessWidget {
  const PokemonMapMarker({
    super.key,
    required this.placement,
    required this.mapSize,
    required this.onTap,
    this.size = 72,
    this.opacity = 1,
  });

  final PokemonMapPlacement placement;
  final Size mapSize;
  final ValueChanged<Pokemon> onTap;
  final double size;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    final pokemon = placement.pokemon;
    final imageUrl = pokemon.imageUrl;
    return Positioned(
      left: placement.relativeX * mapSize.width - size / 2,
      top: placement.relativeY * mapSize.height - size / 2,
      width: size,
      height: size,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onTap(pokemon),
        child: Opacity(
          opacity: opacity,
          child: imageUrl == null
              ? const Icon(Icons.catching_pokemon)
              : Image.network(imageUrl, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
