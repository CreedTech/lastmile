import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_cupertino_navigation_bar/super_cupertino_navigation_bar.dart';

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
                    padding:
                        EdgeInsets.symmetric( horizontal: 15.w),
                    child: Column(
                      children: [
                        Text('Current Location')
                            .normalSized(14.sp)
                            .colors(textGray),
                        Row(
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
                        SizedBox(
                          height: 32.h,
                        ),
                        Text('Track your package').mediumSized(20.sp),
                        Text(
                          'Please enter your package tracking number gotten from your checkout receipt',
                          textAlign: TextAlign.center,
                        ).normalSized(14.sp),
                        SizedBox(
                          height: 40.h,
                        ),
                        // Row(
                        //   children: [
                        //     Text('Recent delivery', textAlign: TextAlign.left),
                        //   ],
                        // ),
                        TextFormField(),
                        // CupertinoPageScaffold(
                        //   //inside CupertinoPageScaffold
                        //   child: SuperCupertinoNavigationBar(
                        //     // largeTitleType: AppBarType.LargeTitleWithFloatedSearch, // Set desired AppBarType
                        //     avatarModel: AvatarModel(
                        //       avatarUrl: null,
                        //       avatarIsVisible:
                        //           true, // Avatar is hidden as default, if you want to set visible, simply set true
                        //       onTap: () => print("some event"),
                        //     ),
                        //     largeTitle: const Text('Home'),
                        //     searchFieldDecoration: SearchFieldDecoration(
                        //       hideSearchBarOnInit: true,
                        //       searchFieldBehaviour: SearchFieldBehaviour
                        //           .ShowResultScreenAfterFieldInput, // There are 3 SearchFieldBehaviour
                        //     ),
                        //     slivers: [
                        //       // Any Sliver here
                        //     ],
                        //   ),
                        // ),
                         SizedBox(
                          height: 40.h,
                        ),
                        SingleChildScrollView(
                          child: Column(children: [
                            Row(
                              children: [
                                Text('Recent delivery',
                                    textAlign: TextAlign.left),
                              ],
                            ),
                            // Spacer(),
                            deliveries.isEmpty
                                ? Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/logo.png',
                                        height: 200.h,
                                      ),
                                      Text(
                                        "No Transaction history.",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.nunito(
                                          color: colorPrimary,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w700,
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
                                                'Receive from Dorcas',
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
