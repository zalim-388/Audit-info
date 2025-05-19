import 'package:audit_info/ui/Dashboard.dart';
import 'package:audit_info/utils/FontStyle.dart';
import 'package:audit_info/utils/colors.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 46),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 149.h),
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

                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment:
                        showDropdown
                            ? CrossAxisAlignment.center
                            : CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 19.h),
                      Text("Position", style: FontStyles.body),

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showDropdown = !showDropdown;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 6,
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
                      SizedBox(height: 8.h),
                      if (showDropdown)
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: AppColors.kBorderColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              ...[
                                'Admin',
                                'Manager',
                                'SRC',
                                'SRO',
                                'Accountant',
                                'Administrator',
                              ].map((item) {
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedItem = item;
                                          showDropdown = false;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 14,
                                          horizontal: 24,
                                        ),
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                item,
                                                style: FontStyles.body,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    if (item != 'Administrator')
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 24,
                                        ),
                                        child: Divider(
                                          color: Colors.grey.shade300,
                                          height: 0,
                                        ),
                                      ),
                                  ],
                                );
                              }).toList(),
                            ],
                          ),
                        ),

                      if (selectedItem != null) ...[
                        SizedBox(height: 10.h),
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
                              horizontal: 15,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: AppColors.kBorderColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: AppColors.kBorderColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Password", style: FontStyles.body),
                        ),
                        SizedBox(height: 4.h),
                        TextField(
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 15,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: AppColors.kBorderColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: AppColors.kBorderColor,
                              ),
                            ),
                          ),
                          obscureText: true,
                        ),
                      ],
                    ],
                  ),
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
                    width: 298.w,
                    // width: double.infinity,
                    height: 38,
                    decoration: BoxDecoration(
                      color: Color(0xFFF58C1F),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
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
