import 'package:flutter/material.dart';

class MyMapScreen extends StatelessWidget {
  const MyMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('El meu Mapa')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.map_outlined, size: 64),
            SizedBox(height: 16),
            Text('La meva vista de mapa (pendent)'),
          ],
        ),
      ),
    );
  }
}
