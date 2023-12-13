import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/core.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorWhite,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: colorsBlack,
          ),
        ),
        title: Text(
          'Notification',
        ).boldSized(22.sp).colors(colorsBlack),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AlertDialog.adaptive(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(30, 30, 30, 20),
                              elevation: 0,
                              alignment: Alignment.bottomCenter,
                              insetPadding: const EdgeInsets.all(0),
                              scrollable: true,
                              title: null,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                              ),
                              content: SizedBox(
                                child: SizedBox(
                                  width: 400,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 40),
                                        child: Column(
                                          children: [
                                            ListTile(
                                              leading: Container(
                                                width: 48.w,
                                                height: 48.h,
                                                decoration: BoxDecoration(
                                                  color: Color(0xffE9E9E9),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(50.sp),
                                                  ),
                                                ),
                                                child: Image.asset(
                                                  'assets/icons/check_double.png',
                                                  color: colorsBlack,
                                                  // width: 24.w,
                                                  scale: 3,
                                                ),
                                              ),
                                              title: Text(
                                                'Mark all as read',
                                                style: GoogleFonts.nunito(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            ListTile(
                                              leading: Container(
                                                width: 48.w,
                                                height: 48.h,
                                                decoration: BoxDecoration(
                                                  color: Color(0xffF6CFCF),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(50.sp),
                                                  ),
                                                ),
                                                child: Image.asset(
                                                  'assets/icons/trash.png',
                                                  color: colorPrimary,
                                                  // width: 24.w,
                                                  scale: 3,
                                                ),
                                              ),
                                              title: Text(
                                                'Delete all notifications',
                                                style: GoogleFonts.nunito(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: colorPrimary,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      });
                },
                child: Image.asset(
                  'assets/icons/filter.png',
                  width: 20.w,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24.h),
              child: ListView.builder(
                  itemCount: deliveryNotifications.length,
                  itemBuilder: (context, index) {
                    final notifications = deliveryNotifications[index];
                    final formattedTime = _formatTime(notifications.time);
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      child: ListTile(
                        minLeadingWidth: 0,
                        contentPadding: EdgeInsets.zero,
                        leading: Stack(
                          children: [
                            Container(
                              width: 48.w,
                              height: 48.h,
                              decoration: BoxDecoration(
                                color: Color(0xffE9E9E9),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50.sp),
                                ),
                              ),
                              child: Image.asset(
                                'assets/icons/notification_off.png',
                                color: notifications.isRead
                                    ? colorsBlack
                                    : colorGray,
                                // width: 24.w,
                                scale: 4,
                              ),
                            ),
                            notifications.isRead
                                ? Positioned(
                                    right: 5,
                                    child: Container(
                                      width: 8.w,
                                      height: 8.w,
                                      decoration: BoxDecoration(
                                        color: colorPrimary,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(50.sp),
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        ),
                        title: Text(
                          notifications.title,
                          style: GoogleFonts.nunito(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          notifications.description,
                          style: GoogleFonts.nunito(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        trailing: Text(formattedTime),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inHours > 0) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else {
      return 'just now';
    }
  }
}

class DeliveryNotification {
  final String title;
  final String description;
  final DateTime time;
  final bool isRead;

  DeliveryNotification({
    required this.title,
    required this.description,
    required this.time,
    required this.isRead,
  });
}

List<DeliveryNotification> deliveryNotifications = [
  DeliveryNotification(
    title: 'Order Shipped',
    description:
        'Tracking number BLQ65807654 has been generated for your order',
    time: DateTime.now().subtract(Duration(hours: 2)),
    isRead: true,
  ),
  DeliveryNotification(
    title: 'Delivery Update',
    description: 'Your package is out for delivery.',
    time: DateTime.now().subtract(Duration(minutes: 45)),
    isRead: false,
  ),
  DeliveryNotification(
    title: 'Delivery Successful',
    description: 'Your order has been successfully delivered.',
    time: DateTime.now().subtract(Duration(minutes: 20)),
    isRead: false,
  ),
  DeliveryNotification(
    title: 'Delivery Successful',
    description: 'Your order has been successfully delivered.',
    time: DateTime.now().subtract(Duration(minutes: 20)),
    isRead: false,
  ),
  DeliveryNotification(
    title: 'Delivery Successful',
    description: 'Your order has been successfully delivered.',
    time: DateTime.now().subtract(Duration(minutes: 20)),
    isRead: false,
  ),
  // Add more notifications as needed
];
