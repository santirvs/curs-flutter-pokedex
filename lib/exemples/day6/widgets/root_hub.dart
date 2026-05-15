import 'package:flutter/material.dart';

class Day6HubSection {
  const Day6HubSection({
    required this.badge,
    required this.title,
    required this.subtitle,
    required this.screen,
  });

  final String badge;
  final String title;
  final String subtitle;
  final Widget screen;
}

/// Menú racine del dia 6 (`Scaffold` + llista als blocs).
class Day6RootHub extends StatelessWidget {
  const Day6RootHub({
    super.key,
    required this.title,
    required this.sections,
  });

  final String title;
  final List<Day6HubSection> sections;

  @override
  Widget build(BuildContext context) {
    final badgeColor = Theme.of(context).colorScheme.primaryContainer;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        padding: const EdgeInsets.only(top: 12),
        children: [
          for (final s in sections)
            ListTile(
              leading: CircleAvatar(
                backgroundColor: badgeColor,
                child: Text(s.badge),
              ),
              title: Text(s.title),
              subtitle: Text(s.subtitle),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.of(context).push<void>(
                  MaterialPageRoute<void>(builder: (_) => s.screen),
                );
              },
            ),
        ],
      ),
    );
  }
}
