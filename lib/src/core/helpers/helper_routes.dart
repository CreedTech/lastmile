import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastmile/src/core/core.dart';
import 'package:lastmile/src/presentation/home/view/get_started_view.dart';
import 'package:lastmile/src/presentation/home/view/onboarding_one.dart';
import 'package:lastmile/src/presentation/home/view/onboarding_three.dart';
import 'package:lastmile/src/presentation/home/view/onboarding_two.dart';
import 'package:lastmile/src/presentation/home/view/splash_view.dart';
import 'package:lastmile/src/presentation/navigation/view/navigation_view.dart';

class RouterGenerator {
  Route<dynamic>? generate(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case root:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: const RouteSettings(name: root),
        );
      case onboardingOne:
        return MaterialPageRoute(
          builder: (context) => const OnboardingViewOne(),
          settings: const RouteSettings(name: onboardingOne),
        );
      case onboardingTwo:
        return MaterialPageRoute(
          builder: (context) => const OnboardingViewTwo(),
          settings: const RouteSettings(name: onboardingTwo),
        );
      case onboardingThree:
        return MaterialPageRoute(
          builder: (context) => const OnboardingViewThree(),
          settings: const RouteSettings(name: onboardingThree),
        );
      case getStarted:
        return MaterialPageRoute(
          builder: (context) => const GetStartedView(),
          settings: const RouteSettings(name: getStarted),
        );
      case home:
        return MaterialPageRoute(
          builder: (context) => const NavigationViews(),
          settings: const RouteSettings(name: home),
        );
      case history:
        return MaterialPageRoute(
          builder: (context) => const NavigationViews(),
          settings: const RouteSettings(name: history),
        );
      // case searchNews:
      //   return CustomPageRouteBuilder(
      //     BlocProvider(
      //       create: (context) => sl<ExploreNewsBloc>()
      //         ..add(
      //           const ExploreSearchNews(query: "tech", page: 1),
      //         ),
      //       child: const SearchNewsView(),
      //     ),
      //     ComponentPageTransitionAnimation.slideRight,
      //     const RouteSettings(name: searchNews),
      //   );

      // case detail:
      //   if (arguments is NewsArticleEntities) {
      //     return CustomPageRouteBuilder(
      //       BlocProvider(
      //         create: (_) => sl<BookmarkNewsBloc>(),
      //         child: DetailNewsView(response: [arguments]),
      //       ),
      //       ComponentPageTransitionAnimation.scale,
      //       const RouteSettings(name: detail),
      //     );
      //   }
      //   break;

      // case categoryNews:
      //   if (arguments is CategoryNewsViewArgument) {
      //     if (arguments.isKeyword) {
      //       return CustomPageRouteBuilder(
      //         BlocProvider(
      //           create: (context) => sl<CategoryNewsBloc>()
      //             ..add(
      //               CategoryNewsGetByHeadlines(
      //                 category: arguments.category,
      //                 limit: 20,
      //                 page: 1,
      //                 query: arguments.query,
      //               ),
      //             ),
      //           child: CategoryNewsView(category: arguments),
      //         ),
      //         ComponentPageTransitionAnimation.slideRight,
      //         const RouteSettings(name: categoryNews),
      //       );
      //     }
      //     return CustomPageRouteBuilder(
      //       BlocProvider(
      //         create: (context) => sl<CategoryNewsBloc>()
      //           ..add(
      //             CategoryNewsGetByHeadlines(
      //               category: arguments.category,
      //               limit: 20,
      //               page: 1,
      //               query: arguments.query,
      //             ),
      //           ),
      //         child: CategoryNewsView(category: arguments),
      //       ),
      //       ComponentPageTransitionAnimation.slideRight,
      //       const RouteSettings(name: categoryNews),
      //     );
      //   }
      //   break;
    }
    return null;
  }
}

class CustomPageRouteBuilder extends PageRouteBuilder<dynamic> {
  final Widget? page;
  final ComponentPageTransitionAnimation? transitionAnimation;
  final RouteSettings? routeSettings;

  CustomPageRouteBuilder(
      this.page, this.transitionAnimation, this.routeSettings)
      : super(
          settings: routeSettings,
          pageBuilder:
              (final context, final animation, final secondaryAnimation) =>
                  page!,
          transitionsBuilder: (final context, final animation,
                  final secondaryAnimation, final child) =>
              ComponentRouteAnimation.getAnimation(
            context,
            animation,
            secondaryAnimation,
            child,
            transitionAnimation!,
          ),
        );
}
