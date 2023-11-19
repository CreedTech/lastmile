import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lastmile/src/core/core.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // titleSpacing: 20,
        elevation: 0,
        title: Column(
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 70.w,
            ),
          ],
        ),
        backgroundColor: colorWhite,
        actions: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Guide.isDark(context) ? colorsBlack : colorWhite,
              elevation: 0,
            ),
            child: Icon(Icons.notifications_none_outlined,
                weight: 24.h,
                color: Guide.isDark(context) ? darkThemeText : colorsBlack)
            //  SvgPicture.asset(
            //   "assets/icons/notification.svg",
            //   height: 24.h,
            //   width: 24.w,
            //   color: Guide.isDark(context) ? darkThemeText : colorsBlack,
            // )
            ,
          ),
        ],
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
