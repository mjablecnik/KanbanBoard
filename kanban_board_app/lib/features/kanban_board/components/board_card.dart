import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';

import '../logic/card_state.dart';

class BoardCard extends StatelessWidget {
  const BoardCard({super.key, required this.state});

  final CardState state;

  @override
  Widget build(BuildContext context) {
    return AppFlowyGroupCard(
      key: ValueKey(state.id),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Text(state.title, style: const TextStyle(fontSize: 14), textAlign: TextAlign.left),
              if (state.subtitle != null)
                Text(state.subtitle!, style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
