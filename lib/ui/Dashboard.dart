import 'package:audit_info/ui/Branch_manager.dart';
import 'package:audit_info/ui/customDrawer.dart';
import 'package:audit_info/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  void _onitemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Customdrawer(
        onitemTapped: _onitemTapped,
        SelectedIndex: _selectedIndex,
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: Icon(Icons.menu, color: kPrimaryColor),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
        ),

        title: Text(
          "Dashboard",
          style: TextStyle(color: kBorderColor, fontSize: 14),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
            child: Container(
              height: 20.h,
              width: 66.w,
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                "update\npassword",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 9),
              ),
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout_rounded, color: Color(0xFF414143)),
          ),
        ],
      ),

      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: ktextcolor),
                hintText: "search",
                hintStyle: TextStyle(color: ktextcolor),

                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
                fillColor: kcontainer,
                filled: true,
              ),
            ),
            SizedBox(height: 21.h),
            Stack(
              children: [
                Container(
                  height: 71.h,
                  width: 354.w,
                  decoration: BoxDecoration(
                    color: kcontainer,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 5,
                  child: Container(
                    height: 60.h,
                    width: 110,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: Row(
                      children: [
                        SizedBox(width: 10.w),
                        Text(
                          "No of\nLeads",
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: ktextcolor,
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Text(
                          "6",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: ktextcolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  top: 5,
                  left: 125,
                  child: Container(
                    height: 60.h,
                    width: 110,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: Row(
                      children: [
                        SizedBox(width: 10.w),
                        Text(
                          "No of\nAdmission",
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: ktextcolor,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          "2",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: ktextcolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  top: 5,
                  left: 245,
                  child: Container(
                    height: 60.h,
                    width: 110,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 10.w),
                        Text(
                          "No of\nBranches",
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: ktextcolor,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          "2",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: ktextcolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 13.h),
            Container(
              width: 109.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: kcontainer,
                borderRadius: BorderRadius.circular(7),
              ),
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "select branch",
                    style: GoogleFonts.inter(fontSize: 10, color: ktextcolor),
                    overflow: TextOverflow.ellipsis,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 16,
                      color: ktextcolor,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 17.h),

            // chart
            SizedBox(height: 18.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Leaderboard", style: GoogleFonts.inter(fontSize: 13)),
                  SizedBox(height: 27.h),
                  Container(
                    width: 337.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: kcontainer,
                      border: Border.all(
                        color: const Color(0x41414333),
                        width: 1,
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Branch Manager',
                        style: GoogleFonts.inter(
                          fontSize: 10.sp,
                          color: ktextcolor,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 337.w,
                    height: 90.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0x41414333),
                        width: 1,
                      ),
                    ),
                    child: Table(
                      border: TableBorder.all(color: Colors.black),
                      columnWidths: const {
                        0: FixedColumnWidth(60),
                        1: FixedColumnWidth(160),
                        2: FixedColumnWidth(60),
                      },
                      children: [
                        TableRow(
                          decoration: const BoxDecoration(
                            color: Color(0xFFEBC2AF),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Text(
                                'No of',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 10.sp,
                                  color: ktextcolor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Text(
                                'Manager',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 10.sp,
                                  color: ktextcolor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Text(
                                'Admissions',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 10.sp,
                                  color: ktextcolor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          decoration: BoxDecoration(color: kcontainer),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Text(
                                '1',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 10.sp,
                                  color: ktextcolor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Text(
                                'Fabio',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 10.sp,
                                  color: ktextcolor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Text(
                                '1',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 10.sp,
                                  color: ktextcolor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          decoration: BoxDecoration(color: kcontainer),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Text(
                                '2',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 10.sp,
                                  color: ktextcolor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Text(
                                'Carvalho',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 10.sp,
                                  color: ktextcolor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Text(
                                '0',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 10.sp,
                                  color: ktextcolor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Container(
                    width: 337.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: kcontainer,
                      border: Border.all(
                        color: const Color(0x41414333),
                        width: 1,
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'SRC',
                        style: GoogleFonts.inter(
                          fontSize: 10.sp,
                          color: ktextcolor,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 337.w,
                    height: 90.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0x41414333),
                        width: 1,
                      ),
                    ),
                    child: Table(
                      border: TableBorder.all(color: Colors.black),
                      columnWidths: const {
                        0: FixedColumnWidth(60),
                        1: FixedColumnWidth(160),
                        2: FixedColumnWidth(60),
                      },
                      children: [
                        TableRow(
                          decoration: const BoxDecoration(
                            color: Color(0xFFEBC2AF),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Text(
                                'No of',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 10.sp,
                                  color: ktextcolor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Text(
                                'Manager',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 10.sp,
                                  color: ktextcolor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Text(
                                'Admissions',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 10.sp,
                                  color: ktextcolor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          decoration: const BoxDecoration(
                            color: Color(0xFFEBC2AF),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Text(
                                '1',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 10.sp,
                                  color: ktextcolor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Text(
                                'sreya',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 10.sp,
                                  color: ktextcolor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Text(
                                '1',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 10.sp,
                                  color: ktextcolor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          decoration: const BoxDecoration(
                            color: Color(0xFFEBC2AF),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Text(
                                '2',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 10.sp,
                                  color: ktextcolor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Text(
                                'sahad',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 10.sp,
                                  color: ktextcolor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Text(
                                '2',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 10.sp,
                                  color: ktextcolor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
