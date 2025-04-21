import 'package:appflowy_board/appflowy_board.dart';

class CardState extends AppFlowyGroupItem {
  CardState({required this.title, this.subtitle});

  final String title;
  final String? subtitle;

  @override
  String get id => title;
}