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
      "status": "In Transit",
      "description": "Bill Payment 1",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "debit",
      "description": "Bill Payment 1",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "debit",
      "description": "Bill Payment 1",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "debit",
      "description": "Bill Payment 1",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "debit",
      "description": "Bill Payment 1",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "debit",
      "description": "Bill Payment 1",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "debit",
      "description": "Bill Payment 1",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "debit",
      "description": "Bill Payment 1",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "debit",
      "description": "Bill Payment 1",
      "date": "June 20"
    },
    {
      "icon": "assets/icons/truck.png",
      "status": "debit",
      "description": "Bill Payment 1",
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
              'assets/images/logo.png',
              width: 70.w,
            ),
          ],
        ),
        centerTitle: true,
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
                        Text('Current Location')
                            .normalSized(14.sp)
                            .colors(textGray),
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
                                            "No Transaction history.",
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
                                    height: 450.h,
                                    child: ListView.builder(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 0,
                                        ),
                                        itemCount: deliveries.length,
                                        itemBuilder: (context, index) {
                                          return Card(
                                            margin: EdgeInsets.symmetric(
                                              horizontal: 0,
                                            ),
                                            elevation: 0.0,
                                            child: ListTile(
                                              leading: CircleAvatar(
                                                // radius:40,
                                                backgroundColor: colorGray,
                                                child: Image.asset(
                                                  'assets/icons/truck.png',
                                                  width: 16.w,
                                                ),
                                              ),
                                              title: Text(
                                                // ' Purchase : ${transaction.provider}',
                                                'R763489247523',
                                              )
                                                  .normalSized(14.sp)
                                                  .colors(colorsBlack),
                                              trailing: CircleAvatar(
                                                radius: 12.w,
                                                backgroundColor: colorGray,
                                                child: Image.asset(
                                                  'assets/icons/info.png',
                                                  width: 12.w,
                                                ),
                                              ),
                                              subtitle: Row(
                                                children: [
                                                  Text(
                                                    // 'Recipient : ${deliveries.type}',
                                                    'In Transit , ',
                                                  )
                                                      .normalSized(12.sp)
                                                      .colors(textGray),
                                                  // SizedBox(
                                                  //   width: 10.w,
                                                  // ),
                                                  Text(
                                                    'June 20',
                                                  )
                                                      .normalSized(12.sp)
                                                      .colors(textGray),
                                                ],
                                              ),
                                              onTap: () {
                                                // toggleTextVisibility();
                                              },
                                            ),
                                          );
                                        }),
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
