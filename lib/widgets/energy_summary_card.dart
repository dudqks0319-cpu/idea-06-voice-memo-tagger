import 'package:flutter/material.dart';

class EnergySummaryCard extends StatelessWidget {
  const EnergySummaryCard({
    super.key,
    required this.currentPriorityLevel,
    required this.totalMemoSeconds,
    required this.completedMemoSeconds,
    required this.onEnergyChanged,
  });

  final int currentPriorityLevel;
  final int totalMemoSeconds;
  final int completedMemoSeconds;
  final ValueChanged<int> onEnergyChanged;

  @override
  Widget build(BuildContext context) {
    final progress = totalMemoSeconds == 0
        ? 0.0
        : (completedMemoSeconds / totalMemoSeconds).clamp(0.0, 1.0);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('현재 우선순위 상태', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: Text('우선순위 레벨: $currentPriorityLevel / 5')),
                SizedBox(
                  width: 180,
                  child: Slider(
                    value: currentPriorityLevel.toDouble(),
                    min: 1,
                    max: 5,
                    divisions: 4,
                    label: '$currentPriorityLevel',
                    onChanged: (v) => onEnergyChanged(v.round()),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('메모 시간: $completedMemoSeconds분 / $totalMemoSeconds분'),
            const SizedBox(height: 6),
            LinearProgressIndicator(value: progress),
            const SizedBox(height: 4),
            Text('완료율 ${(progress * 100).toStringAsFixed(1)}%'),
          ],
        ),
      ),
    );
  }
}
