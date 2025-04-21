import 'package:kanban_board_app/features/kanban_board/components/board_header.dart';
import 'package:kanban_board_design/kanban_board_design.dart';
import 'package:appflowy_board/appflowy_board.dart';
import 'package:vader_app/vader_app.dart';
import 'package:flutter/material.dart';

import 'components/board_card.dart';
import 'components/board_footer.dart';
import 'logic/card_state.dart';
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
        CardState(title: "Card 1"),
        CardState(title: "Card 2"),
        CardState(title: "Card 3", subtitle: 'Aug 1, 2020 4:05 PM'),
        CardState(title: "Card 4"),
        CardState(title: "Card 5"),
      ],
    );

    final group2 = AppFlowyGroupData(
      id: "In Progress",
      name: "In Progress",
      items: <AppFlowyGroupItem>[
        CardState(title: "Card 6"),
        CardState(title: "Card 7", subtitle: 'Aug 1, 2020 4:05 PM'),
        CardState(title: "Card 8", subtitle: 'Aug 1, 2020 4:05 PM'),
      ],
    );

    final group3 = AppFlowyGroupData(
      id: "Pending",
      name: "Pending",
      items: <AppFlowyGroupItem>[
        CardState(title: "Card 9"),
        CardState(title: "Card 10", subtitle: 'Aug 1, 2020 4:05 PM'),
        CardState(title: "Card 11"),
        CardState(title: "Card 12"),
      ],
    );
    final group4 = AppFlowyGroupData(
      id: "Canceled",
      name: "Canceled",
      items: <AppFlowyGroupItem>[CardState(title: "Card 13"), CardState(title: "Card 14"), CardState(title: "Card 15")],
    );
    final group5 = AppFlowyGroupData(
      id: "Urgent",
      name: "Urgent",
      items: <AppFlowyGroupItem>[CardState(title: "Card 14"), CardState(title: "Card 15")],
    );

    controller.addGroup(group1);
    controller.addGroup(group2);
    controller.addGroup(group3);
    controller.addGroup(group4);
    controller.addGroup(group5);
  }

  @override
  Widget build(BuildContext context) {
    final config = AppFlowyBoardConfig(
      groupBackgroundColor: HexColor.fromHex('#F7F8FC'),
      stretchGroupHeight: false,
      groupMargin: EdgeInsets.only(right: 10, left: 10),
    );

    return PageLayout(
      title: "Kanban Board",
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: AppFlowyBoard(
          controller: controller,
          boardScrollController: boardController,
          cardBuilder: (context, group, groupItem) {
            return BoardCard(key: ValueKey(groupItem.id), state: groupItem as CardState);
          },
          footerBuilder: (context, columnData) {
            return BoardFooter(scrollController: boardController, data: columnData, themeConfig: config);
          },
          headerBuilder: (context, columnData) {
            return BoardHeader(controller: controller, data: columnData, themeConfig: config);
          },
          groupConstraints: BoxConstraints.tightFor(
            width: MediaQuery.of(context).size.width / 5,
            height: MediaQuery.of(context).size.height,
          ),
          config: config,
        ),
      ),
    );
  }
}
