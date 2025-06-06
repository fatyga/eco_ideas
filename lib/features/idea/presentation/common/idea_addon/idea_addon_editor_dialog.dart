import 'package:eco_ideas/features/idea/idea.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:eco_ideas/utils/spaces.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IdeaAddonEditorDialog extends StatefulWidget {
  const IdeaAddonEditorDialog({
    required this.title,
    required this.values,
    required this.onConfirm,
    super.key,
  });

  final String title;
  final List<String> values;
  final void Function(List<String>) onConfirm;

  @override
  State<IdeaAddonEditorDialog> createState() => _IdeaAddonEditorDialogState();
}

class _IdeaAddonEditorDialogState extends State<IdeaAddonEditorDialog> {
  late List<TextEditingController> _controllers;

  void _addItem() {
    _controllers.add(TextEditingController());
    setState(() {});
  }

  void _deleteItem(TextEditingController controller) {
    _controllers.remove(controller);

    setState(() {});
  }

  void _onReorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final copy = _controllers[oldIndex].text;

    _controllers[oldIndex].text = _controllers[newIndex].text;

    _controllers[newIndex].text = copy;
    setState(() {});
  }

  void _onConfirm() {
    final values = _controllers
        .where((controller) => controller.text.isNotEmpty)
        .map((controller) => controller.text)
        .toList();

    widget.onConfirm(values);
  }

  @override
  void initState() {
    super.initState();
    _controllers = widget.values
        .map((value) => TextEditingController(text: value))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: context.pop,
          ),
          title: Text(widget.title),
          actions: [
            TextButton(
              onPressed: () {
                _onConfirm();
                context.pop();
              },
              child: Text(l10n.confirm),
            ),
          ],
        ),
        body: ReorderableListView(
          padding: context.paddings.allLarge,
          buildDefaultDragHandles: false,
          onReorder: _onReorder,
          footer: TextButton.icon(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
            label: const Text('Add new item'),
          ),
          children: [
            ..._controllers.map(
              (controller) => Row(
                key: ValueKey(controller),
                children: [
                  ReorderableDragStartListener(
                    index: _controllers.indexOf(controller),
                    child: const Icon(Icons.drag_handle),
                  ),
                  context.spaces.horizontalStandard,
                  Expanded(child: IdeaAddonField(controller: controller)),
                  IconButton(
                    onPressed: () => _deleteItem(controller),
                    icon: const Icon(Icons.close, size: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
