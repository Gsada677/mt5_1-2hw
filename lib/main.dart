import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:mt5_leeon1/core/di/service_locator.dart';
import 'package:mt5_leeon1/core/router/app_router.dart';
import 'package:mt5_leeon1/features/news/data/data_source/impl/news_remote_data_source_impl.dart';
import 'package:mt5_leeon1/features/news/data/repo_impl/news_repo_impl.dart';
import 'package:mt5_leeon1/features/news/domain/repo/news_repository.dart';
void main()async{

  await setupServiceLocator();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  final AppRouter _appRouter=AppRouter();

  @override
  Widget build(BuildContext context) {
    return

       MaterialApp.router(
        routerConfig: _appRouter.config(),

    );
  }
}
