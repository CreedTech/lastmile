import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lastmile/src/presentation/history/bloc/history/history_bloc.dart';
import 'package:lastmile/src/presentation/history/view/history_view.dart';
import 'package:lastmile/src/presentation/home/bloc/home/home_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../core/components/component_theme.dart';
import '../../../injector.dart';
import '../../home/view/home_view.dart';

class NavigationViews extends StatelessWidget {
  const NavigationViews({super.key});

  List<Widget> _buildScreens() {
    return [
      BlocProvider(
        create: (_) => sl<HomeBloc>(),
        child: const HomeView(),
      ),
      BlocProvider(
        create: (_) => sl<HistoryBloc>(),
        child: const HistoryView(),
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        title: 'Home',
        textStyle: const TextStyle(color: colorWhite),
        icon: SvgPicture.asset(
          "assets/icons/home.svg",
          height: 20.h,
          width: 20.w,
          color: colorWhite,
        ),
        inactiveIcon: SvgPicture.asset(
          "assets/icons/home.svg",
          height: 20.h,
          width: 20.w,
          color: colorWhite,
        ),
      ),
      // PersistentBottomNavBarItem(
      //   icon: SvgPicture.asset(
      //     "assets/icons/order.svg",
      //     color: colorPrimary,
      //     height: 20.h,
      //     width: 20.w,
      //   ),
      //   inactiveIcon: SvgPicture.asset(
      //     "assets/icons/order.svg",
      //     height: 20.h,
      //     width: 20.w,
      //     color: Theme.of(context).brightness == Brightness.dark
      //         ? colorWhite
      //         : colorsBlack,
      //   ),
      // ),
      PersistentBottomNavBarItem(
        title: 'History',
        textStyle: const TextStyle(color: colorWhite),
        icon: SvgPicture.asset(
          "assets/icons/history.svg",
          height: 20.h,
          width: 20.w,
          color: colorPrimary,
        ),
        inactiveIcon: SvgPicture.asset(
          "assets/icons/history.svg",
          height: 20.h,
          width: 20.w,
          color: colorWhite,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarsItems(context),
      navBarHeight: 65.h,
      backgroundColor: colorsBlack,
      confineInSafeArea: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: const NavBarDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 0.2,
            spreadRadius: 0.2,
          ),
        ],
        // borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 100),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }
}
