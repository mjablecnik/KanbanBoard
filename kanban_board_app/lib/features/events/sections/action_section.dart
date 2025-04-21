import 'package:kanban_board_app/i18n/translations.g.dart';
import 'package:kanban_board_design/kanban_board_design.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Icons;

class ActionSection extends StatelessWidget {
  const ActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        border: Border.symmetric(horizontal: BorderSide(color: AppColors.grey400.withAlpha(25))),
      ),
      child: Row(
        children: [
          LinkButton(
            text: i18n.events.list.actions.filter,
            icon: Icon(CupertinoIcons.slider_horizontal_3, size: 14, color: AppColors.blue900),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          ),
          Spacer(),
          LinkButton(
            text: i18n.events.list.actions.add,
            icon: Icon(Icons.add, color: AppColors.blue900, size: 20),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          ),
        ],
      ),
    );
  }
}
