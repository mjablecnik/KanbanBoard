import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';

import 'text_item.dart';

class BoardCard extends StatelessWidget {
  const BoardCard({super.key, required this.groupItem});

  final AppFlowyGroupItem groupItem;

  @override
  Widget build(BuildContext context) {
    return AppFlowyGroupCard(key: ValueKey(groupItem.id), child: _buildCard(groupItem));
  }

  Widget _buildCard(AppFlowyGroupItem item) {
    if (item is TextItem) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30), child: Text(item.s)),
      );
    }

    if (item is RichTextItem) {
      return RichTextCard(item: item);
    }

    throw UnimplementedError();
  }
}

class RichTextCard extends StatelessWidget {
  const RichTextCard({required this.item, super.key});

  final RichTextItem item;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.title, style: const TextStyle(fontSize: 14), textAlign: TextAlign.left),
            const SizedBox(height: 10),
            Text(item.subtitle, style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
