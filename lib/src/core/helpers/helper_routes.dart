import 'package:flutter/material.dart';
import 'package:lastmile/src/core/core.dart';
import 'package:lastmile/src/presentation/auth/login/view/finish_registration_view.dart';
import 'package:lastmile/src/presentation/auth/login/view/forgot_password_otp_verify_view.dart';
import 'package:lastmile/src/presentation/auth/login/view/forgot_password_view.dart';
import 'package:lastmile/src/presentation/auth/login/view/login_view.dart';
import 'package:lastmile/src/presentation/auth/login/view/otp_view.dart';
import 'package:lastmile/src/presentation/auth/login/view/phone_number_otp_view.dart';
import 'package:lastmile/src/presentation/auth/login/view/register_view.dart';
import 'package:lastmile/src/presentation/auth/login/view/reset_password_view.dart';
import 'package:lastmile/src/presentation/details/view/delivered_view.dart';
import 'package:lastmile/src/presentation/details/view/delivery_address_view.dart';
import 'package:lastmile/src/presentation/details/view/details_view.dart';
import 'package:lastmile/src/presentation/details/view/package_details_view.dart';
import 'package:lastmile/src/presentation/details/view/pickup_terminal_view.dart';
import 'package:lastmile/src/presentation/details/view/ratings_view.dart';
import 'package:lastmile/src/presentation/history/view/history_view.dart';
import 'package:lastmile/src/presentation/home/view/get_started_view.dart';
import 'package:lastmile/src/presentation/home/view/onboarding_one.dart';
import 'package:lastmile/src/presentation/home/view/onboarding_three.dart';
import 'package:lastmile/src/presentation/home/view/onboarding_two.dart';
import 'package:lastmile/src/presentation/home/view/onboarding_view.dart';
import 'package:lastmile/src/presentation/home/view/splash_view.dart';
import 'package:lastmile/src/presentation/navigation/view/navigation_view.dart';
import 'package:lastmile/src/presentation/notifications/view/notification_view.dart';
import 'package:lastmile/src/presentation/order/view/connecting_dispatch_view.dart';
import 'package:lastmile/src/presentation/order/view/delivery_success_view.dart';
import 'package:lastmile/src/presentation/order/view/order_three_view.dart';
import 'package:lastmile/src/presentation/order/view/order_two_view.dart';
import 'package:lastmile/src/presentation/order/view/order_view.dart';
import 'package:lastmile/src/presentation/profile/view/profile_view.dart';
import 'package:lastmile/src/presentation/search/view/search_view.dart';
import 'package:lastmile/src/presentation/widgets/custom_success_screen.dart';

class RouterGenerator {
  Route<dynamic> generate(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case root:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: const RouteSettings(name: root),
        );
      case onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
          settings: const RouteSettings(name: onboarding),
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
      case register:
        return MaterialPageRoute(
          builder: (context) => const RegisterView(),
          settings: const RouteSettings(name: register),
        );
      case phone_number_otp:
        return MaterialPageRoute(
          builder: (context) => PhoneNumberOtpView(
            phone_number: arguments as String,
          ),
          settings: const RouteSettings(name: phone_number_otp),
        );
      case finish:
        return MaterialPageRoute(
          builder: (context) => FinishRegistrationView(
            phone_number: arguments as String,
          ),
          settings: const RouteSettings(name: finish),
        );
      case login:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
          settings: const RouteSettings(name: login),
        );
      case forgotPass:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordView(),
          settings: const RouteSettings(name: forgotPass),
        );
      case forgotPass_otp_verify:
        return MaterialPageRoute(
          builder: (context) => ForgotPasswordOtpVerification(
            email: arguments as String,
          ),
          settings: const RouteSettings(name: forgotPass_otp_verify),
        );
      case otp_verify:
        return MaterialPageRoute(
          builder: (context) => OtpView(
            email: arguments as String,
          ),
          settings: const RouteSettings(name: otp_verify),
        );
      case reset_password:
        return MaterialPageRoute(
          builder: (context) => ResetPasswordView(
            email: arguments as String,
          ),
          settings: const RouteSettings(name: reset_password),
        );
      case home:
        return MaterialPageRoute(
          builder: (context) => const NavigationViews(),
          settings: const RouteSettings(name: home),
        );
      case history:
        return MaterialPageRoute(
          builder: (context) => const HistoryView(),
          settings: const RouteSettings(name: history),
        );
      case order:
        return MaterialPageRoute(
          builder: (context) => OrderView(
            pickup_address: arguments as String,
            delivery_address: arguments,
          ),
          settings: const RouteSettings(name: order),
        );
      case order_two:
        return MaterialPageRoute(
          builder: (context) => OrderTwoView(
            pickup_address: arguments as String,
            delivery_address: arguments,
            title: arguments,
            weight: arguments,
          ),
          settings: const RouteSettings(name: order_two),
        );
      case order_three:
        return MaterialPageRoute(
          builder: (context) => OrderThreeView(
            pickup_address: arguments as String,
            delivery_address: arguments,
            title: arguments,
            weight: arguments,
            sender_full_name: arguments,
            sender_phone_number: arguments,
            receiver_full_name: arguments,
            receiver_phone_number: arguments,
            note: arguments,
          ),
          settings: const RouteSettings(name: order_three),
        );
      case profile:
        return MaterialPageRoute(
          builder: (context) => const ProfileView(),
          settings: const RouteSettings(name: profile),
        );
      case search:
        return MaterialPageRoute(
          builder: (context) => const SearchView(),
          settings: const RouteSettings(name: search),
        );
      case details:
        return MaterialPageRoute(
          builder: (context) => const DetailsView(),
          settings: const RouteSettings(name: details),
        );
      case package_details:
        return MaterialPageRoute(
          builder: (context) => const PackageDetailsView(),
          settings: const RouteSettings(name: package_details),
        );
      case pickup_terminal:
        return MaterialPageRoute(
          builder: (context) => const PickupTerminalView(),
          settings: const RouteSettings(name: pickup_terminal),
        );
      case delivery_address:
        return MaterialPageRoute(
          builder: (context) => const DeliveryAddressView(),
          settings: const RouteSettings(name: delivery_address),
        );
      case connecting_dispatch:
        return MaterialPageRoute(
          builder: (context) => const ConnectingDispatchView(),
          settings: const RouteSettings(name: connecting_dispatch),
        );
      case delivery_success:
        return MaterialPageRoute(
          builder: (context) => const DeliverySuccessView(),
          settings: const RouteSettings(name: delivery_success),
        );
      case delivered:
        return MaterialPageRoute(
          builder: (context) => const DeliveredView(),
          settings: const RouteSettings(name: delivery_success),
        );
      case ratings:
        return MaterialPageRoute(
          builder: (context) => const RatingsView(),
          settings: const RouteSettings(name: ratings),
        );
      case notifications:
        return MaterialPageRoute(
          builder: (context) => const NotificationsView(),
          settings: const RouteSettings(name: notifications),
        );
      case success:
        return MaterialPageRoute(
          builder: (context) => CustomSuccessScreen(
            title: arguments as String,
            info: arguments,
            route: arguments,
            buttonTitle: arguments,
          ),
          settings: const RouteSettings(name: success),
        );
      default:
        return onUnknownRoute(const RouteSettings(name: '/Feature'));
    }
  }

  static Route onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text('Feature Comming soon..'),
        ),
      ),
    );
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
