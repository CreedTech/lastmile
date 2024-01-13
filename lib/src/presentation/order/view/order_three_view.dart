// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lastmile/src/presentation/order/view/connecting_dispatch_view.dart';

import '../../../core/core.dart';
import '../../../data/api/global_services.dart';

class OrderThreeView extends StatefulWidget {
  const OrderThreeView(
      {super.key,
      required this.pickup_address,
      required this.delivery_address,
      required this.title,
      required this.weight,
      required this.sender_full_name,
      required this.sender_phone_number,
      required this.receiver_full_name,
      required this.note,
      required this.receiver_phone_number,
      required this.lng,
      required this.lat,
      required this.terminal_lng,
      required this.terminal_lat,
      required this.house_number,
      required this.street,
      required this.area});
  final String pickup_address;
  final String delivery_address;
  final String title;
  final String weight;
  final String sender_full_name;
  final String sender_phone_number;
  final String receiver_full_name;
  final String receiver_phone_number;
  final String note;
  final String lng;
  final String lat;
  final String terminal_lng;
  final String terminal_lat;
  final String house_number;
  final String street;
  final String area;

  @override
  State<OrderThreeView> createState() => _OrderThreeViewState();
}

class _OrderThreeViewState extends State<OrderThreeView> {
  String distance = '';
  String duration = '';
  String fee = '';
  @override
  void initState() {
    super.initState();
    print(widget.lng);
    // double distance = calculateDistance(
    //   double.parse(widget.lat),
    //   double.parse(widget.lng),
    // );
    // print('Distance: $distance km');
    initializeData();
  }

  Future<void> initializeData() async {
    final distanceValue =
        await GlobalService.sharedPreferencesManager.getDistance();
    final durationValue =
        await GlobalService.sharedPreferencesManager.getDistance();
    final feeValue = await GlobalService.sharedPreferencesManager.getDistance();
    // String address;
    // String address = terminalValue['address'];
    setState(() {
      distance = distanceValue;
      duration = durationValue;
      fee = feeValue;
      print('_terminal');
      print(distance);
      print(duration);
      print(fee);
    });
  }

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
        title: Padding(
          padding: EdgeInsets.all(12.sp),
          child: Column(
            children: [
              Text(
                'Send Package',
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w500,
                  fontSize: 22.sp,
                  color: colorsBlack,
                ),
              ),
              Text(
                'Step 3 of 3',
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  color: colorGray,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 32.h,
            horizontal: 16.w,
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Text(
                    'Confirm Package Details',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    child: ListTile(
                      minLeadingWidth: 0,
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        width: 48.w,
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: Color(0xffF6CFCF),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50.sp),
                          ),
                        ),
                        child: Image.asset('assets/images/parcel.png'),
                      ),
                      title: Text(
                        widget.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 150.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'From',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: colorGray,
                                  ),
                                ),
                                Text(
                                  widget.pickup_address,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      color: colorsBlack),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          SizedBox(
                            width: 150.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Destination',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      color: colorGray),
                                ),
                                Text(
                                  widget.delivery_address,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      color: colorsBlack),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                      SizedBox(height: 18.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 12.h),
                          Text(
                            'Package Details',
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w400,
                                fontSize: 18.sp,
                                color: colorsBlack),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                // width: 110.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Title',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.sp,
                                          color: colorGray),
                                    ),
                                    Text(
                                      widget.title,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          color: colorsBlack),
                                    ),
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   width: 30.w,
                              // ),
                              SizedBox(
                                // width: 100.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Weight',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.sp,
                                          color: colorGray),
                                    ),
                                    Text(
                                      '${widget.weight} kg',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          color: colorsBlack),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                // width: 100.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Distance',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.sp,
                                          color: colorGray),
                                    ),
                                    Text(
                                      distance,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          color: colorsBlack),
                                    ),
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   width: 30.w,
                              // ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 18.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 12.h),
                          Text(
                            'Contact Details',
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w400,
                                fontSize: 18.sp,
                                color: colorsBlack),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                // width: 100.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Receiver',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.sp,
                                          color: colorGray),
                                    ),
                                    Text(
                                      '${widget.receiver_full_name}',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          color: colorsBlack),
                                    ),
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   width: 30.w,
                              // ),
                              SizedBox(
                                // width: 100.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Mobile number',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.sp,
                                          color: colorGray),
                                    ),
                                    Text(
                                      '${widget.receiver_phone_number}',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          color: colorsBlack),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 50.h),
                    child: Container(
                      decoration: BoxDecoration(
                        color: colorLightGray,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Once your delivery order is confirmed, a tracking number will be generated automatically.',
                          style: GoogleFonts.nunito(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: colorGray),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 0.h),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ConnectingDispatchView(
                            title: widget.title,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      // width: MediaQuery.of(context).size.width,
                      height: 50,
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: colorPrimary,
                        borderRadius: BorderRadius.all(Radius.circular(88.sp)),
                      ),
                      child: Text(
                        'Place Order',
                        style: TextStyle(fontSize: 14.sp, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
//   const double earthRadius = 6371; // Earth's radius in kilometers

//   // Convert degrees to radians
//   double toRadians(double degree) {
//     return degree * pi / 180.0;
//   }

//   // Calculate differences in latitude and longitude
//   double dLat = toRadians(lat2 - lat1);
//   double dLon = toRadians(lon2 - lon1);

//   // Haversine formula
//   double a = sin(dLat / 2) * sin(dLat / 2) +
//       cos(toRadians(lat1)) *
//           cos(toRadians(lat2)) *
//           sin(dLon / 2) *
//           sin(dLon / 2);

//   double c = 2 * atan2(sqrt(a), sqrt(1 - a));

//   // Distance in kilometers
//   double distance = earthRadius * c;

//   return distance;
// }
