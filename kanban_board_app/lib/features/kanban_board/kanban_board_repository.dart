import 'package:appflowy_board/appflowy_board.dart';
import 'package:kanban_board_app/features/kanban_board/logic/card_state.dart';
import 'package:vader_app/vader_app.dart';

class KanbanBoardRepository extends Repository {
  KanbanBoardRepository({
    required super.httpClient,
    required super.storageClient,
  });

  Future<List<AppFlowyGroupData>> getBoardData() async {
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

    return [group1, group2, group3, group4, group5];
  }
}
