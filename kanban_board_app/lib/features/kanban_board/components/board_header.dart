import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';

class BoardHeader extends StatelessWidget {
  const BoardHeader({super.key, required this.controller, required this.data, required this.themeConfig});

  final AppFlowyBoardController controller;
  final AppFlowyBoardConfig themeConfig;
  final AppFlowyGroupData data;

  @override
  Widget build(BuildContext context) {
    return AppFlowyGroupHeader(
      icon: const Icon(Icons.lightbulb_circle),
      title: SizedBox(
        width: 60,
        child: TextField(
          controller: TextEditingController()..text = data.headerData.groupName,
          onSubmitted: (val) {
            controller.getGroupController(data.headerData.groupId)!.updateGroupName(val);
          },
        ),
      ),
      addIcon: const Icon(Icons.add, size: 20),
      moreIcon: const Icon(Icons.more_horiz, size: 20),
      height: 50,
      margin: themeConfig.groupBodyPadding,
    );
  }
}
