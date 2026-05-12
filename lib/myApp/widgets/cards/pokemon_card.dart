import 'package:flutter/material.dart';
import 'package:my_pokedex/myApp/ranking/data/pokemon_repository.dart';

import '../../../myApp/admin/domain/pokemon_model.dart';

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

class PokemonCard extends StatefulWidget {
  const PokemonCard({super.key, required this.pokemon,this.onFavoriteChanged});
  final Pokemon pokemon;
  final VoidCallback? onFavoriteChanged;

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.pokemon.favorite;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const thumbSize = 64.0;

    // Reutilitzem la teva lògica de thumbnail
    final src = widget.pokemon.imageUrl;
    final Widget thumbnail = src != null && src.isNotEmpty
        ? _pokemonThumbnailImage(
            src: src,
            size: thumbSize,
            errorBuilder: (_, _, _) => _buildPlaceholder(theme, thumbSize),
          )
        : _buildPlaceholder(theme, thumbSize);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      // Clip.antiAlias assegura que el contingut no surti de les cantonades del Card
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // 1. Contingut principal
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: thumbnail,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Deixem una mica d'espai a la dreta del text per no xocar amb el cor
                      Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Text(
                          widget.pokemon.name,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '#${widget.pokemon.id.toString().padLeft(3, '0')}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 6,
                        runSpacing: 4,
                        children: [
                          _buildChip(widget.pokemon.type.label, theme),
                          _buildChip(
                            'Vida ${widget.pokemon.hp}',
                            theme,
                            isPrimary: true,
                          ),
                          _buildChip('Atac ${widget.pokemon.attack}', theme),
                          _buildChip(
                            'Defensa ${widget.pokemon.defense}',
                            theme,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 2. Icona de favorit sobreposada
          Positioned(
            top: 4,
            right: 4,
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite
                    ? Colors.red
                    : theme.colorScheme.onSurfaceVariant,
              ),
              onPressed: () async {
                //await PokemonRepository.toggleFavorite(widget.pokemon.id); // ja es fa en el callback
                if (widget.onFavoriteChanged != null) widget.onFavoriteChanged!();
              },
            ),
          ),
        ],
      ),
    );
  }

  // Mètodes auxiliars per mantenir el build net
  Widget _buildPlaceholder(ThemeData theme, double size) {
    return Container(
      width: size,
      height: size,
      color: theme.colorScheme.surfaceContainerHighest,
      child: const Icon(Icons.catching_pokemon, size: 32),
    );
  }

  Widget _buildChip(String label, ThemeData theme, {bool isPrimary = false}) {
    return Chip(
      label: Text(label),
      visualDensity: VisualDensity.compact,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      backgroundColor: isPrimary ? theme.colorScheme.primaryContainer : null,
      labelStyle: theme.textTheme.labelSmall,
    );
  }
}
