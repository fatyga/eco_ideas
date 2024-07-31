import 'package:eco_ideas/features/ideas/presentation/common/idea_note/idea_note_point.dart';
import 'package:eco_ideas/features/ideas/presentation/common/idea_note/idea_note_point_field.dart';
import 'package:flutter/material.dart';

class IdeaNoteManager extends StatefulWidget {
  const IdeaNoteManager({required this.subpoints, super.key});

  final List<String> subpoints;
  @override
  State<IdeaNoteManager> createState() => _IdeaNoteManagerState();
}

class _IdeaNoteManagerState extends State<IdeaNoteManager> {
  late final List<String> _subpoints;

  @override
  void initState() {
    _subpoints = List.from(widget.subpoints);
    super.initState();
  }

  void addSubpoint() {
    setState(() {
      _subpoints.add('');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('What you will need'),
                IconButton(onPressed: addSubpoint, icon: const Icon(Icons.add)),
              ],
            ),
            const SizedBox(height: 8),
            Column(
              children: _subpoints
                  .map((content) => IdeaNotePoint(point: content))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
