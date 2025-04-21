import 'package:kanban_board_app/features/kanban_board/components/board_header.dart';
import 'package:kanban_board_app/features/kanban_board/kanban_board_repository.dart';
import 'package:kanban_board_design/kanban_board_design.dart';
import 'package:appflowy_board/appflowy_board.dart';
import 'package:vader_app/vader_app.dart';
import 'package:flutter/material.dart';

import 'components/board_card.dart';
import 'components/board_footer.dart';
import 'logic/board_cubit.dart';
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

  late AppFlowyBoardScrollController boardController;
  final AppFlowyBoardController controller = AppFlowyBoardController(
    onMoveGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
      debugPrint('Move item from $fromIndex to $toIndex');
    },
    onMoveGroupItem: (groupId, fromIndex, toIndex) {
      debugPrint('Move $groupId:$fromIndex to $groupId:$toIndex');
    },
    onMoveGroupItemToGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
      debugPrint('Move $fromGroupId:$fromIndex to $toGroupId:$toIndex');
      injector.use<KanbanBoardRepository>().changeItemGroup(fromGroupId, fromIndex, toGroupId, toIndex);
    },
  );

  @override
  void initState() {
    super.initState();
    boardController = AppFlowyBoardScrollController();

    injector.use<KanbanBoardRepository>().getBoardData().then((value) {
      for (var group in value) {
        controller.addGroup(group);
      }
    });
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
          headerBuilder: (context, columnData) {
            return BoardHeader(controller: controller, data: columnData, themeConfig: config);
          },
          cardBuilder: (context, group, groupItem) {
            return BoardCard(key: ValueKey(groupItem.id), controller: controller, group: group, item: groupItem as CardState);
          },
          footerBuilder: (context, columnData) {
            return BoardFooter(scrollController: boardController, data: columnData, themeConfig: config);
          },
          groupConstraints: BoxConstraints.tightFor(
            width: MediaQuery.of(context).size.width / 5 - 8,
            height: MediaQuery.of(context).size.height,
          ),
          config: config,
        ),
      ),
    );
  }
}
