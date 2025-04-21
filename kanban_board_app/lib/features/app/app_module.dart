import 'package:kanban_board_app/config.dart';
import 'package:kanban_board_app/features/app/pages/initial_page.dart';
import 'package:kanban_board_app/features/app/pages/error_page.dart';
import 'package:vader_app/vader_app.dart';

class AppModule extends VaderModule {
  @override
  List<RouteBase> get routes => [$initialRoute, $errorRoute];

  @override
  Injector? get services {
    final appConfig = AppConfig();
    return Injector()
      ..addInstance(appConfig)
      ..addInstance(HttpClient(apiUrl: appConfig.apiUrl, enableLogs: true, preventLargeResponses: true))
      ..addInstance(StorageClient());
  }
}