import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lastmile/src/core/core.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // titleSpacing: 20,
        elevation: 0,
        title: Column(
          children: [
            Text('Send Package').boldSized(16.sp).colors(colorsBlack),
            Text('Step 1 of 3').normalSized(10.sp).colors(colorsBlack),
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
      body: Stack(
        children: [
          Text('Yo'),
          Stepper(
            type: StepperType.vertical,
            steps: [
              const Step(
                title: Text('Account'),
                content: Center(
                  child: Text('Account'),
                ),
              ),
              const Step(
                title: Text('Address'),
                content: Center(
                  child: Text('Address'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
