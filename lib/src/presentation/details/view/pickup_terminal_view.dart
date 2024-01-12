import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:lastmile/src/core/core.dart';
// import 'package:lastmile/src/data/models/terminal_model.dart';
// import 'package:lastmile/src/data/repository/terminal_repo.dart';
// import 'package:lastmile/src/data/datasource/auth/controller/terminal_controller.dart';
// import 'package:lastmile/src/presentation/order/view/order_view.dart';

import '../../../data/api/global_services.dart';

class PickupTerminalView extends StatefulWidget {
  const PickupTerminalView({super.key, required this.deliveryAddress});
  final String deliveryAddress;

  @override
  State<PickupTerminalView> createState() => _PickupTerminalViewState();
}

class _PickupTerminalViewState extends State<PickupTerminalView> {
  // List _terminals = [];
  String _terminal_address = '';
  String _terminal_state = '';
  late Future<Map<String, dynamic>> _fetchDataFuture;
  String selectedVal = '';

  @override
  void initState() {
    super.initState();
    initializeData();

    _fetchDataFuture = fetchData();
  }

  Future<void> initializeData() async {
    final terminalValue =
        await GlobalService.sharedPreferencesManager.getFromSharedPreferences();
    // String address;
    // String address = terminalValue['address'];
    setState(() {
      _terminal_address = terminalValue['address'];
      _terminal_state = terminalValue['state'];
      print('_terminal');
      print(_terminal_address);
      print(_terminal_state);
    });
  }

  Future<Map<String, dynamic>> fetchData() async {
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
        backgroundColor: colorWhite,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: colorsBlack,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Pickup Terminals',
        ),
        titleTextStyle: TextStyle(
          color: colorsBlack,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
          future: _fetchDataFuture,
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
                              "You have no pickup terminal",
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
                  print(snapshot.data!.length);
                  // Display your fetched data here
                  return SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Center(
                        child: Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: List.generate(
                                    1,
                                    (index) {
                                      final terminal = snapshot.data!['data'];
                                      print(terminal);
                                      return PickupTerminalWidget(
                                        name: snapshot.data!['data']['name'],
                                        address:
                                            '${snapshot.data!['data']['address']} ${snapshot.data!['data']['state']}',
                                        isSelected:
                                            selectedVal == terminal['name'],
                                        onSelected: (val) {
                                          setState(() {
                                            selectedVal = terminal['name'];
                                          });
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (selectedVal != '') {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => OrderView(
                                  //       pickup_address: selectedVal,
                                  //       delivery_address:
                                  //           widget.deliveryAddress,
                                  //     ),
                                  //   ),
                                  // );
                                }
                                print('selectedVal');
                                print(selectedVal);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 16.0,
                                    bottom: 80.h,
                                    right: 20.w,
                                    left: 20.w),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(vertical: 15.h),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: colorPrimary,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(88.sp)),
                                  ),
                                  child: Text(
                                    'Select Terminal',
                                    style: TextStyle(
                                        fontSize: 14.sp, color: Colors.white),
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
          }),
    );
  }
}

class PickupTerminalWidget extends StatefulWidget {
  PickupTerminalWidget({
    super.key,
    required this.name,
    required this.address,
    required this.isSelected,
    required this.onSelected,
  });

  final String name;
  final String address;
  final bool isSelected;
  final Function(bool) onSelected;

  @override
  State<PickupTerminalWidget> createState() => _PickupTerminalWidgetState();
}

class _PickupTerminalWidgetState extends State<PickupTerminalWidget> {
  String selectedValue = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 345.w,
        height: 100.h,
        decoration: BoxDecoration(
          // color: colorGray,
          color: Color(0xffFCFCFC),
          borderRadius: BorderRadius.circular(
            8.sp,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 14.w,
                height: 14.h,
                child: Radio.adaptive(
                  // value: isSelected,
                  // groupValue: true,
                  // onChanged: (bool? val) {
                  //   if (val != null && val) {
                  //     onSelected();
                  //   }
                  // },
                  value: widget.name,
                  groupValue: widget.isSelected ? widget.name : null,
                  onChanged: (val) {
                    setState(() {
                      widget.onSelected(!widget.isSelected);
                    });
                  },
                  overlayColor: MaterialStateColor.resolveWith(
                    (states) => colorLightGray,
                  ),
                  fillColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return colorPrimary;
                    }
                    return colorLightGray;
                  }),
                  focusColor: MaterialStateColor.resolveWith(
                    (states) => colorPrimary,
                  ),
                  splashRadius: 15,
                  useCupertinoCheckmarkStyle: true,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: colorsBlack,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    softWrap: true,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8.h),
                    width: 300.w,
                    child: Text(
                      widget.address,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: colorGray,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
