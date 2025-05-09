import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
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
            SizedBox(height: 52.h),
            RichText(textAlign: TextAlign.start,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '*  ',
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),

                  TextSpan(
                    text: ' Position',
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                ],
              ),
            ),

            TextField(decoration: InputDecoration()),
          ],
        ),
      ),
    );
  }
}
