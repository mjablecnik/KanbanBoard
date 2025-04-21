import 'package:kanban_board_app/features/app/app_module.dart';
import 'package:kanban_board_app/features/kanban_board/kanban_board_page.dart';
import 'package:kanban_board_app/features/kanban_board/kanban_board_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:kanban_board_app/features/kanban_board/logic/board_cubit.dart';
import 'package:vader_app/vader_app.dart';

class KanbanBoardModule extends AppModule {
  @override
  List<RouteBase> get routes => [$kanbanBoardRoute];

  @override
  Injector? get services {
    return super.services!
      ..add(KanbanBoardRepository.new)
      ..add(BoardCubit.new)
      ..commit();
  }
}
