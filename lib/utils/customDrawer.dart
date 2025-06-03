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
  // Add state variable to track menu level
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
            svgpath: "assets/icon/Request's.png",
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
  State<DrawerItemWithMultiLevel> createState() =>
      _DrawerItemWithMultiLevelState();
}

class _DrawerItemWithMultiLevelState extends State<DrawerItemWithMultiLevel> {
  ReportsPopupPage _currentPage = ReportsPopupPage.main;
  final _popupMenuKey = GlobalKey<PopupMenuButtonState<String>>();

  // Main Menu Items
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

  // Sub Menu Items (Accounts)
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

  // Reusable Popup Item
  PopupMenuItem<String> _popupItem(String value, String label) {
    return PopupMenuItem<String>(value: value, child: Text(label));
  }

  // Selection Logic
  void _handleSelection(String value) {
    if (value == 'show_accounts_submenu') {
      setState(() => _currentPage = ReportsPopupPage.accounts);
      _reopenMenu();
    } else if (value == 'back_to_reports_main') {
      setState(() => _currentPage = ReportsPopupPage.main);
      _reopenMenu();
    } else {
      // handle your item taps here
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
      child: PopupMenuButton<String>(
        key: _popupMenuKey,
        tooltip: "Show Reports Options",
        offset: Offset(40, 30.h),
        onSelected: _handleSelection,
        onCanceled: () => setState(() => _currentPage = ReportsPopupPage.main),
        itemBuilder:
            (_) =>
                _currentPage == ReportsPopupPage.accounts
                    ? _buildAccountItems()
                    : _buildMainItems(),
        child: ListTile(
          leading:
              widget.svgpath != null
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
          trailing: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
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
              onSelected:
                  onPopupSelected ??
                  (String value) {
                    print("Selected: $value");
                  },
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

// enum ReportPopupPage{ main, accounts }
// Widget _DraweritemsWithMultiLevell({
//   required IconData? icon,
//   String? svgpath,
//   required String title,
//   required int index,
//   required Function() onTap,
//   required int selectedIndex,
//   required bool showSubMenu,
//   required Function(bool) onSubMenuToggle,
// }) {
//   final bool isSelected = selectedIndex == index;
//  ReportPopupPage _currentPage = ReportPopupPage.main;


//   return Container(
//     height: 40.h,
//     width: 320.w,
//     decoration: BoxDecoration(
//       color: isSelected ? AppColors.kPrimaryColor : const Color(0xFF414143),
//       borderRadius: BorderRadius.circular(20),
//     ),
//     child: PopupMenuButton<String>(
//       onSelected: (String value) {
//         print("Selected: $value");

//         if (value == "Accounts") {
//           onSubMenuToggle(!showSubMenu);
//         } else if (value == "Back") {
//           onSubMenuToggle(false);
//         } else {
//           onSubMenuToggle(false);
//           // Add your navigation logic here based on the selected value
//           print("Navigating to: $value");
//         }
//       },
//       itemBuilder: (BuildContext context) => showSubMenu ? [
//         // Submenu items for Accounts
//         PopupMenuItem<String>(
//           value: "College Accounts",
//           child: Text(
//             "College Accounts",
//             style: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
//           ),
//         ),
//         PopupMenuItem<String>(
//           value: "Employee Accounts",
//           child: Text(
//             "Employee Accounts",
//             style: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
//           ),
//         ),
//         PopupMenuItem<String>(
//           value: "Agent Accounts",
//           child: Text(
//             "Agent Accounts",
//             style: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
//           ),
//         ),
//         PopupMenuItem<String>(
//           value: "Back",
//           child: Row(
//             children: [
//               Icon(Icons.arrow_back, color: Colors.black, size: 16),
//               SizedBox(width: 8),
//               Text(
//                 "Back",
//                 style: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
//               ),
//             ],
//           ),
//         ),
//       ] : [
//         // Main menu items
//         PopupMenuItem<String>(
//           value: "Seat Bookings",
//           child: Text(
//             "Seat Bookings",
//             style: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
//           ),
//         ),
//         PopupMenuItem<String>(
//           value: "Employee Sale",
//           child: Text(
//             "Employee Sale",
//             style: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
//           ),
//         ),
//         PopupMenuItem<String>(
//           value: "Agent College",
//           child: Text(
//             "Agent College",
//             style: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
//           ),
//         ),
//         PopupMenuItem<String>(
//           value: "Cancelled Student",
//           child: Text(
//             "Cancelled Student",
//             style: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
//           ),
//         ),
//         PopupMenuItem<String>(
//           value: "Accounts",
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Accounts",
//                 style: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
//               ),
//               Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 16),
//             ],
//           ),
//         ),
//       ],
//       offset: Offset(40, 30.h),
//       child: ListTile(
//         leading: svgpath != null
//             ? Image.asset(
//                 svgpath,
//                 height: 14.h,
//                 width: 14.w,
//                 fit: BoxFit.cover,
//                 color: Colors.white,
//               )
//             : Icon(icon, color: Colors.white),
//         title: Text(
//           title,
//           style: GoogleFonts.poppins(color: Colors.white, fontSize: 12),
//         ),
//         trailing: Icon(Icons.keyboard_arrow_down, color: Colors.white),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       ),
//     ),
//   );
// }