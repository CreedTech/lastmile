import 'package:flutter/material.dart';
// import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../core/core.dart';
import '../../order/view/order_view.dart';
import '../../widgets/custom_text_field.dart';
// import 'package:flutter_google_places_autocomplete/flutter_google_places_autocomplete.dart';
import 'package:geocoding/geocoding.dart';
// import 'package:google_maps_webservice/places.dart';
// import 'package:google_api_headers/google_api_headers.dart';

const kGoogleApiKey = "AIzaSyDVXsNprtu3U1r2gOe2IfubAJ2p0ECmGl4";

class DeliveryAddressView extends StatefulWidget {
  const DeliveryAddressView({super.key, required this.pickupAddress});
  final String pickupAddress;

  @override
  State<DeliveryAddressView> createState() => _DeliveryAddressViewState();
}

class _DeliveryAddressViewState extends State<DeliveryAddressView> {
  final TextEditingController _houseNumberController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _landmarkController = TextEditingController();
  final deliveryFormKey = GlobalKey<FormState>();
  String latitude = '';
  String longitude = '';
  late FocusNode _focusNode;
  bool isLocationValid = false;

  void getLocation() async {
    try {
      List<Location> locations =
          await locationFromAddress(_landmarkController.text);

      if (locations.isNotEmpty) {
        setState(() {
          latitude = locations[0].latitude.toString();
          longitude = locations[0].longitude.toString();
          isLocationValid = true;
        });

        print('Latitude: $latitude');
        print('Longitude: $longitude');
      } else {
        // Show an error message to the user if location not found
        // showErrorMessage('Location not found');
        setState(() {
          isLocationValid = false;
        });
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: 'Location not found. Try nearest landmarks',
          ),
        );
      }
    } catch (e) {
      setState(() {
        isLocationValid = false;
      });
      // Handle other exceptions that might occur during geocoding
      print('Error during geocoding: $e');
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: 'Location not found. Try nearest landmarks',
        ),
      );
      // showErrorMessage('Error during geocoding');
    }
  }

  void showErrorMessage(String message) {
    // Implement how you want to show the error message to the user
    // You can use a SnackBar, AlertDialog, or any other UI component
    // Example using SnackBar:
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        getLocation();
      }
    });
    // getLocation();
    // List<Location> locations = await locationFromAddress("Gronausestraat 710, Enschede");
  }

  @override
  void dispose() {
    _houseNumberController.dispose();
    _streetController.dispose();
    _areaController.dispose();
    _landmarkController.dispose();
    _focusNode.dispose();
    super.dispose();
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
          'Delivery Address',
        ),
        titleTextStyle: TextStyle(
            color: colorsBlack, fontSize: 20.sp, fontWeight: FontWeight.w500),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Receiver information',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Form(
                  key: deliveryFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        prefixIcon: Icon(
                          Icons.house_outlined,
                          color: colorsBlack,
                        ),
                        // labelText: 'Email Address',
                        hintText: '',
                        controller: _houseNumberController,
                        legend: 'House Number',
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Input a valid House Number';
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        prefixIcon: Image.asset(
                          'assets/icons/marker.png',
                          scale: 4,
                        ),
                        // labelText: 'Email Address',
                        hintText: '',
                        controller: _streetController,
                        legend: 'Street',
                        keyboardType: TextInputType.text,

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Input a valid Street';
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        prefixIcon: Icon(
                          Icons.location_on_outlined,
                          color: colorsBlack,
                        ),
                        // labelText: 'Email Address',
                        hintText: '',
                        controller: _areaController,
                        legend: 'Area',

                        // onChanged: (val) {
                        //   print('yo');
                        //   _handlePressButton();
                        // },
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Input a valid Area';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      TextFormField(
                        // readOnly: true, // Set readOnly to true
                        focusNode: _focusNode,
                        controller: _landmarkController,
                        // onTapOutside: (event) {
                        //   getLocation();
                        // },
                        // onEditingComplete: () {
                        //   // Call geocoding function when editing is complete
                        //   getLocation();
                        // },
                        keyboardType: TextInputType.streetAddress,
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
                          hintText: 'Landmark',
                          hintStyle: GoogleFonts.nunito(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal,
                          ),
                          prefixIcon: Image.asset(
                            'assets/icons/landmark.png',
                            scale: 4,
                          ),
                          filled: false,
                          contentPadding: EdgeInsets.all(14.sp),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Input a valid Landmark';
                          }
                          return null;
                        },
                        // onTap: getLocation,
                      ),
                      // CustomTextField(
                      //   prefixIcon: Image.asset(
                      //     'assets/icons/landmark.png',
                      //     scale: 4,
                      //   ),
                      //   // labelText: 'Email Address',
                      //   hintText: '',
                      //   controller: _landmarkController,
                      //   legend: 'Landmark',
                      //   keyboardType: TextInputType.text,
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Input a valid Landmark';
                      //     }
                      //     return null;
                      //   },
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  // if (isLocationValid == true) {
                  getLocation();
                  if (deliveryFormKey.currentState!.validate()) {
                    if (isLocationValid == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderView(
                            lng: longitude,
                            lat: latitude,
                            pickup_address: widget.pickupAddress,
                            house_number: _houseNumberController.text,
                            street: _streetController.text,
                            area:_areaController.text,
                            delivery_address:
                                '${_houseNumberController.text}${' , '} ${_streetController.text}${' , '}${_areaController.text}${' , '}${_landmarkController.text}',
                          ),
                        ),
                      );
                    }
                  }
                  // }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  // padding: EdgeInsets.symmetric(vertical: 15.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: colorPrimary,
                    borderRadius: BorderRadius.all(Radius.circular(88.sp)),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 14.sp, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//   void onError(PlacesAutocompleteResponse response) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(response.errorMessage!)),
//     );
//   }

//   Future<void> _handlePressButton() async {
//     print('pressed');
//     // show input autocomplete with selected mode
//     // then get the Prediction selected
//     Prediction? p = await PlacesAutocomplete.show(
//       context: context,
//       apiKey: kGoogleApiKey,
//       onError: onError,
//       mode: Mode.overlay,
//       language: "fr",
//       decoration: InputDecoration(
//         hintText: 'Search',
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//           borderSide: const BorderSide(
//             color: Colors.white,
//           ),
//         ),
//       ),
//       components: [Component(Component.country, "uk")],
//     );

//     displayPrediction(p, context);
//   }
// }

// Future<void> displayPrediction(Prediction? p, BuildContext context) async {
//   if (p != null) {
//     // get detail (lat/lng)
//     GoogleMapsPlaces _places = GoogleMapsPlaces(
//       apiKey: kGoogleApiKey,
//       apiHeaders: await const GoogleApiHeaders().getHeaders(),
//     );
//     PlacesDetailsResponse detail =
//         await _places.getDetailsByPlaceId(p.placeId!);
//     final lat = detail.result.geometry!.location.lat;
//     final lng = detail.result.geometry!.location.lng;

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("${p.description} - $lat/$lng")),
//     );
//   }
// }
}
