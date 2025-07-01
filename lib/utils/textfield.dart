import 'package:audit_info/utils/FontStyle.dart';
import 'package:audit_info/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget fullTextField({
  required String title,
  TextEditingController? controller,
  TextInputType? keyboardType,
  bool isPassword = false,
  IconData? icon,
  VoidCallback? onTap,
  double? width,
  String? Function(String?)? validator,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: FontStyles.body),
      SizedBox(height: 8.h),
      SizedBox(
        width: width ?? double.infinity,
        height: 30.h,
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: isPassword,
          onTap: onTap,
          validator: validator,
          inputFormatters:
              title == "Phone Number"
                  ? [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.digitsOnly,
                  ]
                  : [],
          readOnly: onTap != null,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 8.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: AppColors.kBorderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: AppColors.kBorderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: AppColors.kBorderColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.red),
            ),
            suffixIcon: icon != null ? Icon(icon, size: 16.sp) : null,
            hintStyle: GoogleFonts.poppins(
              fontSize: 12.sp,
              color: Color(0xFF868686),
            ),
          ),
          style: GoogleFonts.poppins(fontSize: 12.sp),
        ),
      ),
    ],
  );
}

Widget DropdownField(
  String label,
  String? selectedValue,
  List<String> options,
  String hint,
  Function(String?) onChanged,
  BuildContext context,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: FontStyles.body),
      SizedBox(height: 8.h),
      GestureDetector(
        onTapDown: (TapDownDetails details) async {
          final selected = await showMenu<String>(
            context: context,
            position: RelativeRect.fromLTRB(
              details.globalPosition.dx,
              details.globalPosition.dy,
              MediaQuery.of(context).size.width - details.globalPosition.dx,
              MediaQuery.of(context).size.height - details.globalPosition.dy,
            ),
            items:
                options.map((option) {
                  return PopupMenuItem<String>(
                    value: option,
                    child: Text(
                      option,
                      style: GoogleFonts.poppins(fontSize: 12),
                    ),
                  );
                }).toList(),
            color: Colors.white,
          );

          if (selected != null) {
            onChanged(selected);
          }
        },
        child: Container(
          height: 30.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AppColors.kBorderColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedValue ?? hint,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color:
                      selectedValue == null
                          ? const Color(0xFF868686)
                          : Colors.black,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                size: 16,
                color: AppColors.kTextColor,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
