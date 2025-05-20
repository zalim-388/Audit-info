import 'dart:ui';

import 'package:audit_info/utils/colors.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class FontStyles {
  
  static TextStyle heading = GoogleFonts.poppins(fontSize: 14,
  fontWeight: FontWeight.bold,
  

  color: AppColors.kTextColor
  );
  static TextStyle bold = GoogleFonts.poppins(fontWeight: FontWeight.bold);
  static TextStyle body = GoogleFonts.poppins(
    fontSize: 12,
    color: AppColors.kTextColor,
  );
}
