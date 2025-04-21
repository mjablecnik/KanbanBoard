import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';

class BoardFooter extends StatelessWidget {
  const BoardFooter({super.key, required this.scrollController, required this.data, required this.themeConfig});

  final AppFlowyBoardScrollController scrollController;
  final AppFlowyBoardConfig themeConfig;
  final AppFlowyGroupData data;

  @override
  Widget build(BuildContext context) {
    return AppFlowyGroupFooter(
      icon: const Icon(Icons.add, size: 20),
      title: const Text('New'),
      height: 50,
      margin: themeConfig.groupBodyPadding,
      onAddButtonClick: () {
        scrollController.scrollToBottom(data.id);
      },
    );
  }
}
