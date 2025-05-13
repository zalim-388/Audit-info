import 'package:audit_info/ui/Branch_manager.dart';
import 'package:audit_info/ui/Dashboard.dart';
import 'package:audit_info/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Customdrawer extends StatelessWidget {
  final int SelectedIndex;
  final Function(int) onitemTapped;
  const Customdrawer({
    super.key,
    required this.onitemTapped,
    required this.SelectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.transparent),

            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Container(
                width: 216.w,
                height: 79.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/image/Artboard-1 1.png",
                  height: 190.h,
                ),
              ),
            ),
          ),

          _Draweritems(
            icon: null,
            svgpath: "assets/icon/Dashbord.png",
            title: 'Dashboard',
            index: 0,
            selectedIndex: SelectedIndex,
            onTap: () {
              onitemTapped(0);
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
              );
            },
          ),

          SizedBox(height: 2.h),
          _Draweritems(
            icon: null,
            svgpath: "assets/icon/Branch Manager.png",
            title: 'Branch Manager',
            index: 1,
            selectedIndex: SelectedIndex,
            onTap: () {
              onitemTapped(2);
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => BranchManager()),
              );
            },
          ),
          SizedBox(height: 2.h),

          _Draweritems(
            svgpath: "assets/icon/Accountant.png",
            title: "Accountant",
            index: 2,
            onTap: () {
              onitemTapped(2);
            },
            selectedIndex: SelectedIndex,
            icon: null,
          ),
          SizedBox(height: 2.h),
          _Draweritems(
            icon: null,
            svgpath: 'assets/icon/SRC.png',
            title: 'SRC',
            index: 3,
            selectedIndex: SelectedIndex,
            onTap: () {
              onitemTapped(3);
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 2.h),
          _Draweritems(
            icon: null,
            svgpath: "assets/icon/SRO.png",
            title: "SRO",
            index: 4,
            onTap: () {
              onitemTapped(4);
              Navigator.pop(context);
            },

            selectedIndex: SelectedIndex,
          ),
          SizedBox(height: 2.h),
          _Draweritems(
            icon: null,
            svgpath: "assets/icon/Office Administration.png",
            title: "Office Administration",
            index: 5,
            onTap: () {
              onitemTapped(5);
              Navigator.pop(context);
            },
            selectedIndex: SelectedIndex,
          ),
          SizedBox(height: 2.h),
          _Draweritems(
            icon: null,
            svgpath: "assets/icon/Agent.png",
            title: "Agent",
            index: 6,
            onTap: () {
              onitemTapped(6);
              Navigator.pop(context);
            },
            selectedIndex: SelectedIndex,
          ),
          SizedBox(height: 2.h),
          _Draweritems(
            icon: null,
            svgpath: "assets/icon/Lead Management.png",

            title: "Lead Management",
            index: 7,
            onTap: () {
              onitemTapped(7);
              Navigator.pop(context);
            },
            selectedIndex: SelectedIndex,
          ),
          SizedBox(height: 2.h),
          _Draweritems(
            icon: null,
            svgpath: "assets/icon/Student Management.png",
            title: "Student Management",
            index: 8,
            onTap: () {
              onitemTapped(8);
              Navigator.pop(context);
            },
            selectedIndex: SelectedIndex,
          ),
          SizedBox(height: 2.h),
          _Draweritems(
            icon: null,
            svgpath: "assets/icon/settings.png",
            title: "Settings",
            index: 9,
            onTap: () {
              onitemTapped(9);
              Navigator.pop(context);
            },
            selectedIndex: SelectedIndex,
          ),
          SizedBox(height: 2.h),
          _Draweritems(
            icon: null,
            svgpath: "assets/icon/Reports.png",
            title: "Reports",
            index: 10,
            onTap: () {
              onitemTapped(10);
              Navigator.pop(context);
            },
            selectedIndex: SelectedIndex,
          ),
          SizedBox(height: 2.h),
          _Draweritems(
            icon: null,
            svgpath: "assets/icon/Expense.png",
            title: "Expense",
            index: 11,
            onTap: () {
              onitemTapped(11);
              Navigator.pop(context);
            },
            selectedIndex: SelectedIndex,
          ),
          SizedBox(height: 2.h),
          _Draweritems(
            icon: null,
            svgpath: "assets/icon/Payment.png",
            title: "Payment",
            index: 12,
            onTap: () {
              onitemTapped(12);
              Navigator.pop(context);
            },
            selectedIndex: SelectedIndex,
          ),
          SizedBox(height: 2.h),
          _Draweritems(
            icon: null,
            svgpath: "assets/icon/Request’s.png",
            title: "Request's",
            index: 13,
            onTap: () {
              onitemTapped(13);
              Navigator.pop(context);
            },
            selectedIndex: SelectedIndex,
          ),
        ],
      ),
    );
  }
}

Widget _Draweritems({
  required IconData? icon,
  String? svgpath,
  required String title,
  required int index,
  required Function() onTap,
  required int selectedIndex,
}) {
  final bool isSelected = selectedIndex == index;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 6),
    child: Container(
      height: 48.h,
      width: 216.w,
      decoration: BoxDecoration(
        color: isSelected ? kPrimaryColor : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
      child: ListTile(
        leading:
            svgpath != null
                ? Image.asset(
                  svgpath,
                  height: 24.h,
                  width: 24.w,
                  fit: BoxFit.cover,
                  color: Color(0x80000000),
                )
                : Icon(
                  icon,
                  color: isSelected ? Colors.white : const Color(0xBF000000),
                ),
        title: Text(
          title,
          style: GoogleFonts.inter(
            color: isSelected ? Colors.white : const Color(0xBF000000),
            fontSize: 14.sp,
          ),
        ),
        trailing:
            (title == "Reports" || title == "Settings")
                ? Icon(
                  Icons.keyboard_arrow_down,
                  color: isSelected ? Colors.white : const Color(0xBF000000),
                )
                : null,
        selected: isSelected,
        selectedTileColor: kPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        onTap: onTap,
      ),
    ),
  );
}
