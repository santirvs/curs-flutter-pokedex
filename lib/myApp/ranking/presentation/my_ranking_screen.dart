import 'package:flutter/material.dart';

class MyRankingScreen extends StatelessWidget {
  const MyRankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('El meu Ranking')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.leaderboard_outlined, size: 64),
            SizedBox(height: 16),
            Text('La meva vista de ranking (pendent)'),
          ],
        ),
      ),
    );
  }
}
