import 'package:flutter/material.dart';

import '../../admin/domain/troop_model.dart';

Widget _troopThumbnailImage({
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

class TroopCard extends StatelessWidget {
  const TroopCard({super.key, required this.troop});

  final Troop troop;

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
    final src = troop.imageUrl;
    final Widget thumbnail = src != null && src.isNotEmpty
        ? _troopThumbnailImage(
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
      color: troop.type.color,
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Imagen de la tropa
            ClipRRect(borderRadius: BorderRadius.circular(8), child: thumbnail),
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
                  Text(
                    'Nivel: ${troop.level}',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _StatIcon(Icons.favorite, Colors.red, '${troop.life}'),
                      _StatIcon(
                        Icons.flash_on,
                        Colors.orange,
                        '${troop.damage}',
                      ),
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

