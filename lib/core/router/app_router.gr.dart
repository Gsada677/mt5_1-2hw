// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:mt5_leeon1/features/auth/ui/auth_page.dart' as _i1;
import 'package:mt5_leeon1/features/news/ui/news_page.dart' as _i2;
import 'package:mt5_leeon1/features/news/ui/News_search_page.dart' as _i3;
import 'package:mt5_leeon1/features/onboarding/ui/onboarding_page.dart' as _i4;

/// generated route for
/// [_i1.AuthPage]
class AuthRouter extends _i5.PageRouteInfo<void> {
  const AuthRouter({List<_i5.PageRouteInfo>? children})
    : super(AuthRouter.name, initialChildren: children);

  static const String name = 'AuthRouter';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthPage();
    },
  );
}

/// generated route for
/// [_i2.NewsPage]
class NewsRouter extends _i5.PageRouteInfo<void> {
  const NewsRouter({List<_i5.PageRouteInfo>? children})
    : super(NewsRouter.name, initialChildren: children);

  static const String name = 'NewsRouter';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.NewsPage();
    },
  );
}

/// generated route for
/// [_i3.NewsSearchPage]
class NewsSearchRouter extends _i5.PageRouteInfo<void> {
  const NewsSearchRouter({List<_i5.PageRouteInfo>? children})
    : super(NewsSearchRouter.name, initialChildren: children);

  static const String name = 'NewsSearchRouter';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.NewsSearchPage();
    },
  );
}

/// generated route for
/// [_i4.OnboardingPage]
class OnboardingRouter extends _i5.PageRouteInfo<void> {
  const OnboardingRouter({List<_i5.PageRouteInfo>? children})
    : super(OnboardingRouter.name, initialChildren: children);

  static const String name = 'OnboardingRouter';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.OnboardingPage();
    },
  );
}
