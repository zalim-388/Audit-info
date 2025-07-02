import 'package:audit_info/utils/FontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart'; // your app colors

Widget tableheadRow(String heading,[double? width]) {
  return SizedBox(
    width: width,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        heading,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          fontSize: 10.sp,
          color: AppColors.kTextColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget cell(String text, [double? width]) {
  return SizedBox(
    width: width,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Center(child: Text(text, style: FontStyles.body)),
    ),
  );
}

Widget actionCell(VoidCallback onEdit, VoidCallback onDelete) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onEdit,
          child: Container(
            width: 25.w,
            height: 25.h,
            decoration: BoxDecoration(
              color: const Color(0xFF4A60E4),
              borderRadius: BorderRadius.circular(4),
            ),
            alignment: Alignment.center,
            child: Icon(Icons.edit, color: Colors.white, size: 16.sp),
          ),
        ),
        SizedBox(width: 6.w),
        GestureDetector(
          onTap: onDelete,
          child: Container(
            width: 25.w,
            height: 25.h,
            decoration: BoxDecoration(
              color: const Color(0xFFFF4C4C),
              borderRadius: BorderRadius.circular(4),
            ),
            alignment: Alignment.center,
            child: Icon(Icons.delete_outline, color: Colors.white, size: 16.sp),
          ),
        ),
      ],
    ),
  );
}
