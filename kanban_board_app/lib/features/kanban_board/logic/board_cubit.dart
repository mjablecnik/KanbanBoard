/* This is not using right now.

import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';
import 'package:vader_app/vader_app.dart';

import '../kanban_board_repository.dart';
import 'card_state.dart';

typedef BoardState = List<AppFlowyGroupData>;

class BoardCubit extends Cubit<BoardState> {
  BoardCubit({required KanbanBoardRepository repository})
      : _repository = repository,
        super([]);

  late final KanbanBoardRepository _repository;

  update(BoardState state) {
    emit(state);
  }

  Future<BoardState> loadData() async {
    final data = await _repository.getBoardData();
    update(data);
    return data;
  }

  updateItem(AppFlowyGroupData group, CardState item) {
    _repository.updateItem(group.id, item);
  }
}

 */