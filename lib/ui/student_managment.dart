import 'package:audit_info/utils/FontStyle.dart';
import 'package:audit_info/utils/colors.dart';
import 'package:audit_info/utils/customDrawer.dart';
import 'package:audit_info/utils/updatepass_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentManagment extends StatefulWidget {
  const StudentManagment({super.key});

  @override
  State<StudentManagment> createState() => _StudentManagmentState();
}

class _StudentManagmentState extends State<StudentManagment> {
  int _selectedIndex = 9;
  bool showDropdown = false;
  bool _isVisible = false;

  String? selectedItem;
  String? selectedSchool;
  String? selectedStatus;
  String? selectedBranch;

  final List<String> schools = ['School 1', 'School 2', 'School 3'];
  final List<String> statuses = ['REGISTERED', 'PENDING', 'REJECTED'];
  final List<String> branches = ['Branch A', 'Branch B', 'Branch C'];

  void _onitemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _filterleads() {
    setState(() {
      showDropdown = !showDropdown;
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
              (context) =>
                  showDropdown
                      ? IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StudentManagment(),
                            ),
                          );
                          setState(() {
                            showDropdown = false;
                          });
                        },
                      )
                      : IconButton(
                        icon: const Icon(Icons.more_vert, color: Colors.black),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
        ),
        title: Text(" Lead Managment", style: FontStyles.heading),
        actions: [
          if (!showDropdown)
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
          if (!showDropdown)
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
                  Container(
                    width: 25.w,
                    height: 25.h,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    alignment: Alignment.center,

                    child: GestureDetector(
                      onTap: _filterleads,
                      child: Icon(
                        Icons.filter_list_alt,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  Spacer(),
                  if (!showDropdown) ...[
                    Container(
                      height: 28.h,
                      width: 61.w,

                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Register",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ],
              ),

              if (showDropdown) ...[
                SizedBox(height: 20.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),

                    _fullTextField(
                      title: "Start date - End date",
                      width: 360.w,
                      icon: Icons.calendar_today,
                    ),

                    SizedBox(height: 5.h),
                    _buildDropdownField(
                      "Select school",
                      selectedSchool,
                      schools,
                      "Select school",
                      (value) => setState(() => selectedSchool = value),
                      context,
                    ),
                    SizedBox(height: 10.h),
                    _buildDropdownField(
                      "Select status",
                      selectedStatus,
                      statuses,
                      "Select status",
                      (value) => setState(() => selectedStatus = value),
                      context,
                    ),
                    SizedBox(height: 10.h),
                    _buildDropdownField(
                      "Select branch",
                      selectedBranch,
                      branches,
                      "Select branch",
                      (value) => setState(() => selectedBranch = value),
                      context,
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 250),
                      child: GestureDetector(
                        onTap: () {
                          // Add your show functionality here
                          print('Show button tapped');
                        },
                        child: Container(
                          height: 30.h,
                          width: 120.w,
                          decoration: BoxDecoration(
                            color: AppColors.kPrimaryColor,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Show",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Results",
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          color: AppColors.kTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildDropdownField(
  String label,
  String? selectedValue,
  List<String> options,
  String hint,
  Function(String?) onChanged,
  BuildContext context,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: FontStyles.body),
      SizedBox(height: 8.h),
      GestureDetector(
        onTapDown: (TapDownDetails details) async {
          final selected = await showMenu<String>(
            context: context,
            position: RelativeRect.fromLTRB(
              details.globalPosition.dx,
              details.globalPosition.dy,
              MediaQuery.of(context).size.width - details.globalPosition.dx,
              MediaQuery.of(context).size.height - details.globalPosition.dy,
            ),
            items:
                options.map((option) {
                  return PopupMenuItem<String>(
                    value: option,
                    child: Text(
                      option,
                      style: GoogleFonts.poppins(fontSize: 12),
                    ),
                  );
                }).toList(),
            color: Colors.white,
          );

          if (selected != null) {
            onChanged(selected);
          }
        },
        child: Container(
          height: 30.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AppColors.kBorderColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedValue ?? hint,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color:
                      selectedValue == null
                          ? const Color(0xFF868686)
                          : Colors.black,
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
    ],
  );
}

Widget _fullTextField({
  required String title,
  IconData? icon,
  bool isPassword = false,
  double? width,
  TextInputType keyboardType = TextInputType.text,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: FontStyles.body),
      SizedBox(height: 4.h),
      SizedBox(
        height: 30.h,
        width: width ?? 324.w,

        child: TextField(
          keyboardType: keyboardType,
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
  );
}
