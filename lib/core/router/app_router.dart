import 'package:auto_route/auto_route.dart';
import 'package:mt5_leeon1/core/router/app_router.gr.dart';
@AutoRouterConfig(replaceInRouteName: 'Page,Router')
class AppRouter extends RootStackRouter{
  @override
  // TODO: implement routes
  List<AutoRoute> get routes => [
    AutoRoute(page: NewsRouter.page,initial: true)
  ];


}