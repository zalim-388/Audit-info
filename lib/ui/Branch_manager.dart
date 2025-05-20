import 'package:audit_info/utils/FontStyle.dart';
import 'package:audit_info/utils/colors.dart';
import 'package:audit_info/utils/customDrawer.dart';
import 'package:audit_info/utils/updatepass_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BranchManager extends StatefulWidget {
  const BranchManager({super.key});

  @override
  State<BranchManager> createState() => _BranchMangerState();
}

class _BranchMangerState extends State<BranchManager> {
  int _selectedIndex = 1;
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
        title: Text(
          " Branch Manager",
          style: FontStyles.heading
        ),
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

      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 13.h),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 322.w,
                      height: 30.h,

                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xFF404A80),
                          ),
                          hintText: "search",
                          hintStyle: FontStyles.body,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.kBorderColor,
                            ),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.kBorderColor,
                            ),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 7.w),
                  GestureDetector(
                    onTap: () {
                      openDialog(context);
                    },
                    child: Container(
                      height: 28.h,
                      width: 28.w,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/icon/Group 189.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              Container(
                width: 354.w,
                height: 35.h,
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
                width: 354.w,

                child: Table(
                  border: TableBorder(
                    horizontalInside: BorderSide(color: AppColors.kBorderColor),
                    verticalInside: BorderSide(color: AppColors.kBorderColor),
                    bottom: BorderSide(color: Colors.black),
                    left: BorderSide(color: Colors.black),
                    right: BorderSide(color: Colors.black),
                  ),

                  columnWidths: {
                    0: FixedColumnWidth(160), // Id
                    1: FixedColumnWidth(60), // Status
                    2: FixedColumnWidth(100), // Actions
                  },
                  children: [
                    TableRow(
                      decoration: BoxDecoration(color: Colors.grey[300]),
                      children: [
                        Text(
                          'Id',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 10.sp,
                            color: AppColors.kTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Status',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 10.sp,
                            color: AppColors.kTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Actions',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 10.sp,
                            color: AppColors.kTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    _TableRow(" 2342424"),
                    _TableRow(" 4534634"),

                    _TableRow(" 34252526"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TableRow _TableRow(String Id) {
  return TableRow(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(Id, style: FontStyles.body),
      ),
      Icon(Icons.toggle_on, color: Colors.green),

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(Icons.edit_square, color: Colors.blue),
            SizedBox(width: 18),
            Icon(Icons.delete, color: Colors.red),
          ],
        ),
      ),
    ],
  );
}

Future<void> openDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Container(
          width: 358.w,
          height: 683.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Create New Branch Manager",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.close),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),

                  _fullTextField(title: "Employee Code"),
                  _fullTextField(
                    title: "Date of Joining",

                    icon: Icons.calendar_today,
                  ),
                  _fullTextField(title: "Name"),
                  _fullTextField(title: "Email"),
                  _fullTextField(title: "Address"),
                  _fullTextField(title: "Phone Number"),
                  _fullTextField(title: "Password", isPassword: true),
                  _fullTextField(title: "Confirm Password", isPassword: true),

                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Expanded(child: _smallTextField(title: "Address")),
                      SizedBox(width: 14.w),
                      Expanded(child: _smallTextField(title: "Phone Number")),
                    ],
                  ),

                  SizedBox(height: 21.h),
                  Row(
                    children: [
                      Expanded(child: _smallTextField(title: "password")),
                      SizedBox(width: 14.w),
                      Expanded(
                        child: _smallTextField(title: "Confirom password"),
                      ),
                    ],
                  ),
                  SizedBox(height: 21.h),

                  Row(
                    children: [
                      _smallTextField(title: "Select branch"),
                      SizedBox(width: 10.w),
                      _smallTextField(title: "Point Amount"),
                      SizedBox(width: 10.w),
                      _smallTextField(title: "Salary"),
                    ],
                  ),

                  SizedBox(height: 25.h),
                  SizedBox(
                    width: double.infinity,
                    height: 44.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Create",
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

Widget _fullTextField({
  required String title,

  IconData? icon,
  bool isPassword = false,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 18.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(height: 6.h),
        SizedBox(
          height: 40.h,
          child: TextField(
            obscureText: isPassword,
            decoration: InputDecoration(
              hintStyle: GoogleFonts.poppins(fontSize: 12),
              suffixIcon: icon != null ? Icon(icon, size: 18) : null,
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: AppColors.kBorderColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: AppColors.kBorderColor),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _smallTextField({required String title}) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: GoogleFonts.inter(fontSize: 12)),
        SizedBox(height: 6.h),
        Container(
          height: 30.h,
          child: TextField(
            decoration: InputDecoration(
              hintStyle: GoogleFonts.inter(fontSize: 12),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              filled: true,
              fillColor: Colors.white,

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: AppColors.kBorderColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: AppColors.kBorderColor),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
