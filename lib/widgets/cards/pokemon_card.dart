import 'package:flutter/material.dart';

import '../../features/admin/domain/pokemon_model.dart';

Widget _pokemonThumbnailImage({
  required String src,
  required double size,
  required ImageErrorWidgetBuilder errorBuilder,
}) {
  if (src.startsWith('data:')) {
    try {
      final data = Uri.parse(src).data;
      if (data != null) {
        return Image.memory(
          data.contentAsBytes(),
          width: size,
          height: size,
          fit: BoxFit.cover,
          errorBuilder: errorBuilder,
        );
      }
    } catch (_) {}
    return Builder(
      builder: (context) => errorBuilder(
        context,
        StateError('data URL invàlida'),
        StackTrace.empty,
      ),
    );
  }
  return Image.network(
    src,
    width: size,
    height: size,
    fit: BoxFit.cover,
    errorBuilder: errorBuilder,
  );
}

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const thumbSize = 64.0;
    final thumbPlaceholder = Container(
      width: thumbSize,
      height: thumbSize,
      color: theme.colorScheme.surfaceContainerHighest,
      child: const Icon(Icons.catching_pokemon, size: 32),
    );
    final src = pokemon.imageUrl;
    final Widget thumbnail = src != null && src.isNotEmpty
        ? _pokemonThumbnailImage(
            src: src,
            size: thumbSize,
            errorBuilder: (_, _, _) => thumbPlaceholder,
          )
        : Container(
            width: thumbSize,
            height: thumbSize,
            color: theme.colorScheme.surfaceContainerHighest,
            child: const Icon(Icons.catching_pokemon, size: 32),
          );

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(8), child: thumbnail),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pokemon.name,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '#${pokemon.id.toString().padLeft(3, '0')}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 6,
                    runSpacing: 4,
                    children: [
                      Chip(
                        label: Text(pokemon.type.label),
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      Chip(
                        label: Text('Vida ${pokemon.hp}'),
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor: theme.colorScheme.primaryContainer,
                      ),
                      Chip(
                        label: Text('Atac ${pokemon.attack}'),
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      Chip(
                        label: Text('Defensa ${pokemon.defense}'),
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
