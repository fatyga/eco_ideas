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
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(title: Text('Edit section'), actions: [
          IconButton(onPressed: addSubpoint, icon: const Icon(Icons.add)),
        ]),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ReorderableListView(
            onReorder: (int oldIndex, int newIndex) {},
            children: _subpoints
                .map((content) =>
                    IdeaNotePointField(key: UniqueKey(), content: content))
                .toList(),
          ),
        ),
      ),
    );
  }
}
