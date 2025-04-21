import 'package:kanban_board_design/kanban_board_design.dart';
import 'package:flutter/material.dart';
import 'package:vader_app/vader_app.dart';

part 'error_page.g.dart';

@TypedGoRoute<ErrorRoute>(path: '/app/error')
class ErrorRoute extends GoRouteData {
  const ErrorRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ErrorPage();
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: "Error page",
      child: Center(
        child: Text("This is Error page"),
      ),
    );
  }
}
