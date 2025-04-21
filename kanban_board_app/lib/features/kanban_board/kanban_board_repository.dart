import 'package:appflowy_board/appflowy_board.dart';
import 'package:kanban_board_app/features/kanban_board/logic/card_state.dart';
import 'package:vader_app/vader_app.dart';

class KanbanBoardRepository extends Repository {
  KanbanBoardRepository({required super.httpClient, required super.storageClient});

  Map<String, dynamic> boardGroupDB = {
    "boards": [
      //{
      //  "id": "Backlog",
      //  "name": "Backlog",
      //  "items": [
      //    {"title": "Card 20"},
      //  ],
      //},
      {
        "id": "Todo",
        "name": "Todo",
        "items": [
          {"title": "Card 1"},
          {"title": "Card 2"},
          {"title": "Card 3", "subtitle": 'Aug 1, 2020 4:05 PM'},
          {"title": "Card 4"},
          {"title": "Card 5"},
        ],
      },
      {
        "id": "In Progress",
        "name": "In Progress",
        "items": [
          {"title": "Card 6"},
        ],
      },
      {
        "id": "Pending",
        "name": "Pending",
        "items": [
          {"title": "Card 9", "subtitle": 'Aug 1, 2020 4:05 PM'},
          {"title": "Card 10"},
          {"title": "Card 11"},
          {"title": "Card 12"},
        ],
      },
      {
        "id": "Review",
        "name": "Review",
        "items": [
          {"title": "Card 18"},
          {"title": "Card 17"},
          {"title": "Card 16"},
        ],
      },
      {
        "id": "Done",
        "name": "Done",
        "items": [
          {"title": "Card 19"},
          {"title": "Card 15"},
          {"title": "Card 14"},
        ],
      },
    ],
  };

  Future<List<AppFlowyGroupData>> getBoardData() async {
    return [
      for (var group in boardGroupDB['boards'])
        AppFlowyGroupData(
          id: group['id'],
          name: group['name'],
          items: [for (var item in group['items']) CardState(title: item['title'], subtitle: item['subtitle'])],
        ),
    ];
  }
}
