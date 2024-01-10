import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:lastmile/src/core/core.dart';
import 'package:lastmile/src/data/api/api_client.dart';
import 'package:lastmile/src/data/datasource/auth/controller/terminal_controller.dart';
import 'package:lastmile/src/data/models/terminal_model.dart';
import 'package:lastmile/src/data/repository/terminal_repo.dart';
// import 'package:lastmile/src/data/datasource/auth/controller/terminal_controller.dart';
import 'package:lastmile/src/presentation/order/view/order_view.dart';

import '../../../data/api/global_services.dart';

class PickupTerminalView extends StatefulWidget {
  const PickupTerminalView({super.key});

  @override
  State<PickupTerminalView> createState() => _PickupTerminalViewState();
}

class _PickupTerminalViewState extends State<PickupTerminalView> {
  List _terminals = [];
  // late final _terminals = GlobalService.sharedPreferencesManager
  //     .getTerminals()
  //     .map((value) => Terminal.fromJson(jsonDecode(value)))
  //     .toList();
  // final TerminalController terminalController = Get.put(TerminalController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _fetchLeaderboardUsers();
    // _getTerminalsFromPrefs();
    fetchData();
  }

  // Future<void> _getTerminalsFromPrefs() async {
  //   try {
  //     // final prefs = SharedPreferencesManager();
  //     final _terminalsHere = await GlobalService.sharedPreferencesManager.getTerminals();
  //     print('====================');
  //     print('_terminals');
  //     print(_terminalsHere);

  //     if (_terminalsHere.isNotEmpty) {
  //       // final userName = _terminals[0]['name'] ?? '';
  //       // print('userName: $userName');

  //       setState(() {
  //         this._terminals = _terminalsHere; // Update the user name
  //       });
  //     } else {
  //       print('Invalid user details format');
  //     }
  //   } catch (e) {
  //     print('Error fetching user details from SharedPreferences: $e');
  //   }
  // }

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
          future: fetchData(),
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
                                    snapshot.data!['data'].length,
                                    (index) {
                                      final terminal = snapshot.data!['data'];
                                      print(terminal);
                                      return PickupTerminalWidget(
                                        name: snapshot.data!['data']['name'],
                                        address:
                                            '${snapshot.data!['data']['address']} ${snapshot.data!['data']['state']}',
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OrderView(
                                      pickup_address:
                                          'No 17 Alhaji Usman complex opp Unity bank, Akpangbo, garaki Abuja',
                                      delivery_address: '',
                                    ),
                                  ),
                                );
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
            // return SafeArea(
            //   child: Padding(
            //     padding: EdgeInsets.only(top: 10.h),
            //     child: Center(
            //       child: Column(
            //         children: [
            //           (_terminals.isEmpty)
            //               ? Column(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   crossAxisAlignment: CrossAxisAlignment.center,
            //                   children: [
            //                     // Image.asset(
            //                     //   'assets/images/logo.png',
            //                     //   height: 200.h,
            //                     // ),
            //                     Container(
            //                       height: 400.h,
            //                       child: Center(
            //                         child: Text(
            //                           "You have no pickup terminal",
            //                           textAlign: TextAlign.center,
            //                           style: GoogleFonts.nunito(
            //                             color: colorsBlack,
            //                             fontSize: 18.sp,
            //                             fontWeight: FontWeight.w700,
            //                           ),
            //                         ),
            //                       ),
            //                     )
            //                   ],
            //                 )
            //               : Column(
            //                   children: [
            //                     Expanded(
            //                       child: SingleChildScrollView(
            //                         child: ListView.builder(
            //                             itemCount: _terminals.length,
            //                             itemBuilder: (context, index) {
            //                               final terminal = _terminals[index];
            //                               return Column(
            //                                 children: [
            //                                   PickupTerminalWidget(
            //                                     name: terminal.name,
            //                                     address:
            //                                         '${terminal.address} ${terminal.state}',
            //                                   ),
            //                                   // PickupTerminalWidget(
            //                                   //   name: 'Terminal 1',
            //                                   //   address:
            //                                   //       'No 17 Alhaji Usman complex opp Unity bank, Akpangbo, garaki Abuja',
            //                                   // ),
            //                                   // PickupTerminalWidget(
            //                                   //   name: 'Terminal 1',
            //                                   //   address:
            //                                   //       'No 17 Alhaji Usman complex opp Unity bank, Akpangbo, garaki Abuja',
            //                                   // ),
            //                                   // PickupTerminalWidget(
            //                                   //   name: 'Terminal 1',
            //                                   //   address:
            //                                   //       'No 17 Alhaji Usman complex opp Unity bank, Akpangbo, garaki Abuja',
            //                                   // ),
            //                                   // PickupTerminalWidget(
            //                                   //   name: 'Terminal 1',
            //                                   //   address:
            //                                   //       'No 17 Alhaji Usman complex opp Unity bank, Akpangbo, garaki Abuja',
            //                                   // ),
            //                                 ],
            //                               );
            //                             }),
            //                       ),
            //                     ),
            //                     GestureDetector(
            //                       onTap: () {
            //                         Navigator.push(
            //                           context,
            //                           MaterialPageRoute(
            //                             builder: (context) => OrderView(
            //                               pickup_address:
            //                                   'No 17 Alhaji Usman complex opp Unity bank, Akpangbo, garaki Abuja',
            //                               delivery_address: '',
            //                             ),
            //                           ),
            //                         );
            //                       },
            //                       child: Padding(
            //                         padding: EdgeInsets.only(
            //                           top: 16.0,
            //                           bottom: 80.h,
            //                           right: 20.w,
            //                           left: 20.w,
            //                         ),
            //                         child: Container(
            //                           width: MediaQuery.of(context).size.width,
            //                           padding:
            //                               EdgeInsets.symmetric(vertical: 15.h),
            //                           alignment: Alignment.center,
            //                           decoration: BoxDecoration(
            //                             color: colorPrimary,
            //                             borderRadius: BorderRadius.all(
            //                                 Radius.circular(88.sp)),
            //                           ),
            //                           child: Text(
            //                             'Select Terminal',
            //                             style: TextStyle(
            //                                 fontSize: 14.sp,
            //                                 color: Colors.white),
            //                           ),
            //                         ),
            //                       ),
            //                     )
            //                   ],
            //                 ),
            //           // Obx(() {
            //           //   if (_terminals.isEmpty) {
            //           //     return Column(
            //           //       mainAxisAlignment: MainAxisAlignment.center,
            //           //       crossAxisAlignment: CrossAxisAlignment.center,
            //           //       children: [
            //           //         // Image.asset(
            //           //         //   'assets/images/logo.png',
            //           //         //   height: 200.h,
            //           //         // ),
            //           //         Container(
            //           //           height: 400.h,
            //           //           child: Center(
            //           //             child: Text(
            //           //               "You have no delivery order",
            //           //               textAlign: TextAlign.center,
            //           //               style: GoogleFonts.nunito(
            //           //                 color: colorsBlack,
            //           //                 fontSize: 18.sp,
            //           //                 fontWeight: FontWeight.w700,
            //           //               ),
            //           //             ),
            //           //           ),
            //           //         )
            //           //       ],
            //           //     );
            //           //   } else {
            //           //     return Column(
            //           //       children: [
            //           //         Expanded(
            //           //           child: SingleChildScrollView(
            //           //             child: ListView.builder(
            //           //                 itemCount: _terminals.length,
            //           //                 itemBuilder: (context, index) {
            //           //                   final terminal = _terminals[index];
            //           //                   return Column(
            //           //                     children: [
            //           //                       PickupTerminalWidget(
            //           //                         name: terminal.name,
            //           //                         address:
            //           //                             '${terminal.address} ${terminal.state}',
            //           //                       ),
            //           //                       // PickupTerminalWidget(
            //           //                       //   name: 'Terminal 1',
            //           //                       //   address:
            //           //                       //       'No 17 Alhaji Usman complex opp Unity bank, Akpangbo, garaki Abuja',
            //           //                       // ),
            //           //                       // PickupTerminalWidget(
            //           //                       //   name: 'Terminal 1',
            //           //                       //   address:
            //           //                       //       'No 17 Alhaji Usman complex opp Unity bank, Akpangbo, garaki Abuja',
            //           //                       // ),
            //           //                       // PickupTerminalWidget(
            //           //                       //   name: 'Terminal 1',
            //           //                       //   address:
            //           //                       //       'No 17 Alhaji Usman complex opp Unity bank, Akpangbo, garaki Abuja',
            //           //                       // ),
            //           //                       // PickupTerminalWidget(
            //           //                       //   name: 'Terminal 1',
            //           //                       //   address:
            //           //                       //       'No 17 Alhaji Usman complex opp Unity bank, Akpangbo, garaki Abuja',
            //           //                       // ),
            //           //                     ],
            //           //                   );
            //           //                 }),
            //           //           ),
            //           //         ),
            //           //         GestureDetector(
            //           //           onTap: () {
            //           //             Navigator.push(
            //           //               context,
            //           //               MaterialPageRoute(
            //           //                 builder: (context) => OrderView(
            //           //                   pickup_address:
            //           //                       'No 17 Alhaji Usman complex opp Unity bank, Akpangbo, garaki Abuja',
            //           //                   delivery_address: '',
            //           //                 ),
            //           //               ),
            //           //             );
            //           //           },
            //           //           child: Padding(
            //           //             padding: EdgeInsets.only(
            //           //               top: 16.0,
            //           //               bottom: 80.h,
            //           //               right: 20.w,
            //           //               left: 20.w,
            //           //             ),
            //           //             child: Container(
            //           //               width: MediaQuery.of(context).size.width,
            //           //               padding: EdgeInsets.symmetric(vertical: 15.h),
            //           //               alignment: Alignment.center,
            //           //               decoration: BoxDecoration(
            //           //                 color: colorPrimary,
            //           //                 borderRadius:
            //           //                     BorderRadius.all(Radius.circular(88.sp)),
            //           //               ),
            //           //               child: Text(
            //           //                 'Select Terminal',
            //           //                 style: TextStyle(
            //           //                     fontSize: 14.sp, color: Colors.white),
            //           //               ),
            //           //             ),
            //           //           ),
            //           //         )
            //           //       ],
            //           //     );
            //           //   }
            //           // }),
            //         ],
            //       ),
            //     ),
            //   ),
            // );
          }),
    );
  }

  void _fetchLeaderboardUsers() async {
    // while (true) {
    //  if (mounted) {
    //       setState(() {
    //         _leaderboardUsers
    //           ..clear()
    //           ..addAll(
    //             (response.data as List)
    //                 .map((value) => LeaderboardUser.fromJson(value)),
    //           );
    //       });
    //     }

    //     storage.setStringList(
    //       leaderboardUsersKey,
    //       [..._leaderboardUsers.map(jsonEncode)],
    //     );

    try {
      // isLoading = true;
      // state = const AsyncLoading();
      // EasyLoading.show(
      //   indicator: CustomLoader(),
      //   maskType: EasyLoadingMaskType.clear,
      //   dismissOnTap: true,
      // );
      // EasyLoading.show(
      //   indicator: CustomLoader(),
      //   maskType: EasyLoadingMaskType.black,
      //   dismissOnTap: false,
      // );
      var response = await AppRepository.getTerminals();
      // state = const AsyncData(false);
      // EasyLoading.dismiss();
      if (response.success) {
        print('response here');
        print(response.message);
        // EasyLoading.dismiss();
        // isLoading = false;
        // notifyListeners();
        // state = AsyncValue.data(true);
        // return;
        if (mounted) {
          setState(() {
            _terminals
              ..clear()
              ..addAll(
                (response.message as List)
                    .map((value) => Terminal.fromJson(value)),
              );
          });
        }

        await GlobalService.sharedPreferencesManager.saveTerminals(
          [..._terminals.map(jsonEncode)],
        );
      } else
        print('error here');
      print(response.message.toString());

      // check for different reasons to enhance users experience
      // if (response.success == false &&
      //     response.message.contains("invalid signature")) {
      //   message = "Terminals info could not be retrieved , Try again later.";
      //   showTopSnackBar(
      //     Overlay.of(context),
      //     CustomSnackBar.error(
      //       message: message,
      //     ),
      //   );
      //   return;
      // } else {
      //   // to capture other errors later
      //   message = "Something went wrong";
      //   showTopSnackBar(
      //     Overlay.of(context),
      //     CustomSnackBar.error(
      //       message: message,
      //     ),
      //   );

      //   return;
      // }
    } catch (e) {
      print(e);
      // EasyLoading.dismiss();
      // state = AsyncError(e, StackTrace.current);
      // message = "Ooops something went wrong";
      // showTopSnackBar(
      //   Overlay.of(context),
      //   CustomSnackBar.error(
      //     message: message,
      //   ),
      // );

      // return;
    } finally {
      // isLoading = false;
      // EasyLoading.dismiss();
      // return;
    }

    // await 8.seconds.delay;
    // }
  }
}

class PickupTerminalWidget extends StatefulWidget {
  const PickupTerminalWidget({
    super.key,
    required this.name,
    required this.address,
  });
  final String name;
  final String address;

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
                  value: widget.name,
                  groupValue: selectedValue,
                  onChanged: (val) {
                    setState(() {
                      selectedValue = val.toString();
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
