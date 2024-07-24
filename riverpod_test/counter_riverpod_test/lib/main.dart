import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateNotifierProvider<Counter, int>(
  (ref) => Counter(),
);

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Riverpod Counter App',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$counter',
              style: const TextStyle(
                fontSize: 81,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final counter = ref.read(counterProvider.notifier);
          counter.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Counter extends StateNotifier<int> {
  Counter() : super(0);
  void increment() => state++;
}
