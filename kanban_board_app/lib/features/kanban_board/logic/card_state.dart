import 'package:appflowy_board/appflowy_board.dart';

class CardState extends AppFlowyGroupItem {
  CardState({required this.id, required this.title, this.subtitle});

  @override
  final String id;
  final String title;
  final String? subtitle;
}