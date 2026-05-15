import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderCounterScreen extends StatelessWidget {
  const ProviderCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterController(),
      child: const _ProviderCounterView(),
    );
  }
}

class CounterController extends ChangeNotifier {
  int _value = 0;

  int get value => _value;

  void increment() {
    _value++;
    notifyListeners();
  }

  void decrement() {
    _value--;
    notifyListeners();
  }

  void reset() {
    _value = 0;
    notifyListeners();
  }
}

class _ProviderCounterView extends StatelessWidget {
  const _ProviderCounterView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final counter = context.watch<CounterController>();
    final controller = context.read<CounterController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Provider · ChangeNotifier')),
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
                    Text(
                      '${counter.value}',
                      style: theme.textTheme.displayMedium,
                    ),
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
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
