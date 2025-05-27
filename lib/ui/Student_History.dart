import 'package:audit_info/ui/student_managment.dart';
import 'package:audit_info/utils/FontStyle.dart';
import 'package:audit_info/utils/colors.dart';
import 'package:audit_info/utils/updatepass_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentHistory extends StatefulWidget {
  const StudentHistory({super.key});

  @override
  State<StudentHistory> createState() => _StudentHistoryState();
}

class _StudentHistoryState extends State<StudentHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 4,
        shadowColor: Colors.grey.withOpacity(0.4),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => StudentManagment()),
              );
            },
          ),
        ),
        title: Text("StudentHistory", style: FontStyles.heading),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  ModalBottomSheetRoute(
                    builder: (context) => const UpdatepassSheet(),
                    isScrollControlled: true,
                  ),
                );
              },
              child: Container(
                height: 20.h,
                width: 22.w,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/icon/updatepass.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout_rounded, color: Color(0xFF414143)),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 22.h),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoText('Student Name: Babu'),
                  _buildInfoText('Phone Number: 9875647465'),
                  _buildInfoText('Address: Nil'),
                  _buildInfoText('School: PKM'),
                  _buildInfoText('College: MSP'),
                  _buildInfoText('Course: Bc'),
                  _buildInfoText('SRC: -'),
                  _buildInfoText('SRO: -'),
                  _buildInfoText('Branch: -'),
                  SizedBox(height: 10.h),
                  _buildCheckBoxRow(),
                  SizedBox(height: 20.h),
                  _buildCommentBox(),
                ],
              ),
            ),
            _buildSectionTitle("College Fee", onPressed: () {}),
            _buildFeeTable(),
            SizedBox(height: 16.h),
            _buildSectionTitle("Service", onPressed: () {}),
            _buildServiceTable(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 12.sp,
          color: AppColors.kTextColor,
        ),
      ),
    );
  }

  Widget _buildCheckBoxRow() {
    return Row(
      children: [
        _buildCheckBox("SSLC"),
        _buildCheckBox("CC"),
        _buildCheckBox("PlusTwo"),
        _buildCheckBox("Migration"),
        _buildCheckBox("TC"),
        _buildCheckBox("Photo"),
      ],
    );
  }

  Widget _buildCheckBox(String label) {
    return Row(
      children: [
        Checkbox(value: false, onChanged: (val) {}),
        Text(label, style: GoogleFonts.poppins(fontSize: 10.sp)),
      ],
    );
  }

  Widget _buildCommentBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Comment", style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w500)),
        SizedBox(height: 5),
        TextField(
          maxLines: 3,
          decoration: InputDecoration(
            hintText: "Type your message",
            hintStyle: GoogleFonts.poppins(fontSize: 12.sp),
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, {required VoidCallback onPressed}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.bold)),
        ElevatedButton(
          onPressed: onPressed,
          child: Text("Add ${title.contains('Fee') ? 'Fees' : 'Service amount'}"),
        ),
      ],
    );
  }

  Widget _buildFeeTable() {
    return _buildEmptyTable("College fee balance: 65000");
  }

  Widget _buildServiceTable() {
    return _buildEmptyTable("Service balance: 65000");
  }

  Widget _buildEmptyTable(String balanceText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5.h),
        Text(balanceText, style: GoogleFonts.poppins(fontSize: 12.sp)),
        SizedBox(height: 8.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Image.asset("assets/icon/no_data.png", height: 40.h),
          ),
        ),
      ],
    );
  }
}
