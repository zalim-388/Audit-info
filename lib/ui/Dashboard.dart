import 'package:audit_info/utils/FontStyle.dart';
import 'package:audit_info/utils/colors.dart';
import 'package:audit_info/utils/customDrawer.dart';
import 'package:audit_info/utils/updatepass_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  int _currentMonthGroup = 1;

  int _selectedIndex = 0;
  void _onitemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    leadsData = [
      _ChartData(x: 'Jan', y: 0.5),
      _ChartData(x: 'Feb', y: 3.0),
      _ChartData(x: 'Mar', y: 1.0),
      _ChartData(x: 'Apr', y: 2.0),
      _ChartData(x: 'May', y: 4.0),
      _ChartData(x: 'Jun', y: 1.5),
      _ChartData(x: 'Jul', y: 1.0),
      _ChartData(x: 'Aug', y: 2.5),
      _ChartData(x: 'Sep', y: 3.5),
      _ChartData(x: 'Oct', y: 1.5),
      _ChartData(x: 'Nov', y: 0.5),
      _ChartData(x: 'Dec', y: 2.0),
    ];
    admissionData = [
      _ChartData(x: 'Jan', y: 1.0),
      _ChartData(x: 'Feb', y: 1.0),
      _ChartData(x: 'Mar', y: 2.0),
      _ChartData(x: 'Apr', y: 0.5),
      _ChartData(x: 'May', y: 3.0),
      _ChartData(x: 'Jun', y: 2.0),
      _ChartData(x: 'Jul', y: 0.5),
      _ChartData(x: 'Aug', y: 1.5),
      _ChartData(x: 'Sep', y: 2.0),
      _ChartData(x: 'Oct', y: 1.0),
      _ChartData(x: 'Nov', y: 0.0),
      _ChartData(x: 'Dec', y: 1.0),
    ];

    _tooltip = TooltipBehavior(
      enable: true,
      format: 'point.x : point.y',
      color: Colors.grey.shade800,
      textStyle: const TextStyle(color: Colors.white),
    );
  }

  List<_ChartData> _getCurrentLeadsData() {
    int startIndex = _currentMonthGroup * 6;
    return leadsData.sublist(startIndex, startIndex + 6);
  }

  List<_ChartData> _getCurrentAdmissionData() {
    int startIndex = _currentMonthGroup * 6;
    return admissionData.sublist(startIndex, startIndex + 6);
  }

  void _previousMonths() {
    if (_currentMonthGroup > 0) {
      setState(() {
        _currentMonthGroup--;
      });
    }
  }

  void _nextMonths() {
    if (_currentMonthGroup < 1) {
      setState(() {
        _currentMonthGroup++;
      });
    }
  }

  String? selectedBranch = 'Branch 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Customdrawer(
        onitemTapped: _onitemTapped,
        SelectedIndex: _selectedIndex,
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 4,
        shadowColor: Colors.grey.withOpacity(0.4),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: const Icon(Icons.more_vert, color: Colors.black),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
        ),
        title: const Text(
          "Dashboard",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 21.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 18.w),
                  Container(
                    height: 49.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0190F9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "No of Leads\n       6",
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Container(
                    height: 49.h,
                    width: 114,
                    decoration: BoxDecoration(
                      color: const Color(0xFF00E396),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "No of Admission\n          2",
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Container(
                    height: 49.h,
                    width: 93.w,
                    decoration: BoxDecoration(
                      color: AppColors.kPrimaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "No of Branches \n          2",
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              // Chart
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
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Select Branch Dropdown
                        SizedBox(height: 12.h),
                        Row(
                          children: [
                            SizedBox(width: 8.w),
                            Container(
                              width: 120.w,
                              height: 27.h,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(13),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                              ),
                              child: GestureDetector(
                                onTapDown: (TapDownDetails details) async {
                                  final selected = await showMenu<String>(
                                    context: context,
                                    position: RelativeRect.fromLTRB(
                                      details.globalPosition.dx,
                                      details.globalPosition.dy,
                                      details.globalPosition.dx,
                                      details.globalPosition.dy,
                                    ),
                                    items:
                                        [
                                          'Branch 1',
                                          'Branch 2',
                                          'Branch 3',
                                        ].map((item) {
                                          return PopupMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: GoogleFonts.inter(
                                                fontSize: 12,
                                                color: Colors.black,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                    color: Colors.white,
                                  );

                                  if (selected != null) {
                                    setState(() {
                                      selectedBranch = selected;
                                    });
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      selectedBranch ?? 'Select Branch',
                                      style: GoogleFonts.inter(
                                        fontSize: 10,
                                        color: const Color(0xFF868686),
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 16,
                                      color: AppColors.kTextColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 53.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 8.h,
                                      width: 8.w,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF0190F9),
                                      ),
                                    ),
                                    Text(
                                      "Leads",
                                      style: GoogleFonts.inter(fontSize: 8),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 8.h,
                                      width: 8.w,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF00E396),
                                      ),
                                    ),
                                    Text(
                                      "Admission",
                                      style: GoogleFonts.inter(fontSize: 8),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 60.h),
                        SfCartesianChart(
                          tooltipBehavior: _tooltip,
                          primaryXAxis: const CategoryAxis(
                            majorGridLines: MajorGridLines(width: 0),
                            labelStyle: TextStyle(fontSize: 12),
                          ),
                          primaryYAxis: const NumericAxis(
                            maximum: 4,
                            minimum: 0,
                            interval: 0.5,
                            majorGridLines: MajorGridLines(width: 0),
                            labelStyle: TextStyle(fontSize: 12),
                          ),
                          legend: const Legend(
                            isVisible: false,
                            position: LegendPosition.top,
                            textStyle: TextStyle(fontSize: 12),
                          ),
                          series: <CartesianSeries<_ChartData, String>>[
                            ColumnSeries<_ChartData, String>(
                              dataSource: _getCurrentLeadsData(),
                              xValueMapper: (datum, _) => datum.x,
                              yValueMapper: (datum, _) => datum.y,
                              color: Colors.blue,
                              width: 0.4,
                              spacing: 0.1,
                              name: 'Leads',
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(10),
                              ),
                            ),
                            ColumnSeries<_ChartData, String>(
                              dataSource: _getCurrentAdmissionData(),
                              xValueMapper: (datum, _) => datum.x,
                              yValueMapper: (datum, _) => datum.y,
                              color: Colors.green,
                              width: 0.4,
                              spacing: 0.1,
                              name: 'Admission',
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      right: 320,
                      bottom: 0,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          size: 18,
                        ),
                        onPressed: _previousMonths,
                        color:
                            _currentMonthGroup > 0
                                ? Colors.black
                                : Colors.transparent,
                      ),
                    ),
                    Positioned(
                      left: 335,
                      bottom: 0,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 18,
                        ),
                        onPressed: _nextMonths,
                        color:
                            _currentMonthGroup < 1
                                ? Colors.black
                                : Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 21.h),
              Text("Leaderboard", style: FontStyles.heading),
              SizedBox(height: 9.h),

              // First Table (Branch Manager)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 356.w,
                    height: 24.h,
                    decoration: BoxDecoration(
                      color: AppColors.kContainerColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(9),
                        topRight: Radius.circular(9),
                      ),
                      border: Border(
                        top: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: Text('Branch Manager', style: FontStyles.body),
                    ),
                  ),
                  SizedBox(
                    width: 356.w,

                    child: Table(
                      border: TableBorder(
                        horizontalInside: BorderSide(
                          color: AppColors.kBorderColor,
                        ),
                        verticalInside: BorderSide(
                          color: AppColors.kBorderColor,
                        ),
                        bottom: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                      ),
                      columnWidths: {
                        0: FixedColumnWidth(65.w),
                        1: FixedColumnWidth(169.w),
                        2: FixedColumnWidth(120.w),
                      },
                      children: [
                        TableRow(
                          decoration: BoxDecoration(color: Colors.grey[300]),
                          children: [
                            Text(
                              'No of',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 10.sp,
                                color: AppColors.kTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Manager',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 10.sp,
                                color: AppColors.kTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Admissions',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 10.sp,
                                color: AppColors.kTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        _buildRow('1.', 'Fabio', '3'),
                        _buildRow('2.', 'Salim', '3'),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 25.h),
              // Second Table (SRC)
              Container(
                width: 356.w,
                height: 24.h,
                decoration: BoxDecoration(
                  color: AppColors.kContainerColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(9),
                    topRight: Radius.circular(9),
                  ),
                  border: Border(
                    top: BorderSide(color: Colors.black),
                    left: BorderSide(color: Colors.black),
                    right: BorderSide(color: Colors.black),
                  ),
                ),
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: Text('SRC', style: FontStyles.body),
                ),
              ),
              SizedBox(
                width: 356.w,
                child: Table(
                  border: TableBorder(
                    horizontalInside: BorderSide(color: AppColors.kBorderColor),
                    verticalInside: BorderSide(color: AppColors.kBorderColor),
                    bottom: BorderSide(color: Colors.black),
                    left: BorderSide(color: Colors.black),
                    right: BorderSide(color: Colors.black),
                  ),
                  columnWidths: {
                    0: FixedColumnWidth(65.w),
                    1: FixedColumnWidth(169.w),
                    2: FixedColumnWidth(120.w),
                  },
                  children: [
                    TableRow(
                      decoration: BoxDecoration(color: Colors.grey[300]),
                      children: [
                        Text(
                          'No of',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 10.sp,
                            color: AppColors.kTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Manager',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 10.sp,
                            color: AppColors.kTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Admissions',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 10.sp,
                            color: AppColors.kTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    _buildRow('1.', 'ashiq', '3'),
                    _buildRow('2.', 'farhan', '4'),
                  ],
                ),
              ),
              SizedBox(height: 25.h),
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

TableRow _buildRow(String no, String name, String admission) {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          no,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 10.sp,
            color: AppColors.kTextColor,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 10.sp,
            color: AppColors.kTextColor,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          admission,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 10.sp,
            color: AppColors.kTextColor,
          ),
        ),
      ),
    ],
  );
}
