import 'package:audit_info/utils/colors.dart';
import 'package:audit_info/utils/customDrawer.dart';
import 'package:audit_info/utils/updatepass_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late List<_ChartData> leadsData;
  late List<_ChartData> admissionData;
  late TooltipBehavior _tooltip;

  int _selectedIndex = 0;
  void _onitemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void initState() {
    super.initState();
    leadsData = [
      _ChartData(x: 'Jan', y: 0.5),
      _ChartData(x: 'Feb', y: 3.0),
      _ChartData(x: 'Mar', y: 1.0),
      _ChartData(x: 'Apr', y: 2.0),
      _ChartData(x: 'May', y: 4.0),
    ];
    admissionData = [
      _ChartData(x: 'Jan', y: 1.0),
      _ChartData(x: 'Feb', y: 1.0),
      _ChartData(x: 'Mar', y: 2.0),
      _ChartData(x: 'Apr', y: 0.5),
      _ChartData(x: 'May', y: 3.0),
    ];

    _tooltip = TooltipBehavior(
      enable: true,
      format: 'point.x : point.y',
      color: Colors.grey.shade800,
      textStyle: const TextStyle(color: Colors.white),
    );
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
          style: TextStyle(color: ktextcolor, fontSize: 14),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  ModalBottomSheetRoute(
                    builder: (context) => UpdatepassSheet(),
                    isScrollControlled: true,
                  ),
                );
              },
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
        child: SingleChildScrollView(
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
                    left: 8,
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
                    left: 128,
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
                    left: 247,
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
                    // String selectedBranch = 'Branch 1';
                    //  DropdownButton<String>(
                    //   value: selectedBranch,
                    //   isExpanded: true,
                    //   underline: const SizedBox(),
                    //   items:
                    //       ['Branch 1', 'Branch 2', 'Branch 3']
                    //           .map(
                    //             (branch) => DropdownMenuItem<String>(
                    //               value: branch,
                    //               child: Text(branch),
                    //             ),
                    //           )
                    //           .toList(),
                    //   onChanged: (value) {
                    //     setState(() {
                    //       selectedBranch = value!;
                    //     });
                    //   },
                    //   hint: const Text('Select Branch'),
                    // ),
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
              Container(
                height: 408.h,
                width: 358.w,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 15,
                      spreadRadius: 5,
                      color: Colors.grey.withOpacity(0.1),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Select Branch Dropdown
                          SfCartesianChart(
                            tooltipBehavior: _tooltip,
                            primaryXAxis: CategoryAxis(
                              majorGridLines: MajorGridLines(width: 0),
                            ),
                            primaryYAxis: NumericAxis(
                              maximum: 4,
                              minimum: 0,
                              interval: 0.5,
                              majorGridLines: MajorGridLines(width: 0),
                            ),
                            legend: Legend(
                              isVisible: true,
                              position: LegendPosition.top,
                            ),
                            series: <CartesianSeries<_ChartData, String>>[
                              ColumnSeries<_ChartData, String>(
                                dataSource: leadsData,
                                xValueMapper: (datum, _) => datum.x,
                                yValueMapper: (datum, _) => datum.y,
                                color: Colors.blue,
                             width: 0.3, // Fixed: Changed from 19.w to 0.3
                      spacing: 0.1,
                                name: 'Leads',
                              ),

                              ColumnSeries<_ChartData, String>(
                                dataSource: admissionData,
                                xValueMapper: (datum, index) => datum.x,
                                yValueMapper: (datum, index) => datum.y,
                                color: Colors.green,
                          width: 0.3, // Fixed: Changed from 19.w to 0.3
                      spacing: 0.1,
                                name: 'Admission',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 18.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 34),
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
                        border: Border.all(color: const Color(0x41414333)),
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
                        // border: BorderDirectional(
                        //   top: BorderSide(
                        //     color: const Color(0x41414333),
                        //     width: 1,
                        // //   ),
                        // ),
                      ),
                      child: Table(
                        border: TableBorder.all(color: Color(0x41414333)),
                        columnWidths: {
                          0: FixedColumnWidth(70),
                          1: FixedColumnWidth(160),
                          2: FixedColumnWidth(70),
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
                                padding: EdgeInsets.symmetric(vertical: 8.0),
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

                        border: Border.all(color: const Color(0x41414333)),
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
                        border: BorderDirectional(
                          top: BorderSide(color: Color(0x41414333)),
                        ),
                      ),
                      child: Table(
                        border: TableBorder.all(color: Color(0x41414333)),
                        columnWidths: const {
                          0: FixedColumnWidth(70),
                          1: FixedColumnWidth(160),
                          2: FixedColumnWidth(70),
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
      ),
    );
  }
}

class _ChartData {
  final String x;
  final double y;

  _ChartData({required this.x, required this.y});
}
