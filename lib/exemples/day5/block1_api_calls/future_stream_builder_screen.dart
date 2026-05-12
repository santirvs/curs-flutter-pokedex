import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class FutureStreamBuilderScreen extends StatefulWidget {
  const FutureStreamBuilderScreen({super.key});

  @override
  State<FutureStreamBuilderScreen> createState() =>
      _FutureStreamBuilderScreenState();
}

class _FutureStreamBuilderScreenState extends State<FutureStreamBuilderScreen> {
  final FutureStreamDemoRepository _repo = FutureStreamDemoRepository();

  Future<int>? _diceFuture;
  late final Stream<int> _diceRollStepsStream = _repo.watchDiceRollSteps();

  void _start() {
    setState(() {
      _diceFuture = _repo.roll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FutureBuilder i StreamBuilder')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'FutureBuilder · llança un Future i pinta els 3 estats',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          FilledButton.icon(
            onPressed: _start,
            icon: const Icon(Icons.casino_outlined),
            label: const Text('Tirar dau'),
          ),
          const SizedBox(height: 8),
          FutureBuilder<int>(
            future: _diceFuture,
            builder: (context, snap) {
              if (_diceFuture == null) {
                return const Text('Prem el botó per començar');
              }
              if (snap.hasError) {
                return Card(
                  color: Theme.of(context).colorScheme.errorContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text('Error: ${snap.error}'),
                  ),
                );
              }
              return switch (snap.connectionState) {
                ConnectionState.waiting => const Padding(
                  padding: EdgeInsets.all(8),
                  child: LinearProgressIndicator(),
                ),
                ConnectionState.done => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text('Has tret un ${snap.data}'),
                  ),
                ),
                _ => const SizedBox.shrink(),
              };
            },
          ),

          const Divider(height: 32),

          Text(
            'StreamBuilder · cada pas del dau que rodola',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          StreamBuilder<int>(
            stream: _diceRollStepsStream,
            builder: (context, snap) {
              if (snap.hasError) {
                return Card(
                  color: Theme.of(context).colorScheme.errorContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text('Error: ${snap.error}'),
                  ),
                );
              }
              return switch (snap.connectionState) {
                ConnectionState.waiting => const Padding(
                  padding: EdgeInsets.all(8),
                  child: LinearProgressIndicator(),
                ),
                ConnectionState.active || ConnectionState.done => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const Icon(Icons.casino_outlined),
                        const SizedBox(width: 8),
                        Text(
                          'Pas del rodolament: ${snap.data ?? 0} '
                          '(${snap.connectionState.name})',
                        ),
                      ],
                    ),
                  ),
                ),
                _ => const SizedBox.shrink(),
              };
            },
          ),
        ],
      ),
    );
  }
}

class FutureStreamDemoRepository {
  final Random _random = Random();

  Future<int> roll() async {
    await Future.delayed(const Duration(milliseconds: 700));
    if (_random.nextInt(4) == 0) {
      throw 'El dau ha caigut a terra :(';
    }
    return 1 + _random.nextInt(6);
  }

  Stream<int> watchDiceRollSteps() {
    return Stream<int>.periodic(
      const Duration(seconds: 1),
      (i) => i + 1,
    ).take(10);
  }
}
