import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lastmile/src/core/core.dart';
import 'package:lastmile/src/data/api/global_services.dart';
import 'package:lastmile/src/presentation/details/view/delivered_view.dart';
import 'package:lastmile/src/presentation/navigation/view/navigation_view.dart';
import 'package:http/http.dart' as http;

class PackageDetailsView extends StatefulWidget {
  const PackageDetailsView({super.key, required this.id});
  final int id;

  @override
  State<PackageDetailsView> createState() => _PackageDetailsViewState();
}

class _PackageDetailsViewState extends State<PackageDetailsView> {
  @override
  void initState() {
    super.initState();
    fetchSingleData(widget.id);
    _scheduleNavigation();
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

  void _scheduleNavigation() {
    // Generate a random number of seconds between 5 and 15
    final random = Random();
    final randomSeconds = random.nextInt(11) + 5;

    // Schedule the navigation after the random number of seconds
    Future.delayed(
        Duration(seconds: randomSeconds), () => _navigateToNextScreen());
  }

  void _navigateToNextScreen() {
    // Replace 'YourNextScreen()' with the widget or screen you want to navigate to
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => DeliveredView()),
    );
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
        child: Stack(
          children: [
            Positioned(
              top: 50.h,
              left: 30.w,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavigationViews(),
                      ),
                      (route) => false);
                },
                child: Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    color: colorWhite,
                    // border: Border.all(
                    //   color: colorsBlack,
                    // ),
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
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/points.png',
                    width: 250.h,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 50.h,
                  ),
                  child: Center(
                    child: Container(
                      width: 350.w,
                      height: 370.h,
                      decoration: BoxDecoration(
                        color: colorWhite,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.sp),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 32.h,
                          horizontal: 16.w,
                        ),
                        child: FutureBuilder<Map<String, dynamic>>(
                            future: fetchSingleData(widget.id),
                            builder: (context, snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.none:
                                  return Text('Press button to start.');
                                case ConnectionState.active:
                                case ConnectionState.waiting:
                                  return Center(
                                      child: CircularProgressIndicator());
                                case ConnectionState.done:
                                  if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else {
                                    if (snapshot.data!['status'] == false) {
                                      return Text(
                                          'Error: ${snapshot.data!['msg']}');
                                    }

                                    // Check if data is empty
                                    if (snapshot.data!['data'] == null ||
                                        snapshot.data!['data'].isEmpty) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Package Details',
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
                                                        color:
                                                            Color(0xfff3f3f3),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.all(
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
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 24.h),
                                              child: ListTile(
                                                minLeadingWidth: 0,
                                                contentPadding: EdgeInsets.zero,
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
                                                      'assets/images/parcel.png'),
                                                ),
                                                title: Text(
                                                  snapshot.data!['data']
                                                      ['title'],
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
                                                        fontWeight:
                                                            FontWeight.w400,
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
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 100.w,
                                                      child: Text(
                                                        'Receiver',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 12.sp,
                                                            color: colorGray),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 100.w,
                                                      child: Text(
                                                        snapshot.data!['data']
                                                            ['receiver_name'],
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 14.sp,
                                                            color: colorsBlack),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
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
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Amount',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12.sp,
                                                          color: colorGray),
                                                    ),
                                                    Text(
                                                      'N ${snapshot.data!['data']['charge'].toString()}',
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
                                              ],
                                            ),
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(top: 30.h),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context)
                                                        .pushNamed(
                                                      package_details,
                                                    );
                                                  },
                                                  child: Container(
                                                    // width: MediaQuery.of(context).size.width,
                                                    height: 60,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 6.h),
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      color: colorsBlack,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  88.sp)),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Container(
                                                              width: 65.w,
                                                              height: 65.w,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            80.sp)),
                                                              ),
                                                              child: Image.asset(
                                                                  'assets/images/driver.png'),
                                                            ),
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Driver',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                                Text(
                                                                  'Yinka Williams',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      20.w),
                                                          child: Image.asset(
                                                            'assets/icons/phone.png',
                                                            width: 20.w,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 10.h),
                                              child: Text(
                                                'Cancel order',
                                                style: TextStyle(
                                                  color: colorPrimary,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16.sp,
                                                ),
                                              ),
                                            ),
                                          ],
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
