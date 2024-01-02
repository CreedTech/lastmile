import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lastmile/src/presentation/search/view/search_view.dart';

import 'package:lastmile/src/core/core.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List deliveries = [
    {
      "icon": "assets/icons/truck.png",
      "status": "Delivered",
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
      "status": "Pending",
      "description": "Macbook Pro 2022",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "Delivered",
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
                              Text('Abuja, NIGERIA'),
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
                            deliveries.isEmpty
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                  )
                                : Container(
                                    height: 470.h,
                                    child: ListView.builder(
                                      itemCount: deliveries.length,
                                      itemBuilder: (context, index) {
                                        final delivery = deliveries[index];
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, details);
                                          },
                                          child: Container(
                                            height: 100,
                                            margin:
                                                const EdgeInsets.only(top: 8),
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
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                                                        delivery['description'],
                                                        style: TextStyle(
                                                          color: colorsBlack,
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Image.asset(
                                                              delivery['status'] ==
                                                                      'Pending'
                                                                  ? 'assets/icons/Processing.png'
                                                                  : delivery['status'] ==
                                                                          'Delivered'
                                                                      ? 'assets/icons/paid.png'
                                                                      : delivery['status'] ==
                                                                              'Cancelled'
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
                                                              delivery['status'] ==
                                                                      'Pending'
                                                                  ? 'Waiting for Order'
                                                                  : delivery['status'] ==
                                                                          'Delivered'
                                                                      ? 'Payment on Delivery'
                                                                      : delivery['status'] ==
                                                                              'Cancelled'
                                                                          ? 'Order Cancelled'
                                                                          : 'Payment on Delivery',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                fontSize: 14.sp,
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
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        delivery['status'] ==
                                                                'Pending'
                                                            ? 'Waiting for Order'
                                                            : delivery['status'] ==
                                                                    'Delivered'
                                                                ? 'Delivered'
                                                                : delivery['status'] ==
                                                                        'Cancelled'
                                                                    ? 'Cancelled'
                                                                    : 'In Transit',
                                                        style: TextStyle(
                                                          color: delivery['status'] ==
                                                                  'Pending'
                                                              ? colorGray
                                                              : delivery['status'] ==
                                                                      'Delivered'
                                                                  ? Color(
                                                                      0xff3BB54A)
                                                                  : delivery['status'] ==
                                                                          'Cancelled'
                                                                      ? colorPrimary
                                                                      : Color(
                                                                          0xffFCC60C),
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
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
                                  ),
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
