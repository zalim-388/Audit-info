import 'package:audit_info/ui/Lead_managment.dart';
import 'package:audit_info/utils/FontStyle.dart';
import 'package:audit_info/utils/colors.dart';
import 'package:audit_info/utils/updatepass_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LeadHistory extends StatefulWidget {
  const LeadHistory(context, {super.key});

  @override
  State<LeadHistory> createState() => _LeadHistoryState();
}

class _LeadHistoryState extends State<LeadHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 4,
        shadowColor: Colors.grey.withOpacity(0.4),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LeadManagment(),
                    ),
                  );
                },
              ),
        ),
        title: Text(" Lead History", style: FontStyles.heading),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  ModalBottomSheetRoute(
                    builder: (context) => const UpdatepassSheet(),
                    isScrollControlled: true,
                  ),
                );
              },
              child: Container(
                height: 20.h,
                width: 22.w,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/icon/updatepass.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout_rounded, color: Color(0xFF414143)),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(height: 22.h),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Student Name: Babu',
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      color: AppColors.kTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Phone Number: 9875647465',
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      color: AppColors.kTextColor,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Address: Nil',
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      color: AppColors.kTextColor,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'SRC Name: ',
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      color: AppColors.kTextColor,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'School Name: PKM',
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      color: AppColors.kTextColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            Container(
              width: 358.w,
              decoration: BoxDecoration(
                color: AppColors.kContainerColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(9),
                  topRight: Radius.circular(9),
                ),
                border: Border(
                  top: BorderSide(color: AppColors.kBorderColor),
                  left: BorderSide(color: AppColors.kBorderColor),
                  right: BorderSide(color: AppColors.kBorderColor),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Table(
                    border: TableBorder(
                      borderRadius: BorderRadius.circular(9),
                      horizontalInside: BorderSide(
                        color: AppColors.kBTablelineColor,
                      ),
                      verticalInside: BorderSide(color: AppColors.kBorderColor),
                      bottom: BorderSide(color: Colors.black),
                    ),
                    columnWidths: const <int, TableColumnWidth>{
                      0: FixedColumnWidth(100), // Date
                      1: FixedColumnWidth(100), // Status
                      2: FlexColumnWidth(), // Message
                    },
                    children: [
                      TableRow(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: AppColors.kContainerColor,
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              'Date',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 10.sp,
                                color: AppColors.kTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              'Status',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 10.sp,
                                color: AppColors.kTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              'Message',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 10.sp,
                                color: AppColors.kTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      _leadHistory(
                        Date: "9-4-2025",
                        Status: "Office visit",
                        Message: "gsdjfisjoasjf;oajf",
                      ),
                      _leadHistory(
                        Date: "3-4-2025",
                        Status: "Office visit",
                        Message: "dhfhshdvvs",
                      ),
                      _leadHistory(
                        Date:
                            "61-2-2025", // Note: This date appears invalid (61-2-2025); assuming it's a typo for 6-2-2025
                        Status: "Office visit",
                        Message: "gsdjffsdfv;agfedy",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Updated _leadRow function to match the new table structure
TableRow _leadHistory({
  required String Date,
  required String Status,
  required String Message,
}) {
  return TableRow(
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border(bottom: BorderSide(color: AppColors.kBTablelineColor)),
    ),
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Center(child: Text(Date, style: FontStyles.body)),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Center(child: Text(Status, style: FontStyles.body)),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Center(child: Text(Message, style: FontStyles.body)),
      ),
    ],
  );
}
