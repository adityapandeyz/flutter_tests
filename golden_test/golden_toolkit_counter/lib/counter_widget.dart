import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int count;
  final Key widgetKey;
  final VoidCallback onIncrement;
  final VoidCallback onReset;
  final bool isEnabled;

  const Counter({
    super.key,
    required this.count,
    required this.onIncrement,
    required this.onReset,
    this.isEnabled = true,
    this.widgetKey = const Key('increment_1'),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$count',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              key: widgetKey,
              onPressed: isEnabled ? onIncrement : null,
              child: const Text('Increment'),
            ),
            TextButton(
              onPressed: onReset,
              child: const Text('Reset'),
            ),
          ],
        ),
      ],
    );
  }
}
