import 'package:audit_info/utils/FontStyle.dart' show FontStyles;
import 'package:audit_info/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdatepassSheet extends StatefulWidget {
  const UpdatepassSheet({super.key});

  @override
  State<UpdatepassSheet> createState() => _UpdatepassSheetState();
}

class _UpdatepassSheetState extends State<UpdatepassSheet> {
  bool _showPassword = false;
  bool _showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 286.h,
      width: 386.w,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 37),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 38.h),
              Text("password", style: FontStyles.body),
              SizedBox(height: 19.h),

              /// Password field
              SizedBox(
                height: 30.h,
                width: 324.w,
                child: TextField(
                  obscureText: !_showPassword,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 12.w,
                    ),
                    filled: true,
                    fillColor: Colors.white,

                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      icon: Icon(
                        _showPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.h),

              /// Confirm password label
              Text("Confirm password", style: FontStyles.body),
              SizedBox(height: 28.h),

              SizedBox(
                height: 30.h,
                width: 324.w,
                child: TextField(
                  obscureText: !_showConfirmPassword,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                    filled: true,
                    fillColor: Colors.white,

                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _showConfirmPassword = !_showConfirmPassword;
                        });
                      },
                      icon: Icon(
                        size: 18,
                        _showConfirmPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.h),

              Container(
                height: 30.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.kPrimaryColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Update",
                  style: GoogleFonts.poppins(fontSize: 10, color: Colors.white),
                ),
              ),
              SizedBox(height: 38.h),
            ],
          ),
        ),
      ),
    );
  }
}
