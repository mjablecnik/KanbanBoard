import 'package:kanban_board_app/features/kanban_board/kanban_board_page.dart';
import 'package:kanban_board_app/i18n/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:vader_app/vader_app.dart';

part 'initial_page.g.dart';

@TypedGoRoute<InitialRoute>(path: '/app/initial')
class InitialRoute extends GoRouteData {
  const InitialRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const InitialPage();
}

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashView(
      duration: Duration.zero,
      logo: FlutterLogo(size: 80),
      loadingIndicator: Container(
        width: 84,
        height: 84,
        padding: EdgeInsets.all(32),
        child: CircularProgressIndicator(strokeWidth: 2.0),
      ),
      onFinish: () {
        LocaleSettings.setLocale(AppLocale.cs);
        KanbanBoardRoute().go(context);
      },
    );
  }
}
