import 'package:kanban_board_app/features/kanban_board/components/board_header.dart';
import 'package:kanban_board_design/kanban_board_design.dart';
import 'package:appflowy_board/appflowy_board.dart';
import 'package:vader_app/vader_app.dart';
import 'package:flutter/material.dart';

import 'components/board_card.dart';
import 'components/board_footer.dart';
import 'components/text_item.dart';
import 'extensions.dart';

part 'kanban_board_page.g.dart';

@TypedGoRoute<KanbanBoardRoute>(path: '/kanban/board')
class KanbanBoardRoute extends GoRouteData {
  const KanbanBoardRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const KanbanBoardPage();
}

class KanbanBoardPage extends StatefulWidget {
  const KanbanBoardPage({super.key});

  @override
  State<KanbanBoardPage> createState() => _KanbanBoardPageState();
}

class _KanbanBoardPageState extends State<KanbanBoardPage> {
  final AppFlowyBoardController controller = AppFlowyBoardController(
    onMoveGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
      debugPrint('Move item from $fromIndex to $toIndex');
    },
    onMoveGroupItem: (groupId, fromIndex, toIndex) {
      debugPrint('Move $groupId:$fromIndex to $groupId:$toIndex');
    },
    onMoveGroupItemToGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
      debugPrint('Move $fromGroupId:$fromIndex to $toGroupId:$toIndex');
    },
  );

  late AppFlowyBoardScrollController boardController;

  @override
  void initState() {
    super.initState();
    boardController = AppFlowyBoardScrollController();
    final group1 = AppFlowyGroupData(
      id: "To Do",
      name: "To Do",
      items: [
        TextItem("Card 1"),
        TextItem("Card 2"),
        RichTextItem(title: "Card 3", subtitle: 'Aug 1, 2020 4:05 PM'),
        TextItem("Card 4"),
        TextItem("Card 5"),
      ],
    );

    final group2 = AppFlowyGroupData(
      id: "In Progress",
      name: "In Progress",
      items: <AppFlowyGroupItem>[
        TextItem("Card 6"),
        RichTextItem(title: "Card 7", subtitle: 'Aug 1, 2020 4:05 PM'),
        RichTextItem(title: "Card 8", subtitle: 'Aug 1, 2020 4:05 PM'),
      ],
    );

    final group3 = AppFlowyGroupData(
      id: "Pending",
      name: "Pending",
      items: <AppFlowyGroupItem>[
        TextItem("Card 9"),
        RichTextItem(title: "Card 10", subtitle: 'Aug 1, 2020 4:05 PM'),
        TextItem("Card 11"),
        TextItem("Card 12"),
      ],
    );
    final group4 = AppFlowyGroupData(
      id: "Canceled",
      name: "Canceled",
      items: <AppFlowyGroupItem>[TextItem("Card 13"), TextItem("Card 14"), TextItem("Card 15")],
    );
    final group5 = AppFlowyGroupData(
      id: "Urgent",
      name: "Urgent",
      items: <AppFlowyGroupItem>[TextItem("Card 14"), TextItem("Card 15")],
    );

    controller.addGroup(group1);
    controller.addGroup(group2);
    controller.addGroup(group3);
    controller.addGroup(group4);
    controller.addGroup(group5);
  }

  @override
  Widget build(BuildContext context) {
    final config = AppFlowyBoardConfig(groupBackgroundColor: HexColor.fromHex('#F7F8FC'), stretchGroupHeight: false);

    return PageLayout(
      title: "Kanban Board",
      child: AppFlowyBoard(
        controller: controller,
        cardBuilder: (context, group, groupItem) {
          return BoardCard(groupItem: groupItem);
        },
        boardScrollController: boardController,
        footerBuilder: (context, columnData) {
          return BoardFooter(scrollController: boardController, data: columnData, themeConfig: config);
        },
        headerBuilder: (context, columnData) {
          return BoardHeader(controller: controller, data: columnData, themeConfig: config);
        },
        groupConstraints: const BoxConstraints.tightFor(width: 240),
        config: config,
      ),
    );
  }
}
