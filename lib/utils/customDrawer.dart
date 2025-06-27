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

  // Navigation methods for Settings
  void _navigateToBranchManagement() {
    Navigator.pop(context);
    // Navigator.push(context, MaterialPageRoute(builder: (context) => BranchManagementPage()));
    print("Navigate to Branch Management");
  }

  void _navigateToCollegeManagement() {
    Navigator.pop(context);
    // Navigator.push(context, MaterialPageRoute(builder: (context) => CollegeManagementPage()));
    print("Navigate to College Management");
  }

  void _navigateToSchoolManagement() {
    Navigator.pop(context);
    // Navigator.push(context, MaterialPageRoute(builder: (context) => SchoolManagementPage()));
    print("Navigate to School Management");
  }

  void _navigateToParticularManagement() {
    Navigator.pop(context);
    // Navigator.push(context, MaterialPageRoute(builder: (context) => ParticularManagementPage()));
    print("Navigate to Particular Management");
  }

  // Navigation methods for Reports
  void _navigateToSeatBookings() {
    Navigator.pop(context);
    // Navigator.push(context, MaterialPageRoute(builder: (context) => SeatBookingsPage()));
    print("Navigate to Seat Bookings");
  }

  void _navigateToEmployeeSale() {
    Navigator.pop(context);
    // Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeSalePage()));
    print("Navigate to Employee Sale");
  }

  void _navigateToAgentCollege() {
    Navigator.pop(context);
    // Navigator.push(context, MaterialPageRoute(builder: (context) => AgentCollegePage()));
    print("Navigate to Agent College");
  }

  void _navigateToCancelledStudent() {
    Navigator.pop(context);
    // Navigator.push(context, MaterialPageRoute(builder: (context) => CancelledStudentPage()));
    print("Navigate to Cancelled Student");
  }

  void _navigateToAccountsDetail() {
    Navigator.pop(context);
    // Navigator.push(context, MaterialPageRoute(builder: (context) => AccountsDetailPage()));
    print("Navigate to Accounts Detail");
  }

  void _navigateToCollegeAccounts() {
    Navigator.pop(context);
    // Navigator.push(context, MaterialPageRoute(builder: (context) => CollegeAccountsPage()));
    print("Navigate to College Accounts");
  }

  void _navigateToEmployeeAccounts() {
    Navigator.pop(context);
    // Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeAccountsPage()));
    print("Navigate to Employee Accounts");
  }

  void _navigateToAgentAccounts() {
    Navigator.pop(context);
    // Navigator.push(context, MaterialPageRoute(builder: (context) => AgentAccountsPage()));
    print("Navigate to Agent Accounts");
  }

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
            },
            isPopupMenu: true,
            popupItems: [
              "Branch Management",
              "College Management",
              "School Management",
              "Particular Management",
            ],
            showDividers: true,
            onPopupSelected: (String value) {
              switch (value) {
                case "Branch Management":
                  _navigateToBranchManagement();
                  break;
                case "College Management":
                  _navigateToCollegeManagement();
                  break;
                case "School Management":
                  _navigateToSchoolManagement();
                  break;
                case "Particular Management":
                  _navigateToParticularManagement();
                  break;
              }
            },
          ),
          SizedBox(height: 25.h),

          DrawerItemWithMultiLevel(
            icon: null,
            svgpath: "assets/icon/Reports.png",
            title: "Reports",
            index: 10,
            onBaseItemTap: () {
              setState(() {
                showSubMenu = !showSubMenu;
              });
            },
            selectedIndex: widget.SelectedIndex,
            onReportSelected: (String value) {
              switch (value) {
                case 'seat_bookings':
                  _navigateToSeatBookings();
                  break;
                case 'employee_sale':
                  _navigateToEmployeeSale();
                  break;
                case 'agent_college':
                  _navigateToAgentCollege();
                  break;
                case 'cancelled_student':
                  _navigateToCancelledStudent();
                  break;
                case 'accounts_detail_main':
                  _navigateToAccountsDetail();
                  break;
                case 'college_accounts_report':
                  _navigateToCollegeAccounts();
                  break;
                case 'employee_accounts_report':
                  _navigateToEmployeeAccounts();
                  break;
                case 'agent_accounts_report':
                  _navigateToAgentAccounts();
                  break;
              }
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
  final Function(String)? onReportSelected;

  const DrawerItemWithMultiLevel({
    super.key,
    this.icon,
    this.svgpath,
    required this.title,
    required this.index,
    required this.selectedIndex,
    required this.onBaseItemTap,
    this.onReportSelected,
  });

  @override
  State<DrawerItemWithMultiLevel> createState() =>
      _DrawerItemWithMultiLevelState();
}

class _DrawerItemWithMultiLevelState extends State<DrawerItemWithMultiLevel> {
  ReportsPopupPage _currentPage = ReportsPopupPage.main;
  final _popupMenuKey = GlobalKey<PopupMenuButtonState<String>>();

  List<PopupMenuEntry<String>> _buildMainItems() {
    return [
      _popupItem('seat_bookings', 'Seat Bookings'),
      PopupMenuDivider(height: 1), // Set consistent divider height
      _popupItem('employee_sale', 'Employee Sale'),
      PopupMenuDivider(height: 1),
      _popupItem('agent_college', 'Agent College'),
      PopupMenuDivider(height: 1),
      _popupItem('cancelled_student', 'Cancelled Student'),
      PopupMenuDivider(height: 1),
      PopupMenuItem<String>(
        value: 'show_accounts_submenu',
        height: 33.h, // Consistent height
        padding: EdgeInsets.zero, // Remove default padding
        child: Container(
          height: 33.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
          ), // Add consistent padding
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Accounts',
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
              ),
              Icon(Icons.keyboard_arrow_down, color: Colors.black54),
            ],
          ),
        ),
      ),
    ];
  }

  List<PopupMenuEntry<String>> _buildAccountItems() {
    return [
      PopupMenuItem<String>(
        value: 'back_to_reports_main',
        height: 33.h,
        padding: EdgeInsets.zero,
        child: Container(
          height: 33.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Accounts',
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
              ),
              Icon(Icons.keyboard_arrow_up, color: Colors.black54),
            ],
          ),
        ),
      ),
      PopupMenuDivider(height: 1),
      _popupItem('accounts_detail_main', 'Accounts Detail'),
      PopupMenuDivider(height: 1),
      _popupItem('college_accounts_report', 'College Accounts'),
      PopupMenuDivider(height: 1),
      _popupItem('employee_accounts_report', 'Employee Accounts'),
      PopupMenuDivider(height: 1),
      _popupItem('agent_accounts_report', 'Agent Accounts'),
    ];
  }

  PopupMenuItem<String> _popupItem(String value, String text) {
    return PopupMenuItem<String>(
      value: value,
      height: 33.h,
      padding: EdgeInsets.zero,
      child: Container(
        height: 33.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
        ),
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
      if (widget.onReportSelected != null) {
        widget.onReportSelected!(value);
      }
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
          offset: Offset(70, 20.h),
          onSelected: _handleSelection,
          onCanceled:
              () => setState(() => _currentPage = ReportsPopupPage.main),
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
  bool showDividers = false,
}) {
  final bool isSelected = selectedIndex == index;

  final listTile = ListTile(
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
        (isPopupMenu || title == "Reports" || title == "Settings")
            ? Icon(Icons.keyboard_arrow_down, color: Colors.white)
            : null,
    selected: isSelected,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    onTap: isPopupMenu ? null : onTap,
  );

  return Container(
    height: 40.h,
    width: 320.w,
    decoration: BoxDecoration(
      color: isSelected ? AppColors.kPrimaryColor : const Color(0xFF414143),
      borderRadius: BorderRadius.circular(20),
    ),
    child:
        isPopupMenu
            ? Theme(
              data: ThemeData(
                cardColor: Colors.white,
                popupMenuTheme: PopupMenuThemeData(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: PopupMenuButton<String>(
                onSelected:
                    onPopupSelected ??
                    (String value) => print("Selected: $value"),
                itemBuilder: (context) {
                  List<PopupMenuEntry<String>> items = [];
                  for (int i = 0; i < popupItems!.length; i++) {
                    items.add(
                      PopupMenuItem<String>(
                        value: popupItems[i],
                        height: 33.h,
                        child: Container(
                          height: 33.h,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            popupItems[i],
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    );
                    if (showDividers && i < popupItems.length - 1) {
                      items.add(const PopupMenuDivider());
                    }
                  }
                  return items;
                },
                offset: Offset(70, 10.h),
                child: listTile,
              ),
            )
            : listTile,
  );
}
