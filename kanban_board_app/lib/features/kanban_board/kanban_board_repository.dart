import 'package:appflowy_board/appflowy_board.dart';
import 'package:kanban_board_app/features/kanban_board/logic/card_state.dart';
import 'package:vader_app/vader_app.dart';

import 'components/board_card.dart';

class KanbanBoardRepository extends Repository {
  KanbanBoardRepository({required super.httpClient, required super.storageClient});

  Map<String, dynamic> boardGroupDB = {
    "boards": [
      //{
      //  "id": "Backlog",
      //  "name": "Backlog",
      //  "items": [
      //    {"title": "Card 20", "id": "20"},
      //  ],
      //},
      {
        "id": "Todo",
        "name": "Todo",
        "items": [
          {"title": "Card 1", "id": "1"},
          {"title": "Card 2", "id": "2"},
          {"title": "Card 3", "subtitle": 'Aug 1, 2020 4:05 PM', "id": "3"},
          {"title": "Card 4", "id": "4"},
          {"title": "Card 5", "id": "5"},
        ],
      },
      {
        "id": "In Progress",
        "name": "In Progress",
        "items": [
          {"title": "Card 6", "id": "6"},
        ],
      },
      {
        "id": "Pending",
        "name": "Pending",
        "items": [
          {"title": "Card 9", "subtitle": 'Aug 1, 2020 4:05 PM', "id": "9"},
          {"title": "Card 10", "id": "10"},
          {"title": "Card 11", "id": "11"},
          {"title": "Card 12", "id": "12"},
        ],
      },
      {
        "id": "Review",
        "name": "Review",
        "items": [
          {"title": "Card 18", "id": "18"},
          {"title": "Card 17", "id": "17"},
          {"title": "Card 16", "id": "16"},
        ],
      },
      {
        "id": "Done",
        "name": "Done",
        "items": [
          {"title": "Card 19", "id": "19"},
          {"title": "Card 15", "id": "15"},
          {"title": "Card 14", "id": "14"},
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
          items: [for (var item in group['items']) CardState(id: item['id'], title: item['title'], subtitle: item['subtitle'])],
        ),
    ];
  }

  Future<void> updateItem(String groupId, CardState item) async {
    final group = boardGroupDB['boards'].firstWhere((element) => element['id'] == groupId);
    final index = group['items'].indexWhere((element) => element['id'] == item.id);
    print(group['items'][index]);
    group['items'][index]['title'] = item.title;
    //group['items'][index]['subtitle'] = item.subtitle ?? group['items'][index]['subtitle'];
  }
}
