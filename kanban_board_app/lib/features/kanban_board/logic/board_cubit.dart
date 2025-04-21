import 'package:appflowy_board/appflowy_board.dart';
import 'package:vader_app/vader_app.dart';

import '../kanban_board_repository.dart';

typedef BoardState = List<AppFlowyGroupData>;

class BoardCubit extends Cubit<BoardState> {
  BoardCubit({required KanbanBoardRepository repository})
      : _repository = repository,
        super([]);

  late final KanbanBoardRepository _repository;

  update(BoardState state) {
    emit(state);
  }

  get loggedUser => state;

  Future<BoardState> loadData() async {
    final data = await _repository.getBoardData();
    update(data);
    return data;
  }
}
