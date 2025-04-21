import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';

import '../logic/card_state.dart';

class BoardCard extends StatefulWidget {
  const BoardCard({super.key, required this.state});

  final CardState state;

  @override
  State<BoardCard> createState() => _BoardCardState();
}

class _BoardCardState extends State<BoardCard> {
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return AppFlowyGroupCard(
      key: ValueKey(widget.state.id),
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
                    child: Text(widget.state.title, style: const TextStyle(fontSize: 14), textAlign: TextAlign.left),
                  ),
                )
              else
                TextField(
                  controller: TextEditingController(text: widget.state.title),
                  onSubmitted: (value) {
                    print("tesst");
                    isEditing = false;
                  },
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: 2.0)),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: 2.0)),
                  ),
                ),

              if (widget.state.subtitle != null)
                Text(widget.state.subtitle!, style: TextStyle(fontSize: 12, color: Colors.grey)),
              if (widget.state.subtitle != null) SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
