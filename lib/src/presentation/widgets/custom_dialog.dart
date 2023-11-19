// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:lottie/lottie.dart';

// void reportToDialog(BuildContext context) {
//   showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: boldText,
//           elevation: 0.0,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           title: null,
//           content: SizedBox(
//             height: 420,
//             width: 370,
//             child: Column(
//               children: [
//                 Text(
//                   'Report An Issue',
//                   style: GoogleFonts.nunito(
//                       color: background,
//                       fontSize: 23,
//                       fontWeight: FontWeight.w800),
//                 ),
//                 Text(
//                   'How can we help you?',
//                   style: GoogleFonts.nunito(
//                       color: greyfadeTextColor,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600),
//                 ),
//                 SizedBox(
//                   height: 22,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         color: fundWalletColor,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       width: 130,
//                       child: Padding(
//                         padding:
//                             EdgeInsets.symmetric(vertical: 25, horizontal: 10),
//                         child: Column(
//                           children: [
//                             Icon(Iconsax.wifi_square5,
//                                 color: backgroundColor, size: 43),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                               'Payment Bills',
//                               softWrap: true,
//                               overflow: TextOverflow.visible,
//                               textAlign: TextAlign.center,
//                               style: GoogleFonts.nunito(
//                                   color: background, fontSize: 20),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                         color: fundWalletColor,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       width: 130,
//                       child: Padding(
//                         padding:
//                             EdgeInsets.symmetric(vertical: 25, horizontal: 10),
//                         child: Column(
//                           children: [
//                             Icon(
//                               Icons.wallet,
//                               color: backgroundColor,
//                               size: 43,
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                               'Account Top-up',
//                               softWrap: true,
//                               overflow: TextOverflow.visible,
//                               textAlign: TextAlign.center,
//                               style: GoogleFonts.nunito(
//                                   color: background, fontSize: 20),
//                             )
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         color: fundWalletColor,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       width: 130,
//                       child: Padding(
//                         padding:
//                             EdgeInsets.symmetric(vertical: 25, horizontal: 10),
//                         child: Column(
//                           children: [
//                             Icon(Iconsax.transaction_minus5,
//                                 color: backgroundColor, size: 43),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                               'Transaction Pin',
//                               softWrap: true,
//                               overflow: TextOverflow.visible,
//                               textAlign: TextAlign.center,
//                               style: GoogleFonts.nunito(
//                                   color: background, fontSize: 20),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                         color: fundWalletColor,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       width: 130,
//                       child: Padding(
//                         padding:
//                             EdgeInsets.symmetric(vertical: 25, horizontal: 10),
//                         child: Column(
//                           children: [
//                             Icon(
//                               Iconsax.profile_tick5,
//                               color: backgroundColor,
//                               size: 45,
//                             ),
//                             SizedBox(
//                               height: 18,
//                             ),
//                             Text(
//                               'Account Verification',
//                               softWrap: true,
//                               overflow: TextOverflow.visible,
//                               textAlign: TextAlign.center,
//                               style: GoogleFonts.nunito(
//                                   color: background, fontSize: 20),
//                             )
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         );
//       });
// }

// Future custTomDialog(BuildContext context, String message,
//     {String additionalText = 'Something went wrong'}) {
//   return showDialog(
//     context: context,
//     // barrierColor: Colors.white,
//     barrierDismissible: false,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         backgroundColor: boldText,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         elevation: 0,
//         title: null,
//         content: SizedBox(
//           height: 270,
//           child: Column(
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Align(
//                   alignment: Alignment.topRight,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30),
//                       color: errorTextFade,
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.all(10),
//                       child: Icon(
//                         Iconsax.close_circle,
//                         color: errorTextColor,
//                         size: 30,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Lottie.asset(
//                 errorPayment,
//                 width: 100,
//                 height: 100,
//               ),
//               SizedBox(
//                 height: 14,
//               ),
//               Text(
//                 message,
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.nunito(
//                   color: errorTextColor,
//                   fontSize: 20,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Text(
//                 // "I'm sorry, but it seems the phone number you provided is already in use.",
//                 additionalText,
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.nunito(
//                   color: greyfadeTextColor,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
