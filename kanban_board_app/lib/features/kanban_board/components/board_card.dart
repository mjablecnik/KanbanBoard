import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';
import 'package:vader_app/vader_app.dart';

import '../kanban_board_repository.dart';
import '../logic/card_state.dart';

class BoardCard extends StatefulWidget {
  const BoardCard({super.key, required this.controller, required this.group, required this.item});

  final AppFlowyBoardController controller;
  final AppFlowyGroupData group;
  final CardState item;

  @override
  State<BoardCard> createState() => _BoardCardState();
}

class _BoardCardState extends State<BoardCard> {
  final FocusNode _focusNode = FocusNode();
  bool isEditing = false;
  late String title;

  @override
  void initState() {
    super.initState();
    title = widget.item.title;
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        changeTitle(title);
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  changeTitle(String value) {
    isEditing = false;
    final newCard = CardState(id: widget.item.id, title: value, subtitle: widget.item.subtitle);
    widget.controller.updateGroupItem(widget.group.id, newCard);
    //injector.use<KanbanBoardRepository>().updateItem(widget.group.id, newCard);
    setState(() => title = value);
  }

  @override
  Widget build(BuildContext context) {
    return AppFlowyGroupCard(
      key: ValueKey(widget.item.id),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              if (isEditing == false)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isEditing = true;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Text(title, style: const TextStyle(fontSize: 14), textAlign: TextAlign.left),
                  ),
                )
              else
                TextField(
                  focusNode: _focusNode,
                  controller: TextEditingController(text: title),
                  style: TextStyle(fontSize: 14),
                  onChanged: (value) => title = value,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: 2.0)),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: 2.0)),
                  ),
                ),

              if (widget.item.subtitle != null)
                Text(widget.item.subtitle!, style: TextStyle(fontSize: 12, color: Colors.grey)),
              if (widget.item.subtitle != null) SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
