import 'package:audit_info/ui/Accountant.dart';
import 'package:audit_info/ui/Agent.dart';
import 'package:audit_info/ui/Branch_manager.dart';
import 'package:audit_info/ui/Dashboard.dart';
import 'package:audit_info/ui/Lead_managment.dart';
import 'package:audit_info/ui/Office%20Administration.dart';
import 'package:audit_info/ui/SRC.dart';
import 'package:audit_info/ui/SRO.dart';
import 'package:audit_info/ui/student_managment.dart';
import 'package:audit_info/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Customdrawer extends StatefulWidget {
  final int SelectedIndex;
  final Function(int) onitemTapped;

  const Customdrawer({
    super.key,
    required this.onitemTapped,
    required this.SelectedIndex,
  });

  @override
  State<Customdrawer> createState() => _CustomdrawerState();
}

class _CustomdrawerState extends State<Customdrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF414143),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Text.rich(
                  TextSpan(
                    text: 'AU',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: 'D',
                        style: GoogleFonts.poppins(
                          color: AppColors.kPrimaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'IT INFO',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 19.h),
                Divider(),
                SizedBox(height: 16.h),
              ],
            ),
          ),

          // Static drawer items
          _Draweritems(
            icon: Icons.dashboard,
            svgpath: null,
            title: 'Dashboard',
            index: 0,
            selectedIndex: widget.SelectedIndex,
            onTap: () {
              widget.onitemTapped(0);
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
              );
            },
          ),
          SizedBox(height: 25.h),

          _Draweritems(
            icon: null,
            svgpath: "assets/icon/Branch Manager.png",
            title: 'Branch Manager',
            index: 1,
            selectedIndex: widget.SelectedIndex,
            onTap: () {
              widget.onitemTapped(1);
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => BranchManager()),
              );
            },
          ),
          SizedBox(height: 25.h),

          _Draweritems(
            icon: null,
            svgpath: "assets/icon/Accountant.png",
            title: "Accountant",
            index: 2,
            selectedIndex: widget.SelectedIndex,
            onTap: () {
              widget.onitemTapped(2);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Accountant()),
              );
            },
          ),
          SizedBox(height: 25.h),

          _Draweritems(
            icon: null,
            svgpath: 'assets/icon/SRC.png',
            title: 'SRC',
            index: 3,
            selectedIndex: widget.SelectedIndex,
            onTap: () {
              widget.onitemTapped(3);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Src()),
              );
            },
          ),
          SizedBox(height: 25.h),

          _Draweritems(
            icon: null,
            svgpath: 'assets/icon/SRC.png',
            title: 'SRO',
            index: 4,
            selectedIndex: widget.SelectedIndex,
            onTap: () {
              widget.onitemTapped(4);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Sro()),
              );
            },
          ),
          SizedBox(height: 25.h),

          _Draweritems(
            icon: null,
            svgpath: "assets/icon/Office Administration.png",
            title: "Office Administration",
            index: 5,
            selectedIndex: widget.SelectedIndex,
            onTap: () {
              widget.onitemTapped(5);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Officeadministration()),
              );
            },
          ),

          SizedBox(height: 25.h),

          _Draweritems(
            icon: null,
            svgpath: "assets/icon/Agent.png",
            title: "Agent",
            index: 6,
            selectedIndex: widget.SelectedIndex,
            onTap: () {
              widget.onitemTapped(6);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Agent()),
              );
            },
          ),
          SizedBox(height: 25.h),

          _Draweritems(
            icon: null,
            svgpath: "assets/icon/Lead Management.png",
            title: "Lead Management",
            index: 7,
            selectedIndex: widget.SelectedIndex,
            onTap: () {
              widget.onitemTapped(7);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LeadManagment()),
              );
            },
          ),
          SizedBox(height: 25.h),

          _Draweritems(
            icon: null,
            svgpath: "assets/icon/Student Management.png",
            title: "Student Management",
            index: 8,
            selectedIndex: widget.SelectedIndex,
            onTap: () {
              widget.onitemTapped(8);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => StudentManagment()),
              );
            },
          ),
          SizedBox(height: 25.h),

          _Draweritems(
            icon: Icons.settings,
            title: "Settings",
            index: 9,
            selectedIndex: widget.SelectedIndex,
            onTap: () {
              widget.onitemTapped(9);
            },
            isPopupMenu: true,
            popupItems: [
              "Branch Management",
              "College Management",
              "School Management",
              "Particular Management",
            ],
          ),
          SizedBox(height: 25.h),

          // Reports with multi-level popup
          _DraweritemsWithMultiLevel(
            icon: null,
            svgpath: "assets/icon/Reports.png",
            title: "Reports",
            index: 10,
            selectedIndex: widget.SelectedIndex,
            onTap: () {
              widget.onitemTapped(10);
            },
          ),
          SizedBox(height: 25.h),

          _Draweritems(
            icon: null,
            svgpath: "assets/icon/Expense.png",
            title: "Expense",
            index: 11,
            selectedIndex: widget.SelectedIndex,
            onTap: () {
              widget.onitemTapped(11);
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 25.h),

          _Draweritems(
            icon: null,
            svgpath: "assets/icon/Payment.png",
            title: "Payment",
            index: 12,
            selectedIndex: widget.SelectedIndex,
            onTap: () {
              widget.onitemTapped(12);
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 25.h),

          _Draweritems(
            icon: null,
            svgpath: "assets/icon/Request’s.png",
            title: "Request's",
            index: 13,
            selectedIndex: widget.SelectedIndex,
            onTap: () {
              widget.onitemTapped(13);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

// New widget for multi-level popup menu
Widget _DraweritemsWithMultiLevel({
  required IconData? icon,
  String? svgpath,
  required String title,
  required int index,
  required Function() onTap,
  required int selectedIndex,
}) {
  final bool isSelected = selectedIndex == index;

  return Container(
    height: 40.h,
    width: 320.w,
    decoration: BoxDecoration(
      color: isSelected ? AppColors.kPrimaryColor : const Color(0xFF414143),
      borderRadius: BorderRadius.circular(20),
    ),
    child: PopupMenuButton<String>(
      onSelected: (String value) {
        // Handle the selection based on the value
        print("Selected: $value");
        // Add your navigation logic here based on the selected value
      },
      itemBuilder:
          (BuildContext context) => [
            PopupMenuItem<String>(
              value: "Seat Bookings",
              child: Text(
                "Seat Bookings",
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
              ),
            ),
            PopupMenuItem<String>(
              value: "Employee Sale",
              child: Text(
                "Employee Sale",
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
              ),
            ),
            PopupMenuItem<String>(
              value: "Agent College",
              child: Text(
                "Agent College",
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
              ),
            ),
            PopupMenuItem<String>(
              value: "Cancelled Student",
              child: Text(
                "Cancelled Student",
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
              ),
            ),
            // Multi-level Accounts submenu
            PopupMenuItem<String>(
              enabled: false, // Disable selection for parent item
              child: PopupMenuButton<String>(
                onSelected: (String accountValue) {
                  print("Account Selected: $accountValue");
                  // Handle account submenu selection
                },
                itemBuilder:
                    (BuildContext context) => [
                      PopupMenuItem<String>(
                        value: "Accounts",
                        child: Text(
                          "Accounts",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: "College Accounts",
                        child: Text(
                          "College Accounts",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: "Employee Accounts",
                        child: Text(
                          "Employee Accounts",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: "Agent Accounts",
                        child: Text(
                          "Agent Accounts",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                offset: Offset(200, 0), // Position submenu to the right
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Accounts",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          ],
      offset: Offset(40, 30.h),
      child: ListTile(
        leading:
            svgpath != null
                ? Image.asset(
                  svgpath,
                  height: 14.h,
                  width: 14.w,
                  fit: BoxFit.cover,
                  color: Colors.white,
                )
                : Icon(icon, color: Colors.white),
        title: Text(
          title,
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 12),
        ),
        trailing: Icon(Icons.keyboard_arrow_down, color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    ),
  );
}

Widget _Draweritems({
  required IconData? icon,
  String? svgpath,
  required String title,
  required int index,
  required Function() onTap,
  required int selectedIndex,
  bool isPopupMenu = false,
  List<String>? popupItems,
  Function(String)? onPopupSelected,
}) {
  final bool isSelected = selectedIndex == index;
  return Container(
    height: 40.h,
    width: 320.w,
    decoration: BoxDecoration(
      color: isSelected ? AppColors.kPrimaryColor : const Color(0xFF414143),
      borderRadius: BorderRadius.circular(20),
    ),
    child:
        isPopupMenu
            ? PopupMenuButton<String>(
              onSelected: onPopupSelected ?? (String value) {},
              itemBuilder:
                  (BuildContext context) =>
                      popupItems!
                          .map(
                            (String item) => PopupMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          )
                          .toList(),
              offset: Offset(0, 40.h),
              child: ListTile(
                leading:
                    svgpath != null
                        ? Image.asset(
                          svgpath,
                          height: 14.h,
                          width: 14.w,
                          fit: BoxFit.cover,
                          color: Colors.white,
                        )
                        : Icon(icon, color: Colors.white),
                title: Text(
                  title,
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 12),
                ),
                trailing: Icon(Icons.keyboard_arrow_down, color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            )
            : ListTile(
              leading:
                  svgpath != null
                      ? Image.asset(
                        svgpath,
                        height: 14.h,
                        width: 14.w,
                        fit: BoxFit.cover,
                        color: Colors.white,
                      )
                      : Icon(icon, color: Colors.white),
              title: Text(
                title,
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 12),
              ),
              trailing:
                  (title == "Reports" || title == "Settings")
                      ? Icon(Icons.keyboard_arrow_down, color: Colors.white)
                      : null,
              selected: isSelected,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onTap: onTap,
            ),
  );
}
