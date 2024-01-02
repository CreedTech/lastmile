import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/core.dart';

class TermsAndConditionsView extends StatefulWidget {
  const TermsAndConditionsView({super.key});

  @override
  State<TermsAndConditionsView> createState() => _TermsAndConditionsViewState();
}

class _TermsAndConditionsViewState extends State<TermsAndConditionsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorWhite,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: colorsBlack,
          ),
        ),
        title: Text(
          'Terms & Condition',
        ).boldSized(22.sp).colors(colorsBlack),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: 10.h, left: 16.w, right: 16.w, bottom: 32.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 29.h),
                  child: Text(
                    "TAA Connect Logistics aims to establish a collaborative, secure, and mutually beneficial environment for Users/Customers and Riders, so we have come up with a Terms and Conditions a Rider and Users/Customers must adhere to in other to promote peace and tranquility. \n \n This Terms and Conditions will serve as the foundation for a fair and secure environment for both Riders and Users/Customers: ",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1. Code of Conduct: ',
                      style: GoogleFonts.nunito(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        '◆ Professionalism: Users are expected to conduct themselves with professionalism, treating fellow riders, including our customers with respect and courtesy. ',
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        '◆  Ethical Practices: A Rider must adhere to ethical business practices, avoiding any behavior that could harm the reputation or integrity of TAA Connect Logistics. ',
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 40.h),
                      child: Text(
                        '◆ Compliance with Laws: Riders are required to comply with all local, regional, andnational traffic laws and regulations governing the logistics and transportation industry. ',
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '2. Payment and Rewards: ',
                      style: GoogleFonts.nunito(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        '◆ Payment Plan: A User must adhere to payment type provided ',
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        '◆ Payment Structure: A rider payment structure, including rates, bonuses, and any other applicable fees will be displayed on their personal dashboard to ensure transparency.',
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        '◆ Billing Processes: The consideration payable to the Rider by the TAA Management forthe handling of goods and related services, will be in accordance with the standardtariffsof the Rider. This will be made available on request. ',
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        '◆ Documentation: Every payment transaction from Rider/User and TAAconnect management from billing cycles, invoicing/receipts, and dispute resolution mechanismswill be properly documented to facilitate fair and efficient payment procedures. ',
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 40.h),
                      child: Text(
                        '◆ Incentives: Incentive programs, bonuses, rewards, and any additional compensation offered by TAA management will be announced and uploaded on the application to encourage exceptional service. ',
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '3. Liability and Insurance: ',
                      style: GoogleFonts.nunito(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        '◆ TAA Connect liable for any shipment transported by the company but is limitedtothedeclared value of the item as shown on the waybill/invoice.',
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        '◆ TAA Connect warranties: The Management shall indemnify and hold the rider harmlessfor any loss or damage arising out of the failure to comply with any applicable laws or regulations, and the breach of the following warranties and representations:\n\n A. All information, descriptions, values and other particulars furnished to the Rider is not complete and accurate; \n\n B. The shipment is not properly marked, addressed and packed to ensure safe transportation with ordinary care in handling; ',
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        '◆ Rider shall be liable for direct loss and damage only and this shall be limited to the declared value of the shipment as stated on the waybill. All other types of loss or damage are excluded and this includes but is not limited to lost profits, income, interest, and future business.',
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        '◆ Incident Reporting: A rider must meet up all procedures for reporting incidents, accidents, or any issues during deliveries, he must immediate communicate with the support/admin to address and resolve any concerns. ',
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 40.h),
                      child: Text(
                        '◆ Insurance Requirements: Riders must maintain proper insurance coverage for their vehicles and activities, ensuring they meet the necessary standards for liability and protection. ',
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '4. Data Privacy: ',
                      style: GoogleFonts.nunito(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        '◆ Data Security Measures: TAA Connect Logistics outlines the robust measures in place to protect user data, ensuring the confidentiality and integrity of personal and business information. ',
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 40.h),
                      child: Text(
                        "◆ User Consent: Every Users consent to the collection, use, and storage of their data in accordance with privacy laws and TAA Connect Logistics' privacy policy. ",
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '5. Delivery Policy: ',
                      style: GoogleFonts.nunito(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        '◆ Package Handling: A rider has the right to ensure that a package are properly sealed before and after he/she fulfills an order, and all packages must be handled with care to ensure a safe and secure transport of items. ',
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      child: Text(
                        "◆ Right to Inspection: The User is to ensure 100% inspection of goods, acknowledge condition of goods before departure at point of collection from Rider as TAAConnect will not be liable for any complaints afterward. ",
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      child: Text(
                        "◆ Delivery Verification: All confirmed packages with a verifiable address will be delivered at the address stated and not any other address, this is our safety and security measures. ",
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 40.h),
                      child: Text(
                        "◆ Delivery Confirmation: After a delivery is confirmed, a rider is expected to request for a digital/Manual confirmation of recipient signatures and tender to the head office at the end of the day. ",
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '6. Safety Policy: ',
                      style: GoogleFonts.nunito(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        '◆ Daily Vehicle Maintenance: A rider is responsible to ensure that his vehicle is operating at optimum capacity and in a good working condition to ensure their safety and a reliable services to our customers. ',
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 40.h),
                      child: Text(
                        "◆ Use of Safety Gear: Riders are required to use appropriate safety gear, such as helmets and reflective clothing, to enhance visibility and protect themselves during deliveries. ",
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '7. Speed Limit Policy: ',
                      style: GoogleFonts.nunito(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        '◆ Adherence to Speed Limits: Riders must adhere to specified speed limits, promoting safe and responsible driving practices during deliveries. ',
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        '◆ Route: When carrying goods, The Rider shall in its sole discretion decide what route to follow. ',
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 40.h),
                      child: Text(
                        "◆ Consequences of Speeding: If a rider is warned against speeding 3 consecutive times in a month and still chooses to violate the rules he/she will be issued a query and asked to take a leave of absence without pay Clear or any penalties as decided by the disciplinary committee including termination of services for repeated violations. ",
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '8. Termination Policy: ',
                      style: GoogleFonts.nunito(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        '◆ Dispute: In case of any dispute arising from shipment, such dispute shall be amicably resolved by the parties. If the dispute, difference or claim is not settled amicably, parties shall jointly appoint a sole arbitrator to arbitrate on the matter after which, such difference or Claim shall then be referred any court as agreed by both parties for Mediation which shall be conducted in accordance with the Mediation Procedure Rules.',
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        '◆ The applicable Laws regarding this agreement are the Laws of the Federal Republic of Nigeria. ',
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        "◆ Violations of Terms: TAA Connect Logistics reserves the right to terminate services for users/riders who violate the terms and conditions, engage in fraudulent activities, or fail to meet the platform's standards.",
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 40.h),
                      child: Text(
                        "◆ Notice Period: In some cases, users/rider may be given a notice period before termination, allowing them an opportunity to rectify any violations or issues. ",
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              Padding(
                  padding: EdgeInsets.only(bottom: 29.h),
                  child: Text(
                    "By outlining these guidelines and conditions, TAA Connect Logistics aims to foster a secure, efficient, and professional environment for both businesses and riders within its platform.  ",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
