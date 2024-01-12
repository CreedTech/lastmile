import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lastmile/src/presentation/details/view/details_view.dart';
import 'package:lastmile/src/presentation/search/view/search_view.dart';
import 'package:http/http.dart' as http;
import 'package:lastmile/src/core/core.dart';

import '../../../data/api/global_services.dart';
import '../../../data/datasource/auth/controller/order_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final OrderController orderController = Get.put(OrderController());
  String _terminal_address = '';
  String _terminal_state = '';
  // List deliveries = [
  //   {
  //     "icon": "assets/icons/truck.png",
  //     "status": "Delivered",
  //     "description": "Macbook Pro 2022",
  //     "date": "June 20"
  //   },
  //   {
  //     "icon": "assets/icons/truck.png",
  //     "status": "Processing",
  //     "description": "Macbook Pro 2022",
  //     "date": "June 20"
  //   },
  //   {
  //     "icon": "assets/icons/truck.png",
  //     "status": "Pending",
  //     "description": "Macbook Pro 2022",
  //     "date": "June 20"
  //   },
  //   {
  //     "icon": "assets/icons/truck.png",
  //     "status": "Delivered",
  //     "description": "Macbook Pro 2022",
  //     "date": "June 20"
  //   },
  //   {
  //     "icon": "assets/icons/truck.png",
  //     "status": "Cancelled",
  //     "description": "Macbook Pro 2022",
  //     "date": "June 20"
  //   },
  //   {
  //     "icon": "assets/icons/truck.png",
  //     "status": "Cancelled",
  //     "description": "Macbook Pro 2022",
  //     "date": "June 20"
  //   },
  //   {
  //     "icon": "assets/icons/truck.png",
  //     "status": "Cancelled",
  //     "description": "Macbook Pro 2022",
  //     "date": "June 20"
  //   },
  //   {
  //     "icon": "assets/icons/truck.png",
  //     "status": "Cancelled",
  //     "description": "Macbook Pro 2022",
  //     "date": "June 20"
  //   },
  //   {
  //     "icon": "assets/icons/truck.png",
  //     "status": "Processing",
  //     "description": "Macbook Pro 2022",
  //     "date": "June 20"
  //   },
  //   {
  //     "icon": "assets/icons/truck.png",
  //     "status": "Processing",
  //     "description": "Macbook Pro 2022",
  //     "date": "June 20"
  //   },
  //   {
  //     "icon": "assets/icons/truck.png",
  //     "status": "Processing",
  //     "description": "Macbook Pro 2022",
  //     "date": "June 20"
  //   },
  //   {
  //     "icon": "assets/icons/truck.png",
  //     "status": "Processing",
  //     "description": "Macbook Pro 2022",
  //     "date": "June 20"
  //   },
  //   {
  //     "icon": "assets/icons/truck.png",
  //     "status": "Processing",
  //     "description": "Macbook Pro 2022",
  //     "date": "June 20"
  //   },
  //   {
  //     "icon": "assets/icons/truck.png",
  //     "status": "Processing",
  //     "description": "Macbook Pro 2022",
  //     "date": "June 20"
  //   },
  //   {
  //     "icon": "assets/icons/truck.png",
  //     "status": "Processing",
  //     "description": "Macbook Pro 2022",
  //     "date": "June 20"
  //   },
  //   {
  //     "icon": "assets/icons/truck.png",
  //     "status": "Processing",
  //     "description": "Macbook Pro 2022",
  //     "date": "June 20"
  //   },
  //   {
  //     "icon": "assets/icons/truck.png",
  //     "status": "Processing",
  //     "description": "Macbook Pro 2022",
  //     "date": "June 20"
  //   },
  //   {
  //     "icon": "assets/icons/truck.png",
  //     "status": "Processing",
  //     "description": "Macbook Pro 2022",
  //     "date": "June 20"
  //   },
  //   {
  //     "icon": "assets/icons/truck.png",
  //     "status": "Processing",
  //     "description": "Macbook Pro 2022",
  //     "date": "June 20"
  //   },
  //   {
  //     "icon": "assets/icons/truck.png",
  //     "status": "Processing",
  //     "description": "Macbook Pro 2022",
  //     "date": "June 20"
  //   },
  //   {
  //     "icon": "assets/icons/truck.png",
  //     "status": "completed",
  //     "description": "Macbook Pro 2022",
  //     "date": "June 20"
  //   },
  //   {
  //     "icon": "assets/icons/truck.png",
  //     "status": "Pending",
  //     "description": "Macbook Pro 2022",
  //     "date": "June 20"
  //   },
  //   {
  //     "icon": "assets/icons/truck.png",
  //     "status": "Pending",
  //     "description": "Macbook Pro 2022",
  //     "date": "June 20"
  //   },
  // ];
  @override
  void initState() {
    //
    super.initState();
    // _fetchLeaderboardUsers();
    // _getTerminalsFromPrefs();
    fetchTerminals();
    fetchData();
  }

  Future<Map<String, dynamic>> fetchTerminals() async {
    String authToken =
        await GlobalService.sharedPreferencesManager.getAuthToken();
    final String apiUrl = AppConstants.BASE_URL;
    // final String authToken = 'your_auth_token';

    try {
      final response = await http.get(
        Uri.parse(apiUrl + AppConstants.GET_TERMINALS),
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
        final String terminalAddress = responseData['data']['address'];
        final String terminalState = responseData['data']['state'];
        final String terminalLng = responseData['data']['lng'];
        final String terminalLat = responseData['data']['lat'];
        setState(() {
          _terminal_address = terminalAddress;
          _terminal_state = terminalState;
          print('_terminal');
          print(_terminal_address);
          print(_terminal_state);
        });

        await GlobalService.sharedPreferencesManager.saveToSharedPreferences(
            terminalAddress, terminalState, terminalLng, terminalLat);
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

  Future<Map<String, dynamic>> fetchData() async {
    String authToken =
        await GlobalService.sharedPreferencesManager.getAuthToken();
    final String apiUrl = AppConstants.BASE_URL;
    // final String authToken = 'your_auth_token';

    try {
      final response = await http.get(
        Uri.parse(apiUrl + AppConstants.RECENT_ORDER),
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
      appBar: AppBar(
        // titleSpacing: 20,
        elevation: 0,
        title: Column(
          children: [
            Image.asset(
              'assets/images/logo_single.png',
              width: 70.w,
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: colorWhite,
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(notifications);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Guide.isDark(context) ? colorsBlack : colorWhite,
              elevation: 0,
            ),
            child: Icon(Icons.notifications_none_outlined,
                weight: 24.h,
                color: Guide.isDark(context) ? darkThemeText : colorsBlack),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      children: [
                        Text('Select Terminal')
                            .normalSized(14.sp)
                            .colors(colorGray),
                        SizedBox(
                          height: 8.h,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/pointer.png',
                                width: 16.w,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                  '${_terminal_address}${' , '} ${_terminal_state}'),
                              SizedBox(
                                width: 3.w,
                              ),
                              Image.asset(
                                'assets/icons/dropdown.png',
                                width: 16.w,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 20.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.sp),
                            ),
                            color: colorPrimary,
                          ),
                          child: Column(
                            children: [
                              Text('Track your package')
                                  .mediumSized(20.sp)
                                  .colors(colorWhite),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                'Please enter your package tracking number gotten from your checkout receipt',
                                textAlign: TextAlign.center,
                              ).normalSized(14.sp).colors(colorWhite),
                              SizedBox(
                                height: 40.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SearchView()),
                                  );
                                },
                                child: TextFormField(
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
                                    hintText:
                                        'Enter your package tracking number',
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
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SearchView()),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(children: [
                            Row(
                              children: [
                                Text(
                                  'Recent delivery',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            // Spacer(),
                            FutureBuilder<Map<String, dynamic>>(
                              future: fetchData(),
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

                                      return Column(
                                        children: List.generate(
                                          snapshot.data!['data'].length,
                                          (index) {
                                            // final delivery =
                                            //     orderController.order[index];
                                            return GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        DetailsView(
                                                      id: snapshot.data!['data']
                                                          [0]['id'],
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                height: 100,
                                                margin: const EdgeInsets.only(
                                                    top: 8),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Color(0xFFFCFCFC),
                                                  // border: Border.all(
                                                  //   color: const Color(0xFFE1E1E1),
                                                  // ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color(0xFFFCFCFC)
                                                          .withOpacity(0.5),
                                                      spreadRadius: 0,
                                                      blurRadius: 1,
                                                    ),
                                                  ],
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 10,
                                                    vertical: 10,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            snapshot.data![
                                                                    'data'][0]
                                                                ['title'],
                                                            style: TextStyle(
                                                              color:
                                                                  colorsBlack,
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Image.asset(
                                                                  snapshot.data!['data'][0]
                                                                              [
                                                                              'status'] ==
                                                                          'Pending'
                                                                      ? 'assets/icons/Processing.png'
                                                                      : snapshot.data!['data'][0]['status'] ==
                                                                              'Delivered'
                                                                          ? 'assets/icons/paid.png'
                                                                          : snapshot.data!['data'][0]['status'] == 'Cancelled'
                                                                              ? 'assets/icons/Cancelled.png'
                                                                              : 'assets/icons/Processing.png',
                                                                  width: 20.w,
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                ),
                                                                SizedBox(
                                                                  width: 5.w,
                                                                ),
                                                                Text(
                                                                  snapshot.data!['data'][0]
                                                                              [
                                                                              'status'] ==
                                                                          'Pending'
                                                                      ? 'Waiting for Order'
                                                                      : snapshot.data!['data'][0]['status'] ==
                                                                              'Delivered'
                                                                          ? 'Payment on Delivery'
                                                                          : snapshot.data!['data'][0]['status'] == 'Cancelled'
                                                                              ? 'Order Cancelled'
                                                                              : 'Payment on Delivery',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        14.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            snapshot.data!['data']
                                                                            [0][
                                                                        'status'] ==
                                                                    'Pending'
                                                                ? 'Waiting for Order'
                                                                : snapshot.data!['data'][0]
                                                                            [
                                                                            'status'] ==
                                                                        'Delivered'
                                                                    ? 'Delivered'
                                                                    : snapshot.data!['data'][0]['status'] ==
                                                                            'Cancelled'
                                                                        ? 'Cancelled'
                                                                        : 'In Transit',
                                                            style: TextStyle(
                                                              color: snapshot.data!['data']
                                                                              [0]
                                                                          [
                                                                          'status'] ==
                                                                      'Pending'
                                                                  ? colorGray
                                                                  : snapshot.data!['data'][0]
                                                                              [
                                                                              'status'] ==
                                                                          'Delivered'
                                                                      ? Color(
                                                                          0xff3BB54A)
                                                                      : snapshot.data!['data'][0]['status'] ==
                                                                              'Cancelled'
                                                                          ? colorPrimary
                                                                          : Color(
                                                                              0xffFCC60C),
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
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
                                        ),
                                      );
                                    }
                                }
                              },
                            ),
                            // Obx(() {
                            //   if (orderController.order.isEmpty) {
                            //     return Column(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       children: [
                            //         // Image.asset(
                            //         //   'assets/images/logo.png',
                            //         //   height: 200.h,
                            //         // ),
                            //         Container(
                            //           height: 400.h,
                            //           child: Center(
                            //             child: Text(
                            //               "You have no delivery order",
                            //               textAlign: TextAlign.center,
                            //               style: GoogleFonts.nunito(
                            //                 color: colorsBlack,
                            //                 fontSize: 18.sp,
                            //                 fontWeight: FontWeight.w700,
                            //               ),
                            //             ),
                            //           ),
                            //         )
                            //       ],
                            //     );
                            //   } else {
                            //     return Container(
                            //       height: 470.h,
                            //       child: ListView.builder(
                            //         itemCount: orderController.order.length,
                            //         itemBuilder: (context, index) {
                            //           final delivery =
                            //               orderController.order[index];
                            //           return GestureDetector(
                            //             onTap: () {
                            //               Navigator.pushNamed(context, details);
                            //             },
                            //             child: Container(
                            //               height: 100,
                            //               margin: const EdgeInsets.only(top: 8),
                            //               decoration: BoxDecoration(
                            //                 borderRadius:
                            //                     BorderRadius.circular(10),
                            //                 color: Color(0xFFFCFCFC),
                            //                 // border: Border.all(
                            //                 //   color: const Color(0xFFE1E1E1),
                            //                 // ),
                            //                 boxShadow: [
                            //                   BoxShadow(
                            //                     color: Color(0xFFFCFCFC)
                            //                         .withOpacity(0.5),
                            //                     spreadRadius: 0,
                            //                     blurRadius: 1,
                            //                   ),
                            //                 ],
                            //               ),
                            //               child: Padding(
                            //                 padding: const EdgeInsets.symmetric(
                            //                   horizontal: 10,
                            //                   vertical: 10,
                            //                 ),
                            //                 child: Row(
                            //                   mainAxisAlignment:
                            //                       MainAxisAlignment
                            //                           .spaceBetween,
                            //                   children: [
                            //                     Column(
                            //                       mainAxisAlignment:
                            //                           MainAxisAlignment
                            //                               .spaceAround,
                            //                       crossAxisAlignment:
                            //                           CrossAxisAlignment.start,
                            //                       children: [
                            //                         Text(
                            //                           delivery.title,
                            //                           style: TextStyle(
                            //                             color: colorsBlack,
                            //                             fontSize: 16.sp,
                            //                             fontWeight:
                            //                                 FontWeight.w600,
                            //                           ),
                            //                         ),
                            //                         Align(
                            //                           alignment:
                            //                               Alignment.center,
                            //                           child: Row(
                            //                             mainAxisAlignment:
                            //                                 MainAxisAlignment
                            //                                     .spaceAround,
                            //                             crossAxisAlignment:
                            //                                 CrossAxisAlignment
                            //                                     .center,
                            //                             children: [
                            //                               // Image.asset(
                            //                               //   delivery['status'] ==
                            //                               //           'Pending'
                            //                               //       ? 'assets/icons/Processing.png'
                            //                               //       : delivery['status'] ==
                            //                               //               'Delivered'
                            //                               //           ? 'assets/icons/paid.png'
                            //                               //           : delivery['status'] ==
                            //                               //                   'Cancelled'
                            //                               //               ? 'assets/icons/Cancelled.png'
                            //                               //               : 'assets/icons/Processing.png',
                            //                               //   width: 20.w,
                            //                               //   alignment: Alignment
                            //                               //       .center,
                            //                               // ),
                            //                               SizedBox(
                            //                                 width: 5.w,
                            //                               ),
                            //                               // Text(
                            //                               //   delivery['status'] ==
                            //                               //           'Pending'
                            //                               //       ? 'Waiting for Order'
                            //                               //       : delivery['status'] ==
                            //                               //               'Delivered'
                            //                               //           ? 'Payment on Delivery'
                            //                               //           : delivery['status'] ==
                            //                               //                   'Cancelled'
                            //                               //               ? 'Order Cancelled'
                            //                               //               : 'Payment on Delivery',
                            //                               //   textAlign: TextAlign
                            //                               //       .center,
                            //                               //   style: TextStyle(
                            //                               //     fontSize: 14.sp,
                            //                               //     fontWeight:
                            //                               //         FontWeight
                            //                               //             .w400,
                            //                               //   ),
                            //                               // )
                            //                             ],
                            //                           ),
                            //                         ),
                            //                       ],
                            //                     ),
                            //                     Column(
                            //                       mainAxisAlignment:
                            //                           MainAxisAlignment.center,
                            //                       crossAxisAlignment:
                            //                           CrossAxisAlignment.end,
                            //                       children: [
                            //                         // Text(
                            //                         //   delivery['status'] ==
                            //                         //           'Pending'
                            //                         //       ? 'Waiting for Order'
                            //                         //       : delivery['status'] ==
                            //                         //               'Delivered'
                            //                         //           ? 'Delivered'
                            //                         //           : delivery['status'] ==
                            //                         //                   'Cancelled'
                            //                         //               ? 'Cancelled'
                            //                         //               : 'In Transit',
                            //                         //   style: TextStyle(
                            //                         //     color: delivery[
                            //                         //                 'status'] ==
                            //                         //             'Pending'
                            //                         //         ? colorGray
                            //                         //         : delivery['status'] ==
                            //                         //                 'Delivered'
                            //                         //             ? Color(
                            //                         //                 0xff3BB54A)
                            //                         //             : delivery['status'] ==
                            //                         //                     'Cancelled'
                            //                         //                 ? colorPrimary
                            //                         //                 : Color(
                            //                         //                     0xffFCC60C),
                            //                         //     fontSize: 12.sp,
                            //                         //     fontWeight:
                            //                         //         FontWeight.w400,
                            //                         //   ),
                            //                         // ),
                            //                       ],
                            //                     ),
                            //                   ],
                            //                 ),
                            //               ),
                            //             ),
                            //           );

                            //           // ListTile(
                            //           //   title: Text(delivery['description']),
                            //           //   subtitle: Text('${delivery['status']} - ${delivery['date']}'),
                            //           //   leading: Image.asset(delivery['icon']),
                            //           // )
                            //         },
                            //       ),
                            //     );
                            //   }
                            // })
                          ]),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
