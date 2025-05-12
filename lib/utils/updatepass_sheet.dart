// import 'package:audit_info/utils/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';

// class UpdatepassSheet extends StatelessWidget {
//   const UpdatepassSheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     bool _showPassword = false;
//     bool _showConfirmPassword = false;
//     return Container(
//       height: 286.h,
//       width: 386.w,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 37),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(height: 38.h),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   RichText(
//                     textAlign: TextAlign.start,
//                     text: TextSpan(
//                       children: [
//                         TextSpan(
//                           text: '*  ',
//                           style: GoogleFonts.inter(
//                             color: Colors.red,
//                             fontSize: 12,
//                           ),
//                         ),

//                         TextSpan(
//                           text: ' password',

//                           style: GoogleFonts.inter(
//                             color: Colors.black,
//                             fontSize: 10,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 19.h),

//               TextField(
//                 obscureText: !_showPassword,
//                 decoration: InputDecoration(
//                   isDense: true,
//                   contentPadding: EdgeInsets.symmetric(
//                     vertical: 10.h,
//                     horizontal: 12.w,
//                   ),
//                   filled: true,

//                   fillColor: Colors.white,
//                   hintText: "  password",
//                   hintStyle: GoogleFonts.inter(
//                     fontSize: 10,
//                     color: Color(0x42000000),
//                   ),
//                   suffixIcon: IconButton(
//                     onPressed: () {

//                     },
//                     icon: Icon(
//                       // ignore: dead_code
//                       _showPassword ? Icons.visibility : Icons.visibility_off,
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide(color: Color(0xFFD9D9D9)),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide(color: Color(0xFFD9D9D9)),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 15.h),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   RichText(
//                     textAlign: TextAlign.start,
//                     text: TextSpan(
//                       children: [
//                         TextSpan(
//                           text: '*  ',
//                           style: GoogleFonts.inter(
//                             color: Colors.red,
//                             fontSize: 12,
//                           ),
//                         ),

//                         TextSpan(
//                           text: 'Confirm password',

//                           style: GoogleFonts.inter(
//                             color: Colors.black,
//                             fontSize: 10,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 28.h),
//               TextField(
//                 obscureText: _showConfirmPassword,
//                 decoration: InputDecoration(
//                   isDense: true,
//                   contentPadding: EdgeInsets.symmetric(vertical: 6),
//                   filled: true,

//                   fillColor: Color(0xFFE7F1FD),
//                   hintText: "  Confirm password",
//                   hintStyle: GoogleFonts.inter(
//                     fontSize: 10,
//                     color: Color(0x42000000),
//                   ),
//                   suffixIcon: IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       _showPassword ? Icons.visibility_off : Icons.visibility,
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide(color: Color(0xFFD9D9D9)),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide(color: Color(0xFFD9D9D9)),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 15.h),

//               Container(
//                 height: 33.h,
//                 width: 311,
//                 decoration: BoxDecoration(
//                   color: kPrimaryColor,
//                   borderRadius: BorderRadius.circular(6),
//                 ),
//                 alignment: Alignment.center,
//                 child: Text(
//                   "Update",
//                   style: GoogleFonts.inter(fontSize: 10, color: Colors.white),
//                 ),
//               ),
//               SizedBox(height: 38.h),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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
            children: [
              SizedBox(height: 38.h),

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
                          text: ' password',

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
              SizedBox(height: 19.h),

              /// Password field
              TextField(
                obscureText: !_showPassword,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 12.w,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "  password",
                  hintStyle: GoogleFonts.inter(
                    fontSize: 10,
                    color: const Color(0x42000000),
                  ),
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
              SizedBox(height: 15.h),

              /// Confirm password label
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
                          text: ' confirm password',

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
              SizedBox(height: 28.h),

              TextField(
                obscureText: !_showConfirmPassword,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                  filled: true,
                  fillColor: const Color(0xFFE7F1FD),
                  hintText: "  Confirm password",
                  hintStyle: GoogleFonts.inter(
                    fontSize: 10,
                    color: const Color(0x42000000),
                  ),
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
              SizedBox(height: 15.h),

              Container(
                height: 33.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Update",
                  style: GoogleFonts.inter(fontSize: 10, color: Colors.white),
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
