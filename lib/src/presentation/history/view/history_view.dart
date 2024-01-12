import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/core.dart';
import '../../../data/api/global_services.dart';
import '../../details/view/details_view.dart';
import '../../search/view/search_view.dart';
import 'package:http/http.dart' as http;

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  void initState() {
    super.initState();
    // fetchDeliveriesByStatus();
  }

  Future<Map<String, dynamic>> fetchDeliveriesByStatus(String status) async {
    String authToken =
        await GlobalService.sharedPreferencesManager.getAuthToken();
    final String apiUrl = AppConstants.BASE_URL;
    // final String authToken = 'your_auth_token';

    try {
      final response = await http.get(
        Uri.parse('${apiUrl}/order/filter/?status=${status}'),
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

  List deliveries = [
    {
      "icon": "assets/icons/truck.png",
      "status": "Cancelled",
      "description": "Macbook Pro 2022",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "Cancelled",
      "description": "Macbook Pro 2022",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "Cancelled",
      "description": "Macbook Pro 2022",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "Cancelled",
      "description": "Macbook Pro 2022",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "Cancelled",
      "description": "Macbook Pro 2022",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "Cancelled",
      "description": "Macbook Pro 2022",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "Cancelled",
      "description": "Macbook Pro 2022",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "Cancelled",
      "description": "Macbook Pro 2022",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "Processing",
      "description": "Macbook Pro 2022",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "Processing",
      "description": "Macbook Pro 2022",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "Processing",
      "description": "Macbook Pro 2022",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "Processing",
      "description": "Macbook Pro 2022",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "Processing",
      "description": "Macbook Pro 2022",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "Processing",
      "description": "Macbook Pro 2022",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "Processing",
      "description": "Macbook Pro 2022",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "Processing",
      "description": "Macbook Pro 2022",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "Processing",
      "description": "Macbook Pro 2022",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "Processing",
      "description": "Macbook Pro 2022",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "Processing",
      "description": "Macbook Pro 2022",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "Processing",
      "description": "Macbook Pro 2022",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "completed",
      "description": "Macbook Pro 2022",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "Pending",
      "description": "Macbook Pro 2022",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "Pending",
      "description": "Macbook Pro 2022",
      "date": "June 20"
    },
  ];

  static List<Tab> tabs = <Tab>[
    Tab(
      child: Container(
        width: 100.w,
        height: 38.h,
        child: Center(
          child: Text(
            "All",
            textAlign: TextAlign.center,
            style: TextStyle(
                // color: colorWhite,
                ),
          ),
        ),
      ),
    ),
    Tab(
      child: Container(
        width: 100.w,
        height: 38.h,
        child: Center(
          child: Text(
            "Pending",
            textAlign: TextAlign.center,
            style: TextStyle(
                // color: colorWhite,
                ),
          ),
        ),
      ),
    ),
    Tab(
      child: Container(
        width: 100.w,
        height: 38.h,
        child: Center(
          child: Text(
            "Processing",
            textAlign: TextAlign.center,
            style: TextStyle(
                // color: colorWhite,
                ),
          ),
        ),
      ),
    ),
    Tab(
      child: Container(
        width: 100.w,
        height: 38.h,
        child: Center(
          child: Text(
            "Delivered",
            textAlign: TextAlign.center,
            style: TextStyle(
                // color: colorWhite,
                ),
          ),
        ),
      ),
    ),
    Tab(
      child: Container(
        width: 100.w,
        height: 38.h,
        child: Center(
          child: Text(
            "Cancelled",
            textAlign: TextAlign.center,
            style: TextStyle(
                // color: colorWhite,
                ),
          ),
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            // fit: StackFit.expand,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 26.w,
                  vertical: 32.h,
                ),
                child: Column(
                  children: [
                    Text(
                      'Order history',
                      style: GoogleFonts.nunito(
                          fontSize: 22.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      'Please enter your package tracking number gotten from your checkout receipt',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                          fontSize: 14.sp, fontWeight: FontWeight.w400),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 24.h),
                      child: TextFormField(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchView(),
                            ),
                          );
                        },
                        readOnly: true, // Set readOnly to true
                        decoration: InputDecoration(
                          fillColor: colorWhite,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4.sp),
                            ),
                            borderSide: const BorderSide(
                              color: Color(0xffA4A5A6),
                            ),
                          ),
                          hintText: 'Enter your package tracking number',
                          hintStyle: GoogleFonts.nunito(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal,
                          ),
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: Image.asset(
                            'assets/icons/search_box.png',
                            scale: 3.5,
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.all(14.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TabBar(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(112.0), // Border radius
                  color: colorPrimary,
                ),
                padding: EdgeInsets.only(left: 15.w),
                labelStyle: GoogleFonts.nunito(
                  color: colorWhite,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                unselectedLabelColor: colorGray,
                unselectedLabelStyle: GoogleFonts.nunito(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                // labelColor: colorPrimary,
                tabs: tabs,
                isScrollable: true,
              ),
              Expanded(
                child: TabBarView(
                  // children: [

                  //   for (var tab in tabs)
                  //     // DeliveryStatusView(status: tab.text ?? ''),
                  // ],
                  children: [
                    // All Tab
                    DeliveryStatusView(status: ''),

                    // Pending Tab
                    DeliveryStatusView(
                      status: 'Pending',
                    ),

                    // Processing Tab
                    DeliveryStatusView(
                      status: 'ASSIGNED',
                    ),

                    // Delivered Tab
                    DeliveryStatusView(
                      status: 'COMPLETED',
                    ),

                    // Cancelled Tab
                    DeliveryStatusView(
                      status: 'CANCELLED',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List getDeliveriesByStatus(String status) {
    return deliveries
        .where((delivery) => delivery['status'] == status)
        .toList();
  }
}

class DeliveryStatusView extends StatelessWidget {
  final String status;

  DeliveryStatusView({required this.status});
  Future<Map<String, dynamic>> fetchDeliveriesByStatus(String status) async {
    String authToken =
        await GlobalService.sharedPreferencesManager.getAuthToken();
    final String apiUrl = AppConstants.BASE_URL;
    // final String authToken = 'your_auth_token';

    print(status);
    print(status);
    try {
      final response = await http.get(
        Uri.parse('${apiUrl}/order/filter/?status=${status}'),
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
    return FutureBuilder<Map<String, dynamic>>(
      future: fetchDeliveriesByStatus(status),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
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
          final delivery;
          if (snapshot.data!['data'] is Map<String, dynamic> &&
              snapshot.data!['data'].containsKey('results')) {
            delivery = snapshot.data!['data']['results'];
          } else {
            delivery = snapshot.data!['data'];
          }
          return ListView.builder(
            itemCount: delivery.length,
            itemBuilder: (context, index) {
              // final delivery = deliveries[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsView(
                        id: delivery[0]['id'],
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 100,
                  margin: EdgeInsets.only(top: 8, left: 16.h, right: 16.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFFCFCFC),
                    // border: Border.all(
                    //   color: const Color(0xFFE1E1E1),
                    // ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFFCFCFC).withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              delivery[0]['title'],
                              style: TextStyle(
                                color: colorsBlack,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    delivery[0]['status'] == 'Pending'
                                        ? 'assets/icons/Processing.png'
                                        : delivery[0]['status'] == 'Delivered'
                                            ? 'assets/icons/paid.png'
                                            : delivery[0]['status'] ==
                                                    'Cancelled'
                                                ? 'assets/icons/Cancelled.png'
                                                : 'assets/icons/Processing.png',
                                    width: 20.w,
                                    alignment: Alignment.center,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    delivery[0]['status'] == 'Pending'
                                        ? 'Waiting for Order'
                                        : delivery[0]['status'] == 'Delivered'
                                            ? 'Payment on Delivery'
                                            : delivery[0]['status'] ==
                                                    'Cancelled'
                                                ? 'Order Cancelled'
                                                : 'Payment on Delivery',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              delivery[0]['status'] == 'Pending'
                                  ? 'Waiting for Order'
                                  : delivery[0]['status'] == 'Delivered'
                                      ? 'Delivered'
                                      : delivery[0]['status'] == 'Cancelled'
                                          ? 'Cancelled'
                                          : 'In Transit',
                              style: TextStyle(
                                color: delivery[0]['status'] == 'Pending'
                                    ? colorGray
                                    : delivery[0]['status'] == 'Delivered'
                                        ? Color(0xff3BB54A)
                                        : delivery[0]['status'] == 'Cancelled'
                                            ? colorPrimary
                                            : Color(0xffFCC60C),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );

              // ListTile(
              //   title: Text(delivery['description']),
              //   subtitle: Text('${delivery['status']} - ${delivery['date']}'),
              //   leading: Image.asset(delivery['icon']),
              // )
            },
          );

          // return GestureDetector(
          //   onTap: () {
          //     Navigator.pushNamed(context, details);
          //   },
          //   child: Container(
          //     // height: 100,
          //     margin: const EdgeInsets.only(top: 8),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(10),
          //       color: Color(0xFFFCFCFC),
          //       // border: Border.all(
          //       //   color: const Color(0xFFE1E1E1),
          //       // ),
          //       boxShadow: [
          //         BoxShadow(
          //           color: Color(0xFFFCFCFC).withOpacity(0.5),
          //           spreadRadius: 0,
          //           blurRadius: 1,
          //         ),
          //       ],
          //     ),
          //     child: Padding(
          //       padding: const EdgeInsets.symmetric(
          //         horizontal: 10,
          //         vertical: 10,
          //       ),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Column(
          //             mainAxisAlignment: MainAxisAlignment.spaceAround,
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(
          //                 delivery[0]['title'],
          //                 style: TextStyle(
          //                   color: colorsBlack,
          //                   fontSize: 16.sp,
          //                   fontWeight: FontWeight.w600,
          //                 ),
          //               ),
          //               Align(
          //                 alignment: Alignment.center,
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                   crossAxisAlignment: CrossAxisAlignment.center,
          //                   children: [
          //                     Image.asset(
          //                       delivery[0]['status'] == 'Pending'
          //                           ? 'assets/icons/Processing.png'
          //                           : delivery[0]['status'] == 'Delivered'
          //                               ? 'assets/icons/paid.png'
          //                               : delivery[0]['status'] == 'Cancelled'
          //                                   ? 'assets/icons/Cancelled.png'
          //                                   : 'assets/icons/Processing.png',
          //                       width: 20.w,
          //                       alignment: Alignment.center,
          //                     ),
          //                     SizedBox(
          //                       width: 5.w,
          //                     ),
          //                     Text(
          //                       delivery[0]['status'] == 'Pending'
          //                           ? 'Waiting for Order'
          //                           : delivery[0]['status'] == 'Delivered'
          //                               ? 'Payment on Delivery'
          //                               : delivery[0]['status'] == 'Cancelled'
          //                                   ? 'Order Cancelled'
          //                                   : 'Payment on Delivery',
          //                       textAlign: TextAlign.center,
          //                       style: TextStyle(
          //                         fontSize: 14.sp,
          //                         fontWeight: FontWeight.w400,
          //                       ),
          //                     )
          //                   ],
          //                 ),
          //               ),
          //             ],
          //           ),
          //           Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             crossAxisAlignment: CrossAxisAlignment.end,
          //             children: [
          //               Text(
          //                 delivery[0]['status'] == 'Pending'
          //                     ? 'Waiting for Order'
          //                     : delivery[0]['status'] == 'Delivered'
          //                         ? 'Delivered'
          //                         : delivery[0]['status'] == 'Cancelled'
          //                             ? 'Cancelled'
          //                             : 'In Transit',
          //                 style: TextStyle(
          //                   color: delivery[0]['status'] == 'Pending'
          //                       ? colorGray
          //                       : delivery[0]['status'] == 'Delivered'
          //                           ? Color(0xff3BB54A)
          //                           : delivery[0]['status'] == 'Cancelled'
          //                               ? colorPrimary
          //                               : Color(0xffFCC60C),
          //                   fontSize: 12.sp,
          //                   fontWeight: FontWeight.w400,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // );
        }
      },
    );
    // return Padding(
    //   padding: EdgeInsets.symmetric(
    //     horizontal: 26.w,
    //     vertical: 32.h,
    //   ),
    //   child: deliveries.isEmpty
    //       ? Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             Container(
    //               height: 400.h,
    //               child: Center(
    //                 child: Text(
    //                   "You have no delivery order",
    //                   textAlign: TextAlign.center,
    //                   style: GoogleFonts.nunito(
    //                     color: colorsBlack,
    //                     fontSize: 18.sp,
    //                     fontWeight: FontWeight.w400,
    //                   ),
    //                 ),
    //               ),
    //             )
    //           ],
    //         )
    //       :
    // ListView.builder(
    //           itemCount: deliveries.length,
    //           itemBuilder: (context, index) {
    //             final delivery = deliveries[index];
    //             return GestureDetector(
    //               onTap: () {
    //                 Navigator.pushNamed(context, details);
    //               },
    //               child: Container(
    //                 height: 100,
    //                 margin: const EdgeInsets.only(top: 8),
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(10),
    //                   color: Color(0xFFFCFCFC),
    //                   // border: Border.all(
    //                   //   color: const Color(0xFFE1E1E1),
    //                   // ),
    //                   boxShadow: [
    //                     BoxShadow(
    //                       color: Color(0xFFFCFCFC).withOpacity(0.5),
    //                       spreadRadius: 0,
    //                       blurRadius: 1,
    //                     ),
    //                   ],
    //                 ),
    //                 child: Padding(
    //                   padding: const EdgeInsets.symmetric(
    //                     horizontal: 10,
    //                     vertical: 10,
    //                   ),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       Column(
    //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           Text(
    //                             delivery['description'],
    //                             style: TextStyle(
    //                               color: colorsBlack,
    //                               fontSize: 16.sp,
    //                               fontWeight: FontWeight.w600,
    //                             ),
    //                           ),
    //                           Align(
    //                             alignment: Alignment.center,
    //                             child: Row(
    //                               mainAxisAlignment:
    //                                   MainAxisAlignment.spaceAround,
    //                               crossAxisAlignment: CrossAxisAlignment.center,
    //                               children: [
    //                                 Image.asset(
    //                                   delivery['status'] == 'Pending'
    //                                       ? 'assets/icons/Processing.png'
    //                                       : delivery['status'] == 'Delivered'
    //                                           ? 'assets/icons/paid.png'
    //                                           : delivery['status'] ==
    //                                                   'Cancelled'
    //                                               ? 'assets/icons/Cancelled.png'
    //                                               : 'assets/icons/Processing.png',
    //                                   width: 20.w,
    //                                   alignment: Alignment.center,
    //                                 ),
    //                                 SizedBox(
    //                                   width: 5.w,
    //                                 ),
    //                                 Text(
    //                                   delivery['status'] == 'Pending'
    //                                       ? 'Waiting for Order'
    //                                       : delivery['status'] == 'Delivered'
    //                                           ? 'Payment on Delivery'
    //                                           : delivery['status'] ==
    //                                                   'Cancelled'
    //                                               ? 'Order Cancelled'
    //                                               : 'Payment on Delivery',
    //                                   textAlign: TextAlign.center,
    //                                   style: TextStyle(
    //                                     fontSize: 14.sp,
    //                                     fontWeight: FontWeight.w400,
    //                                   ),
    //                                 )
    //                               ],
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       Column(
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         crossAxisAlignment: CrossAxisAlignment.end,
    //                         children: [
    //                           Text(
    //                             delivery['status'] == 'Pending'
    //                                 ? 'Waiting for Order'
    //                                 : delivery['status'] == 'Delivered'
    //                                     ? 'Delivered'
    //                                     : delivery['status'] == 'Cancelled'
    //                                         ? 'Cancelled'
    //                                         : 'In Transit',
    //                             style: TextStyle(
    //                               color: delivery['status'] == 'Pending'
    //                                   ? colorGray
    //                                   : delivery['status'] == 'Delivered'
    //                                       ? Color(0xff3BB54A)
    //                                       : delivery['status'] == 'Cancelled'
    //                                           ? colorPrimary
    //                                           : Color(0xffFCC60C),
    //                               fontSize: 12.sp,
    //                               fontWeight: FontWeight.w400,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             );

    //             // ListTile(
    //             //   title: Text(delivery['description']),
    //             //   subtitle: Text('${delivery['status']} - ${delivery['date']}'),
    //             //   leading: Image.asset(delivery['icon']),
    //             // )
    //           },
    //         ),
    // );
  }
}
