import 'package:audit_info/utils/FontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart'; // your app colors

Widget tableheadRow(String heading) {
  return Padding(
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
  );
}

TableRow buildTableRow({
  String? id,
  String? name,
  String? branchName,
  String? phone,
  String? pointAmount,
  required VoidCallback onEdit,
  required VoidCallback onDelete,
  bool showSwitch = false,
  bool switchValue = false,
  ValueChanged<bool>? onToggle,
}) {
  List<Widget> cells = [];

  if (id != null) {
    cells.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Center(child: Text(id, style: FontStyles.body)),
      ),
    );
  }

  if (name != null) {
    cells.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Center(child: Text(name, style: FontStyles.body)),
      ),
    );
  }

  if (branchName != null) {
    cells.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Center(child: Text(branchName, style: FontStyles.body)),
      ),
    );
  }

  if (phone != null) {
    cells.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Center(child: Text(phone, style: FontStyles.body)),
      ),
    );
  }

  if (pointAmount != null) {
    cells.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Center(child: Text(pointAmount, style: FontStyles.body)),
      ),
    );
  }

  cells.add(
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Center(
        child:
            showSwitch
                ? Transform.scale(
                  scale: 0.65,
                  child: Switch(
                    value: switchValue,
                    onChanged: onToggle,
                    activeColor: Colors.white,
                    activeTrackColor: const Color(0xFF28AC24),
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey[400],
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                )
                : const SizedBox(),
      ),
    ),
  );

  cells.add(
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 25.w,
            height: 25.h,
            decoration: BoxDecoration(
              color: const Color(0xFF4A60E4),
              borderRadius: BorderRadius.circular(4),
            ),
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: onEdit,
              child: Icon(Icons.edit, color: Colors.white, size: 16.sp),
            ),
          ),
          SizedBox(width: 6.w),
          Container(
            width: 25.w,
            height: 25.h,
            decoration: BoxDecoration(
              color: const Color(0xFFFF4C4C),
              borderRadius: BorderRadius.circular(4),
            ),
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: onDelete,
              child: Icon(
                Icons.delete_outline,
                color: Colors.white,
                size: 16.sp,
              ),
            ),
          ),
        ],
      ),
    ),
  );

  return TableRow(children: cells);
}
