import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lastmile/src/core/core.dart';
import 'package:lastmile/src/presentation/details/view/package_details_view.dart';
import 'package:timelines/timelines.dart';
import 'package:http/http.dart' as http;

import '../../../data/api/global_services.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key, required this.id});
  final int id;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  final List<Map<String, String>> deliveryStatus = [
    {
      'title': 'Tracking number created',
      'subtitle': 'Order placed successfully'
    },
    {'title': 'Pending', 'subtitle': 'The package has been picked'},
    {'title': 'In transit', 'subtitle': 'The order is in transit'},
  ];
  @override
  void initState() {
    super.initState();
    fetchSingleData(widget.id);
  }

  Future<Map<String, dynamic>> fetchSingleData(id) async {
    String authToken =
        await GlobalService.sharedPreferencesManager.getAuthToken();
    final String apiUrl = AppConstants.BASE_URL;
    // final String authToken = 'your_auth_token';

    try {
      final response = await http.get(
        Uri.parse(apiUrl + AppConstants.RECENT_ORDER + id.toString()),
        headers: {
          'Authorization': 'Bearer $authToken',
          'Content-Type':
              'application/json', // Adjust content type based on your API
        },
      );

      if (response.statusCode == 200) {
        // Parse and handle the response data
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print('Data: $responseData');
        return jsonDecode(response.body);
      } else {
        // Handle error response
        print('Error: ${response.statusCode}, ${response.body}');
        throw Exception('Failed to load data');
      }
    } catch (error) {
      // Handle network or other errors
      print('Error: $error');
      throw Exception(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/map_bg.png'), // Replace with your image asset path
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 70.h),
          child: Container(
            width: 350.w,
            height: 700.h,
            decoration: BoxDecoration(
              color: colorWhite,
              borderRadius: BorderRadius.all(
                Radius.circular(16.sp),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.w),
              child: FutureBuilder<Map<String, dynamic>>(
                  future: fetchSingleData(widget.id),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Text('Press button to start.');
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());
                      case ConnectionState.done:
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          if (snapshot.data!['status'] == false) {
                            return Text('Error: ${snapshot.data!['msg']}');
                          }

                          // Check if data is empty
                          if (snapshot.data!['data'] == null ||
                              snapshot.data!['data'].isEmpty) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Image.asset(
                                //   'assets/images/logo.png',
                                //   height: 200.h,
                                // ),
                                Container(
                                  height: 400.h,
                                  child: Center(
                                    child: Text(
                                      "You have no delivery order",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.nunito(
                                        color: colorsBlack,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            );
                          }
                          print('data');
                          print(snapshot.data!['data']);
                          return Stack(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Tracking Details',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20.sp,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width: 24.w,
                                          height: 24.h,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color(0xfff3f3f3),
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(16.sp),
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.close,
                                            size: 10.w,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 24.h),
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
                                        child: Image.asset(
                                            'assets/images/parcel.png'),
                                      ),
                                      title: Text(
                                        snapshot.data!['data']['title'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Text(
                                            'Tracking ID: ${snapshot.data!['data']['tracking_code']}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14.sp,
                                              color: colorsBlack,
                                            ),
                                          ),
                                          Icon(
                                            Icons.copy,
                                            color: colorPrimary,
                                            size: 12.sp,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xfff3f3f3),
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8.sp),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(12.sp),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 110.w,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'From',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12.sp,
                                                          color: colorGray),
                                                    ),
                                                    Text(
                                                      snapshot.data!['data']
                                                          ['terminal'],
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
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
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Destination',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12.sp,
                                                          color: colorGray),
                                                    ),
                                                    Text(
                                                      snapshot.data!['data']
                                                          ['street'],
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
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
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 110.w,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Receiver',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12.sp,
                                                          color: colorGray),
                                                    ),
                                                    Text(
                                                      snapshot.data!['data']
                                                          ['receiver_name'],
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
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
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Weight',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12.sp,
                                                          color: colorGray),
                                                    ),
                                                    Text(
                                                      '${snapshot.data!['data']['weight']} kg',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 14.sp,
                                                          color: colorsBlack),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Spacer(),
                                              // SizedBox(
                                              //   width: 30.w,
                                              // ),
                                            ],
                                          ),
                                          SizedBox(height: 18.h),
                                          Row(
                                            children: [
                                              Text(
                                                'Status: ',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12.sp,
                                                    color: colorsBlack),
                                              ),
                                              // SizedBox(
                                              //   width: 30.w,
                                              // ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: colorInTransit,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(75.sp),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 12.w,
                                                      vertical: 5.h),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        width: 8.w,
                                                        height: 8.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              colorInTransitText,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(
                                                                50.sp),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 3.w,
                                                      ),
                                                      Text(
                                                        snapshot.data!['data'][
                                                                'pay_on_delivery']
                                                            ? 'In Transit'
                                                            : '',
                                                        style: TextStyle(
                                                          color:
                                                              colorInTransitText,
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 300.h,
                                    child: Timeline.tileBuilder(
                                      theme: TimelineTheme.of(context).copyWith(
                                        nodePosition: 0,
                                        color: colorPrimary,
                                        indicatorPosition: 0,
                                      ),
                                      builder: TimelineTileBuilder.fromStyle(
                                        // indicatorStyle: IndicatorStyle.dot,
                                        connectorStyle:
                                            ConnectorStyle.dashedLine,
                                        contentsAlign: ContentsAlign.basic,
                                        // connectorStyle: ConnectorStyle.dashedLine,
                                        // endConnectorStyle: ConnectorStyle.transparent,
                                        contentsBuilder: (context, index) =>
                                            Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 25, vertical: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                deliveryStatus[index]['title']!,
                                                style: GoogleFonts.nunito(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16.sp),
                                              ),
                                              // SizedBox(height: 5),
                                              Text(
                                                deliveryStatus[index]
                                                    ['subtitle']!,
                                                style: GoogleFonts.nunito(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.sp),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // itemExtent: 40.0,
                                        itemCount: snapshot.data!['data']
                                                ['pay_on_delivery']
                                            ? 3
                                            : 1,
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
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PackageDetailsView(
                                                    id: snapshot.data!['data']
                                                        ['id'])),
                                      );
                                    },
                                    child: Container(
                                      // width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15.h),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: colorPrimary,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(88.sp)),
                                      ),
                                      child: Text(
                                        'Live Track',
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                    }
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
