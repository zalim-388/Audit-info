import 'package:audit_info/utils/FontStyle.dart';
import 'package:audit_info/utils/colors.dart';
import 'package:audit_info/utils/customDrawer.dart';
import 'package:audit_info/utils/updatepass_sheet.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LeadManagment extends StatefulWidget {
  const LeadManagment({super.key});

  @override
  State<LeadManagment> createState() => _LeadManagmentState();
}

class _LeadManagmentState extends State<LeadManagment> {
  int _selectedIndex = 8;
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
        title: Text(" Lead Managment", style: FontStyles.heading),
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
                  Container(
                    width: 25.w,
                    height: 25.h,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.filter_list_alt,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  SizedBox(width: 143.w),
                  Container(
                    height: 28.h,
                    width: 88.w,
                    decoration: BoxDecoration(
                      color: AppColors.kPrimaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 6.w),
                        Text(
                          "Upload lead",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(width: 3.w),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              ModalBottomSheetRoute(
                                builder:
                                    (context) => _modalBottomSheet(context),
                                isScrollControlled: true,
                              ),
                            );
                          },
                          child: Container(
                            height: 18.h,
                            width: 18.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.add,
                              color: AppColors.kPrimaryColor,
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 8.w),
                  Container(
                    height: 28.h,
                    width: 88.w,

                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 8.w),
                        Text(
                          "Add lead",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(width: 11.w),
                        GestureDetector(
                          onTap: () {
                            Addlead(context);
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
                  ),
                ],
              ),

              SizedBox(height: 13.h),

              Container(
                width: 358.w,

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
                child: Table(
                  border: TableBorder(
                    borderRadius: BorderRadius.circular(9),

                    horizontalInside: BorderSide(color: AppColors.kBorderColor),
                    verticalInside: BorderSide(color: AppColors.kBorderColor),
                    bottom: BorderSide(color: Colors.black),
                  ),
                  columnWidths: const <int, TableColumnWidth>{
                    0: FixedColumnWidth(55), // Si.no
                    1: FixedColumnWidth(80), // Name (with icon)
                    2: FixedColumnWidth(74), // Phone number (long)
                    3: FixedColumnWidth(60), // Address
                    4: FixedColumnWidth(60), // Actions (two buttons)
                  },

                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.grey[300],
                      ),
                      children: [
                        Text(
                          'Date',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 10.sp,
                            color: AppColors.kTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Name',
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
                            'SChool Name',
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
                            'Phone number',
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
                            'SRC',
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
                      ],
                    ),
                    _leadRow(
                      Date: "1/2/2022",
                      name: "SAlim",
                      Schoolname: "",
                      Src: "",
                      phonenumber: "65347595",
                      Status: 'Registered',
                    ),
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

TableRow _leadRow({
  required String Date,
  required String name,
  required String Schoolname,
  required String Src,
  required String phonenumber,
  required String Status,
}) {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Center(child: Text(Date, style: FontStyles.body)),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Center(child: Text(name, style: FontStyles.body)),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Center(child: Text(Schoolname, style: FontStyles.body)),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Center(child: Text(Src, style: FontStyles.body)),
      ),

      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Center(child: Text(phonenumber, style: FontStyles.body)),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Center(
          child: Text(
            Status,
            style: GoogleFonts.poppins(color: Colors.green, fontSize: 10),
          ),
        ),
      ),
    ],
  );
}

// Actions Row
TableRow _actionsRow(VoidCallback DownArrow) {
  return TableRow(
    children: [
      Container(
        height: 12.h,
        width: 352.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: Color(0xFFF2F2F2),
        ),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Text("Actions", style: FontStyles.bold),

            SizedBox(width: 285.w),
            IconButton(
              onPressed: DownArrow,
              icon: Icon(Icons.keyboard_arrow_down),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _modalBottomSheet(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
    child: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 41.w, vertical: 20.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Upload Box
                DottedBorder(
                  dashPattern: [6, 3],
                  color: Color(0xFF868686),
                  strokeWidth: 1,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(17),
                  child: Container(
                    height: 156.h,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(17),
                    ),

                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.upload_outlined,
                          size: 50.sp,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "Click this here to upload your file",
                          style: GoogleFonts.poppins(
                            fontSize: 10.sp,
                            color: Color(0xFF525252),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 30.h),

                SizedBox(
                  width: double.infinity,
                  height: 30.h,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle submit
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF9900),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Submit",
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,

                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Future<void> Addlead(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          String? selectedSchool;
          String? selectedSubject;
          String? selectedSRC;
          String? selectedSRO;
          String? selectedBranch;
          String? selectedCourse;

          final List<String> schools = ['School A', 'School B', 'School C'];
          final List<String> subjects = ['Mathematics', 'Science', 'English'];
          final List<String> srcOptions = ['SRC 1', 'SRC 2', 'SRC 3'];
          final List<String> sroOptions = ['SRO 1', 'SRO 2', 'SRO 3'];
          final List<String> branches = ['Branch A', 'Branch B', 'Branch C'];
          final List<String> courses = ['Course 1', 'Course 2', 'Course 3'];

          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Container(
              width: 358.w,
              height: 603.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 20.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Add New Lead", style: FontStyles.heading),
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.close,
                              color: AppColors.kBorderColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),

                      _fullTextField(title: "Name"),
                      SizedBox(height: 10.h),
                      _fullTextField(title: "Phone Number"),
                      SizedBox(height: 10.h),
                      _fullTextField(title: "Address"),

                      SizedBox(height: 13.h),

                      Row(
                        children: [
                          Expanded(
                            child: _buildDropdownField(
                              "School Name",
                              selectedSchool,
                              schools,
                              "Select School",
                              (value) => setState(() => selectedSchool = value),
                              context,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: _buildDropdownField(
                              "Subject Name",
                              selectedSubject,
                              subjects,
                              "Select Subject",
                              (value) =>
                                  setState(() => selectedSubject = value),
                              context,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),

                      // Select SRC and Select SRO Row
                      Row(
                        children: [
                          Expanded(
                            child: _buildDropdownField(
                              "Select SRC",
                              selectedSRC,
                              srcOptions,
                              "Select SRC",
                              (value) => setState(() => selectedSRC = value),
                              context,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: _buildDropdownField(
                              "Select SRO",
                              selectedSRO,
                              sroOptions,
                              "Select SRO",
                              (value) => setState(() => selectedSRO = value),
                              context,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),

                      _buildDropdownField(
                        "Branch",
                        selectedBranch,
                        branches,
                        "Select Branch",
                        (value) => setState(() => selectedBranch = value),
                        context,
                      ),
                      SizedBox(height: 10.h),

                      Row(
                        children: [
                          Expanded(
                            child: _buildDropdownField(
                              "Course name",
                              selectedCourse,
                              courses,
                              "Select Course",
                              (value) => setState(() => selectedCourse = value),
                              context,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: _fullTextField(
                              title: "Mark percentage",

                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10.h),
                      _fullTextField(
                        title: "Confirm Password",
                        isPassword: true,
                      ),
                      SizedBox(height: 21.h),
                      SizedBox(
                        width: double.infinity,
                        height: 30.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Add Lead",
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
    },
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
