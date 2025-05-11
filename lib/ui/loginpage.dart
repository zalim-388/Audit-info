import 'package:audit_info/ui/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45),
        child: Column(
          children: [
            SizedBox(height: 176.h),
            Image.asset("assets/image/Artboard-1 1.png", height: 190.h),
            // SizedBox(height: 42.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '*  ',
                        style: GoogleFonts.inter(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),

                      TextSpan(
                        text: ' Position',

                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 21.h),
            GestureDetector(
              onTapDown: (TapDownDetails details) async {
                final selected = await showMenu<String>(
                  context: context,
                  position: RelativeRect.fromLTRB(
                    details.globalPosition.dx,
                    details.globalPosition.dy,
                    details.globalPosition.dx,
                    details.globalPosition.dy,
                  ),
                  items:
                      [
                        'Admin',
                        'Manager',
                        'SRC',
                        'SRO',
                        'Accountant',
                        'Administrator',
                      ].map((item) {
                        return PopupMenuItem<String>(
                          value: item,

                          child: Container(
                            height: 24.h,
                            width: 126.w,

                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Color(0xFFD9D9D9)),

                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              item,
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: Color(0xFFD9D9D9),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                  color: Colors.white,
                );

                if (selected != null) {
                  setState(() {
                    selectedItem = selected;
                  });
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 13, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFD9D9D9)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedItem ?? 'Select Position',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        color:
                            selectedItem == null
                                ? Color(0x1A000000)
                                : Colors.black,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Color(0x1A000000),
                      size: 22,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 8.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '*  ',
                        style: GoogleFonts.inter(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),

                      TextSpan(
                        text: ' Email',
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 21.h),

            TextField(
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 13,
                ),
                filled: true,
                fillColor: Color(0xFFE7F1FD),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFFD9D9D9)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFFD9D9D9)),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '*  ',
                        style: GoogleFonts.inter(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),

                      TextSpan(
                        text: ' passwrod',
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 21.h),

            TextField(
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 13,
                ),
                filled: true,
                fillColor: Color(0xFFE7F1FD),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFFD9D9D9)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFFD9D9D9)),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 46.h),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                );
              },
              child: Container(
                width: 312.73,
                height: 33.88,
                decoration: BoxDecoration(
                  color: Color(0xFFF58C1F),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Login",
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 10),
                ),
              ),
            ),

            SizedBox(height: 104.h),

            Image.asset("assets/image/Artboard-1 1 (1).png", fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }
}
