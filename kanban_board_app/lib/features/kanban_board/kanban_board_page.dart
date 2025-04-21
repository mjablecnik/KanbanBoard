import 'package:kanban_board_design/kanban_board_design.dart';
import 'package:vader_app/vader_app.dart';
import 'package:flutter/material.dart';

part 'kanban_board_page.g.dart';

@TypedGoRoute<KanbanBoardRoute>(path: '/kanban/board')
class KanbanBoardRoute extends GoRouteData {
  const KanbanBoardRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const KanbanBoardPage();
}

class KanbanBoardPage extends StatelessWidget {
  const KanbanBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(title: "KanbanBoard123", child: Center(child: Text("This is KanbanBoard page.")));
  }
}
