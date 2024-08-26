import 'package:eco_ideas/features/ideas/presentation/common/idea_section/idea_section_subpoint_field.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class IdeaSectionEditor extends StatefulWidget {
  const IdeaSectionEditor({required this.subpoints, super.key});

  final List<String> subpoints;
  @override
  State<IdeaSectionEditor> createState() => _IdeaSectionEditorState();
}

class _IdeaSectionEditorState extends State<IdeaSectionEditor> {
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
    final l10n = context.l10n;
    return Dialog.fullscreen(
      child: Scaffold(
        appBar:
            AppBar(title: Text(l10n.ideaSectionEditorAppBarTitle), actions: [
          IconButton(onPressed: addSubpoint, icon: const Icon(Icons.add)),
        ]),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: _subpoints
                .map((content) => IdeaSectionSubpointField(
                    key: UniqueKey(), content: content))
                .toList(),
          ),
        ),
      ),
    );
  }
}
