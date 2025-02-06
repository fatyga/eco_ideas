import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  const StepIndicator({
    required this.index,
    required this.stepsCount,
    super.key,
  });

  final int index;
  final int stepsCount;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      constraints: const BoxConstraints(maxHeight: 40),
      builder: (context) => Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (index != 0)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_outlined),
                onPressed: () {},
              ),
            ),
          Expanded(
            child: Center(
              child: Text(index == 0 ? 'Introduction' : 'Step $index'),
            ),
          ),
          if (index < stepsCount)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                icon: const Icon(Icons.arrow_forward_outlined),
                onPressed: () {},
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {},
              ),
            ),
        ],
      ),
      onClosing: () {},
    );
  }
}
