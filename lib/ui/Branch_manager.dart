import 'package:audit_info/utils/colors.dart';
import 'package:audit_info/utils/customDrawer.dart';
import 'package:audit_info/utils/updatepass_sheet.dart';
import 'package:flutter/material.dart';
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
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: Icon(Icons.menu, color: kPrimaryColor),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
        ),

        title: Text(
          "Branch Manager",
          style: TextStyle(color: ktextcolor, fontSize: 14),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  ModalBottomSheetRoute(
                    builder: (context) => UpdatepassSheet(),
                    isScrollControlled: true,
                  ),
                );
              },
              child: Container(
                height: 20.h,
                width: 66.w,
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  "update\npassword",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 9),
                ),
              ),
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout_rounded, color: Color(0xFF414143)),
          ),
        ],
      ),

      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            SizedBox(height: 30.h),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: ktextcolor),
                hintText: "search",
                hintStyle: TextStyle(color: ktextcolor),

                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
                fillColor: kcontainer,
                filled: true,
              ),
            ),
            SizedBox(height: 21.h),

            Padding(
              padding: const EdgeInsets.only(left: 331),
              child: GestureDetector(
                onTap: () {
                  opendialog(context);
                },
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Icon(Icons.folder, size: 40, color: Colors.orange),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 10,
                      child: Icon(Icons.add, size: 14, color: Colors.orange),
                    ),
                  ],
                ),
              ),
            ),

            // SvgPicture.asset(
            //   'assets/icon/Vector.svg', // your custom icon path
            //   width: 40,
            // ),
            SizedBox(height: 20.h),

            Container(
              height: 30.h,
              width: 350.w,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: kBorderColor),
                color: kcontainer,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                "  Branch Manager",
                style: GoogleFonts.inter(fontSize: 10, color: ktextcolor),
              ),
            ),
            Container(
              height: 30.h,
              width: 350.w,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: kBorderColor),
              ),

              child: Table(
                border: TableBorder.all(width: 1, color: kBorderColor),
                children: [
                  TableRow(
                    decoration: BoxDecoration(color: Color(0xFFF5CEB8)),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "ID",
                          style: GoogleFonts.inter(
                            color: ktextcolor,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      SizedBox(width: 152.w),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Status",
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            color: ktextcolor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Actions",
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            color: ktextcolor,
                          ),
                        ),
                      ),
                    ],
                  ),

                  TableRow(
                    decoration: BoxDecoration(color: kcontainer),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "677655",
                          style: GoogleFonts.inter(
                            color: ktextcolor,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      SizedBox(width: 152.w),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.toggle_on, color: Colors.green),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.edit_square),
                            SizedBox(width: 8),
                            Icon(Icons.delete),
                          ],
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    decoration: BoxDecoration(color: kcontainer),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "677656",
                          style: GoogleFonts.inter(
                            color: ktextcolor,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      SizedBox(width: 152.w),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.toggle_on, color: Colors.green),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.edit_square),
                            SizedBox(width: 8),
                            Icon(Icons.delete),
                          ],
                        ),
                      ),
                    ],
                  ),

                  TableRow(
                    decoration: BoxDecoration(color: kcontainer),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "677657",
                          style: GoogleFonts.inter(
                            color: ktextcolor,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      SizedBox(width: 152.w),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.toggle_on, color: Colors.green),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.edit_square),
                            SizedBox(width: 8),
                            Icon(Icons.delete),
                          ],
                        ),
                      ),
                    ],
                  ),

                  TableRow(
                    decoration: BoxDecoration(color: kcontainer),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "677658",
                          style: GoogleFonts.inter(
                            color: ktextcolor,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      SizedBox(width: 152.w),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.toggle_on, color: Colors.green),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.edit_square),
                            SizedBox(width: 8),
                            Icon(Icons.delete),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> opendialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) {
      return Column(
        children: [
          Text(
            "Create New Branch Manager",
            style: GoogleFonts.inter(fontSize: 14),
          ),
          SizedBox(height: 28.h),
        ],
      );
    },
  );
}

Widget _textfield({required String title, required String subtitle}) {
  return Column(
    children: [
      RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          children: [
            TextSpan(
              text: '*  ',
              style: GoogleFonts.inter(color: Colors.red, fontSize: 12),
            ),

            TextSpan(
              text: title,
              style: GoogleFonts.inter(color: Colors.black, fontSize: 12),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: subtitle,
            hintStyle: GoogleFonts.inter(fontSize: 12, color: kBorderColor),
            fillColor: Colors.white,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ),
    ],
  );
}
