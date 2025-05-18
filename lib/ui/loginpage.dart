import 'package:audit_info/ui/Dashboard.dart';
import 'package:audit_info/utils/FontStyle.dart';
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
  bool showDropdown = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 176.h),
              Image.asset("assets/image/Artboard-1 1.png", height: 190.h),
              SizedBox(height: 47.h),

              Container(
                width: 298.w,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 15,
                      spreadRadius: 5,
                      color: Colors.grey.withOpacity(0.1),
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    Text(
                      "Position",
                      style: FontStyles.body,
                      textAlign: TextAlign.start,
                    ),

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showDropdown = !showDropdown;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 13,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(color: Color(0xFFCECECE)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedItem ?? "Select Your Position",
                              style: FontStyles.body,
                            ),
                            selectedItem != null
                                ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedItem = null;
                                      showDropdown = false;
                                    });
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    color: Color(0xFFD9D9D9),
                                  ),
                                )
                                : showDropdown
                                ? Icon(Icons.keyboard_arrow_up)
                                : Icon(Icons.keyboard_arrow_down_outlined),
                          ],
                        ),
                      ),
                    ),

                    if (showDropdown)
                      Column(
                        children: [
                          ...[
                            'Admin',
                            'Manager',
                            'SRC',
                            'SRO',
                            'Accountant',
                            'Administrator',
                          ].map(
                            (item) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedItem = item;
                                  showDropdown = false;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                alignment: Alignment.centerLeft,
                                child: Text(item, style: FontStyles.body),
                              ),
                            ),
                          ),
                        ],
                      ),

                    if (selectedItem != null) ...[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Email", style: FontStyles.body),
                      ),
                      SizedBox(height: 4.h),
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
                      SizedBox(height: 12.h),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Password", style: FontStyles.body),
                      ),
                      SizedBox(height: 4.h),
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
                    ],
                  ],
                ),
              ),
              SizedBox(height: 46.h),
              if (selectedItem != null) ...[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 33,
                    decoration: BoxDecoration(
                      color: Color(0xFFF58C1F),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Login",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 214.h),

                Image.asset(
                  "assets/image/Artboard-1 1 (1).png",
                  fit: BoxFit.cover,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
