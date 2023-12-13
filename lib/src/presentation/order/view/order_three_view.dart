import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/core.dart';

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
      required this.receiver_phone_number});
  final String pickup_address;
  final String delivery_address;
  final String title;
  final String weight;
  final String sender_full_name;
  final String sender_phone_number;
  final String receiver_full_name;
  final String receiver_phone_number;
  final String note;

  @override
  State<OrderThreeView> createState() => _OrderThreeViewState();
}

class _OrderThreeViewState extends State<OrderThreeView> {
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
                        'Macbook Pro 2022',
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
                            width: 110.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'From',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      color: colorGray),
                                ),
                                Text(
                                  widget.pickup_address,
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
                            width: 100.w,
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
                                      '2.2 km',
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
                      Navigator.of(context).pushNamed(
                        connecting_dispatch,
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
