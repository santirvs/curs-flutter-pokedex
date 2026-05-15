import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'riverpod_generator_counter_screen.g.dart';

class RiverpodGeneratorCounterScreen extends StatelessWidget {
  const RiverpodGeneratorCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(child: _RiverpodGeneratorCounterView());
  }
}

@riverpod
class GeneratedCounter extends _$GeneratedCounter {
  @override
  int build() => 0;

  void increment() => state++;
  void decrement() => state--;
  void reset() => state = 0;
}

class _RiverpodGeneratorCounterView extends ConsumerWidget {
  const _RiverpodGeneratorCounterView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final value = ref.watch(generatedCounterProvider);
    final controller = ref.read(generatedCounterProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod generator · @riverpod')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text('Valor actual', style: theme.textTheme.titleSmall),
                    const SizedBox(height: 8),
                    Text('$value', style: theme.textTheme.displayMedium),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilledButton.tonalIcon(
                  onPressed: controller.decrement,
                  icon: const Icon(Icons.remove),
                  label: const Text('-1'),
                ),
                FilledButton.icon(
                  onPressed: controller.increment,
                  icon: const Icon(Icons.add),
                  label: const Text('+1'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: controller.reset,
              icon: const Icon(Icons.restart_alt),
              label: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
