import 'package:kanban_board_app/features/app/app_module.dart';
import 'package:kanban_board_app/features/app/pages/initial_page.dart';
import 'package:kanban_board_app/features/events/event_module.dart';
import 'package:kanban_board_app/features/kanban_board/kanban_board_page.dart';
import 'package:kanban_board_app/i18n/translations.g.dart';
import 'package:kanban_board_design/kanban_board_design.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vader_app/vader_app.dart';

import 'features/kanban_board/kanban_board_module.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  logger.setObserver(CrashlyticsLoggerObserver());

  AppIcons.pathPrefix = '../kanban_board_design/';

  runApp(TranslationProvider(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return VaderApp(
      modules: [AppModule(), EventModule(), KanbanBoardModule()],
      theme: ExampleTheme(),
      isDebug: false,
      entrypoint: KanbanBoardRoute().location,
      localization: Localization(
        locale: TranslationProvider.of(context).flutterLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        delegates: GlobalMaterialLocalizations.delegates,
      ),
    );
  }
}

class CrashlyticsLoggerObserver extends LoggerObserver {
  const CrashlyticsLoggerObserver();

  @override
  void onError(err) {
    //FirebaseCrashlytics.instance.recordError(err.error, err.stackTrace, reason: err.message);
  }

  @override
  void onException(err) {
    //FirebaseCrashlytics.instance.recordError(err.exception, err.stackTrace, reason: err.message);
  }
}
