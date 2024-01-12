import 'package:flutter/material.dart';
import 'package:lastmile/src/core/core.dart';
import 'package:lastmile/src/presentation/auth/login/view/change_phone_number_view.dart';
import 'package:lastmile/src/presentation/auth/login/view/change_phone_otp_view.dart';
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
import 'package:lastmile/src/presentation/profile/view/about_us_view.dart';
import 'package:lastmile/src/presentation/profile/view/faq_view.dart';
import 'package:lastmile/src/presentation/profile/view/help_view.dart';
import 'package:lastmile/src/presentation/profile/view/my_information_view.dart';
import 'package:lastmile/src/presentation/profile/view/profile_view.dart';
import 'package:lastmile/src/presentation/profile/view/terms_and_conditions_view.dart';
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
          builder: (context) =>
              ResetPasswordView(email: arguments as String, token: arguments),
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
            lng: arguments,
            lat: arguments,
            house_number: arguments,
            street: arguments,
            area: arguments,
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
            lng: arguments,
            lat: arguments,
            house_number: arguments,
            street: arguments,
            area: arguments,
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
            terminal_lng: arguments,
            terminal_lat: arguments,
            lat: arguments,
            lng: arguments,
            house_number: arguments,
            street: arguments,
            area: arguments,
          ),
          settings: const RouteSettings(name: order_three),
        );
      case profile:
        return MaterialPageRoute(
          builder: (context) => const ProfileView(),
          settings: const RouteSettings(name: profile),
        );
      case my_information:
        return MaterialPageRoute(
          builder: (context) => const MyInformationView(),
          settings: const RouteSettings(name: my_information),
        );
      case terms_conditions:
        return MaterialPageRoute(
          builder: (context) => const TermsAndConditionsView(),
          settings: const RouteSettings(name: terms_conditions),
        );
      case faqs:
        return MaterialPageRoute(
          builder: (context) => const FAQView(),
          settings: const RouteSettings(name: faqs),
        );
      case about_us:
        return MaterialPageRoute(
          builder: (context) => const AboutUsView(),
          settings: const RouteSettings(name: about_us),
        );
      case help:
        return MaterialPageRoute(
          builder: (context) => const HelpView(),
          settings: const RouteSettings(name: help),
        );
      case change_phone_number:
        return MaterialPageRoute(
          builder: (context) => const ChangePhoneNumber(),
          settings: const RouteSettings(name: change_phone_number),
        );
      case change_phone_otp:
        return MaterialPageRoute(
          builder: (context) => ChangePhoneOtpView(
            phone_number: arguments as String,
          ),
          settings: const RouteSettings(name: change_phone_otp),
        );
      case search:
        return MaterialPageRoute(
          builder: (context) => const SearchView(),
          settings: const RouteSettings(name: search),
        );
      case details:
        return MaterialPageRoute(
          builder: (context) => DetailsView(
            id: arguments as int,
          ),
          settings: const RouteSettings(name: details),
        );
      case package_details:
        return MaterialPageRoute(
          builder: (context) => PackageDetailsView(
            id: arguments as int,
          ),
          settings: const RouteSettings(name: package_details),
        );
      case pickup_terminal:
        return MaterialPageRoute(
          builder: (context) => PickupTerminalView(
            deliveryAddress: arguments as String,
          ),
          settings: const RouteSettings(name: pickup_terminal),
        );
      case delivery_address:
        return MaterialPageRoute(
          builder: (context) => DeliveryAddressView(
            pickupAddress: arguments as String,
          ),
          settings: const RouteSettings(name: delivery_address),
        );
      case connecting_dispatch:
        return MaterialPageRoute(
          builder: (context) => ConnectingDispatchView(
            title: arguments as String,
          ),
          settings: const RouteSettings(name: connecting_dispatch),
        );
      case delivery_success:
        return MaterialPageRoute(
          builder: (context) => DeliverySuccessView(
            title: arguments as String,
          ),
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
