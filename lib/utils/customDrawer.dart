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
  bool showSubMenu = false;

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
              Navigator.pop(context);
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
              Navigator.pop(context);
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
              Navigator.pop(context);
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
              Navigator.pop(context);
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
              Navigator.pop(context);
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
              Navigator.pop(context);
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
              Navigator.pop(context);
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
              Navigator.pop(context);
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
          DrawerItemWithMultiLevel(
            icon: null,
            svgpath: "assets/icon/Reports.png",
            title: "Reports",
            index: 10,
            onBaseItemTap: () {
              setState(() {
                showSubMenu;
              });
            },
            selectedIndex: widget.SelectedIndex,
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
          SizedBox(height: 25.h),
        ],
      ),
    );
  }
}

enum ReportsPopupPage { main, accounts }

class DrawerItemWithMultiLevel extends StatefulWidget {
  final IconData? icon;
  final String? svgpath;
  final String title;
  final int index;
  final int selectedIndex;
  final VoidCallback onBaseItemTap;

  const DrawerItemWithMultiLevel({
    super.key,
    this.icon,
    this.svgpath,
    required this.title,
    required this.index,
    required this.selectedIndex,
    required this.onBaseItemTap,
  });

  @override
  State<DrawerItemWithMultiLevel> createState() => _DrawerItemWithMultiLevelState();
}

class _DrawerItemWithMultiLevelState extends State<DrawerItemWithMultiLevel> {
  ReportsPopupPage _currentPage = ReportsPopupPage.main;
  final _popupMenuKey = GlobalKey<PopupMenuButtonState<String>>();

  List<PopupMenuEntry<String>> _buildMainItems() {
    return [
      _popupItem('seat_bookings', 'Seat Bookings'),
      const PopupMenuDivider(),
      _popupItem('employee_sale', 'Employee Sale'),
      const PopupMenuDivider(),
      _popupItem('agent_college', 'Agent College'),
      const PopupMenuDivider(),
      _popupItem('cancelled_student', 'Cancelled Student'),
      const PopupMenuDivider(),
      PopupMenuItem<String>(
        value: 'show_accounts_submenu',
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Accounts'),
            Icon(Icons.keyboard_arrow_down, color: Colors.black54),
          ],
        ),
      ),
    ];
  }

  List<PopupMenuEntry<String>> _buildAccountItems() {
    return [
      PopupMenuItem<String>(
        value: 'back_to_reports_main',
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Accounts'),
            Icon(Icons.keyboard_arrow_up, color: Colors.black54),
          ],
        ),
      ),
      const PopupMenuDivider(),
      _popupItem('accounts_detail_main', 'Accounts Detail'),
      const PopupMenuDivider(),
      _popupItem('college_accounts_report', 'College Accounts'),
      const PopupMenuDivider(),
      _popupItem('employee_accounts_report', 'Employee Accounts'),
      const PopupMenuDivider(),
      _popupItem('agent_accounts_report', 'Agent Accounts'),
    ];
  }

  PopupMenuItem<String> _popupItem(String value, String label) {
    return PopupMenuItem<String>(
      value: value,
      child: SizedBox(
      height: 160.h,
        width: 162.w, 
        child: Text(label),
      ),
    );
  }

  void _handleSelection(String value) {
    if (value == 'show_accounts_submenu') {
      setState(() => _currentPage = ReportsPopupPage.accounts);
      _reopenMenu();
    } else if (value == 'back_to_reports_main') {
      setState(() => _currentPage = ReportsPopupPage.main);
      _reopenMenu();
    } else {
     
    }
  }

  void _reopenMenu() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _popupMenuKey.currentState?.showButtonMenu();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isSelected = widget.selectedIndex == widget.index;

    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.kPrimaryColor : const Color(0xFF414143),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          cardColor: Colors.white,
          popupMenuTheme: PopupMenuThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        child: PopupMenuButton<String>(
          key: _popupMenuKey,
          tooltip: "Show Reports Options",
          offset: Offset(0, 40.h), // Corrected alignment
          onSelected: _handleSelection,
          onCanceled: () => setState(() => _currentPage = ReportsPopupPage.main),
          itemBuilder: (_) =>
              _currentPage == ReportsPopupPage.accounts
                  ? _buildAccountItems()
                  : _buildMainItems(),
          child: ListTile(
            leading: widget.svgpath != null
                ? Image.asset(
                    widget.svgpath!,
                    height: 18.h,
                    width: 18.w,
                    color: Colors.white,
                  )
                : Icon(widget.icon, color: Colors.white, size: 18.h),
            title: Text(
              widget.title,
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 12.sp),
            ),
            trailing: Icon(Icons.keyboard_arrow_down, color: Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            selected: isSelected,
            onTap: () {
              widget.onBaseItemTap();
              _popupMenuKey.currentState?.showButtonMenu();
            },
          ),
        ),
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
  bool isPopupMenu = false,
  List<String>? popupItems,
  Function(String)? onPopupSelected,
}) {
  final bool isSelected = selectedIndex == index;

  final listTile = Row(crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      ListTile(
        leading: svgpath != null
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
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        trailing: (isPopupMenu || title == "Reports" || title == "Settings")
            ? Icon(Icons.keyboard_arrow_down, color: Colors.white)
            : null,
        selected: isSelected,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onTap: isPopupMenu ? null : onTap,
      ),
    ],
  );

  return Container(
    height: 40.h,
    width: 320.w,
    decoration: BoxDecoration(
      color: isSelected ? AppColors.kPrimaryColor : const Color(0xFF414143),
      borderRadius: BorderRadius.circular(20),
    ),
    child: isPopupMenu
        ? PopupMenuButton<String>(
            onSelected: onPopupSelected ?? (String value) => print("Selected: $value"),
            itemBuilder: (context) => popupItems!
                .map((item) => PopupMenuItem<String>(
                      value: item,
                      child: Text(
                        "",
                        style: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
                      ),
                    ))
                .toList(),
            offset: Offset(0, 40.h),
            child: listTile,
          )
        : listTile,
  );
}
