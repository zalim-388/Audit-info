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
  // Track expanded state for each popup menu
  Map<int, bool> expandedStates = {};
  
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

          // Enhanced Settings with expandable menu
          _ExpandableDrawerItem(
            icon: Icons.settings,
            title: "Settings",
            index: 9,
            selectedIndex: widget.SelectedIndex,
            isExpanded: expandedStates[9] ?? false,
            onTap: () {
              setState(() {
                expandedStates[9] = !(expandedStates[9] ?? false);
              });
              widget.onitemTapped(9);
            },
            subItems: [
              "Branch Management",
              "College Management",
              "School Management",
              "Particular Management",
            ],
            onSubItemTap: (subItem) {
              print("Settings sub-item selected: $subItem");
              // Add navigation logic for settings sub-items
            },
          ),
          SizedBox(height: 25.h),

          // Enhanced Reports with multi-level expandable menu
          _ExpandableDrawerItemWithSubMenu(
            svgpath: "assets/icon/Reports.png",
            title: "Reports",
            index: 10,
            selectedIndex: widget.SelectedIndex,
            isExpanded: expandedStates[10] ?? false,
            onTap: () {
              setState(() {
                expandedStates[10] = !(expandedStates[10] ?? false);
              });
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

// Enhanced expandable drawer item widget
class _ExpandableDrawerItem extends StatelessWidget {
  final IconData? icon;
  final String? svgpath;
  final String title;
  final int index;
  final int selectedIndex;
  final bool isExpanded;
  final VoidCallback onTap;
  final List<String> subItems;
  final Function(String) onSubItemTap;

  const _ExpandableDrawerItem({
    this.icon,
    this.svgpath,
    required this.title,
    required this.index,
    required this.selectedIndex,
    required this.isExpanded,
    required this.onTap,
    required this.subItems,
    required this.onSubItemTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectedIndex == index;
    
    return Column(
      children: [
        Container(
          height: 40.h,
          width: 320.w,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.kPrimaryColor : const Color(0xFF414143),
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            leading: svgpath != null
                ? Image.asset(
                    svgpath!,
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
            trailing: AnimatedRotation(
              turns: isExpanded ? 0.5 : 0.0,
              duration: Duration(milliseconds: 200),
              child: Icon(
                isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onTap: onTap,
          ),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: isExpanded ? (subItems.length * 50.0) : 0,
          child: AnimatedOpacity(
            opacity: isExpanded ? 1.0 : 0.0,
            duration: Duration(milliseconds: 300),
            child: Column(
              children: subItems.map((subItem) => 
                Container(
                  margin: EdgeInsets.only(left: 20.w, top: 5.h),
                  height: 40.h,
                  width: 300.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFF525254),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.subdirectory_arrow_right, color: Colors.white70, size: 16),
                    title: Text(
                      subItem,
                      style: GoogleFonts.poppins(color: Colors.white70, fontSize: 11),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    onTap: () => onSubItemTap(subItem),
                  ),
                ),
              ).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

// Enhanced Reports expandable item with nested sub-menu
class _ExpandableDrawerItemWithSubMenu extends StatefulWidget {
  final IconData? icon;
  final String? svgpath;
  final String title;
  final int index;
  final int selectedIndex;
  final bool isExpanded;
  final VoidCallback onTap;

  const _ExpandableDrawerItemWithSubMenu({
    this.icon,
    this.svgpath,
    required this.title,
    required this.index,
    required this.selectedIndex,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  State<_ExpandableDrawerItemWithSubMenu> createState() => _ExpandableDrawerItemWithSubMenuState();
}

class _ExpandableDrawerItemWithSubMenuState extends State<_ExpandableDrawerItemWithSubMenu> {
  bool isAccountsExpanded = false;

  @override
  Widget build(BuildContext context) {
    final bool isSelected = widget.selectedIndex == widget.index;
    
    return Column(
      children: [
        Container(
          height: 40.h,
          width: 320.w,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.kPrimaryColor : const Color(0xFF414143),
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            leading: widget.svgpath != null
                ? Image.asset(
                    widget.svgpath!,
                    height: 14.h,
                    width: 14.w,
                    fit: BoxFit.cover,
                    color: Colors.white,
                  )
                : Icon(widget.icon, color: Colors.white),
            title: Text(
              widget.title,
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 12),
            ),
            trailing: AnimatedRotation(
              turns: widget.isExpanded ? 0.5 : 0.0,
              duration: Duration(milliseconds: 200),
              child: Icon(
                widget.isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onTap: widget.onTap,
          ),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: widget.isExpanded ? null : 0,
          child: AnimatedOpacity(
            opacity: widget.isExpanded ? 1.0 : 0.0,
            duration: Duration(milliseconds: 300),
            child: widget.isExpanded ? Column(
              children: [
                // Regular report items
                _buildSubMenuItem("Seat Bookings"),
                _buildSubMenuItem("Employee Sale"),
                _buildSubMenuItem("Agent College"),
                _buildSubMenuItem("Cancelled Student"),
                
                // Accounts expandable sub-menu
                Container(
                  margin: EdgeInsets.only(left: 20.w, top: 5.h),
                  width: 300.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFF525254),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 40.h,
                        child: ListTile(
                          leading: Icon(Icons.subdirectory_arrow_right, color: Colors.white70, size: 16),
                          title: Text(
                            "Accounts",
                            style: GoogleFonts.poppins(color: Colors.white70, fontSize: 11),
                          ),
                          trailing: AnimatedRotation(
                            turns: isAccountsExpanded ? 0.5 : 0.0,
                            duration: Duration(milliseconds: 200),
                            child: Icon(
                              isAccountsExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                              color: Colors.white70,
                              size: 16,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          onTap: () {
                            setState(() {
                              isAccountsExpanded = !isAccountsExpanded;
                            });
                          },
                        ),
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: isAccountsExpanded ? null : 0,
                        child: AnimatedOpacity(
                          opacity: isAccountsExpanded ? 1.0 : 0.0,
                          duration: Duration(milliseconds: 300),
                          child: isAccountsExpanded ? Column(
                            children: [
                              _buildNestedSubMenuItem("Accounts"),
                              _buildNestedSubMenuItem("College Accounts"),
                              _buildNestedSubMenuItem("Employee Accounts"),
                              _buildNestedSubMenuItem("Agent Accounts"),
                            ],
                          ) : SizedBox.shrink(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ) : SizedBox.shrink(),
          ),
        ),
      ],
    );
  }

  Widget _buildSubMenuItem(String title) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, top: 5.h),
      height: 40.h,
      width: 300.w,
      decoration: BoxDecoration(
        color: const Color(0xFF525254),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(Icons.subdirectory_arrow_right, color: Colors.white70, size: 16),
        title: Text(
          title,
          style: GoogleFonts.poppins(color: Colors.white70, fontSize: 11),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onTap: () {
          print("Report item selected: $title");
          // Add navigation logic for report items
        },
      ),
    );
  }

  Widget _buildNestedSubMenuItem(String title) {
    return Container(
      margin: EdgeInsets.only(left: 15.w, top: 2.h),
      height: 35.h,
      decoration: BoxDecoration(
        color: const Color(0xFF636365),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(Icons.circle, color: Colors.white60, size: 8),
        title: Text(
          title,
          style: GoogleFonts.poppins(color: Colors.white60, fontSize: 10),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onTap: () {
          print("Nested account item selected: $title");
          // Add navigation logic for nested account items
        },
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
    child: ListTile(
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
        style: GoogleFonts.poppins(color: Colors.white, fontSize: 12),
      ),
      selected: isSelected,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onTap: onTap,
    ),
  );
}