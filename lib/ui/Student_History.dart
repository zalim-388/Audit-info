import 'package:audit_info/ui/student_managment.dart';
import 'package:audit_info/utils/FontStyle.dart';
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
          builder:
              (context) => IconButton(
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
            buildInfoRow('Student Name', 'Babu'),
            buildInfoRow('Phone Number', '9875647465'),
            buildInfoRow('Address', 'Nil'),
            buildInfoRow('SRC Name', 'N/A'),
            buildInfoRow('School Name', 'PKM'),
            buildInfoRow('College', 'msp'),
            buildInfoRow('Course', ''),
            buildInfoRow('SRC', ''),
            buildInfoRow('SRO', ''),
            buildInfoRow("Certificates", ""),

            Row(
              children: [
                Column(children: [_Certificates("SSLC"), _Certificates("CC")]),
                Column(
                  children: [
                    _Certificates("plus two"),
                    _Certificates("Migration"),
                  ],
                ),
                Column(children: [_Certificates("TC"), _Certificates("Photo")]),
              ],
            ),
            SizedBox(height: 10.h),
            Text(
              'Comment',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.h),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Type your message',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(6),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(6),
                ),

                contentPadding: EdgeInsets.all(12),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildTransactionSection(
                      title: "College fee",
                      lebal: " Add Fees",
                      total: "Total fee : 65000",
                      balance: "Fee balance : 65000",
                      onAdd: () {},
                    ),
                    _buildTransactionSection(
                      title: "Service",
                      total: "Total service charge : 65000",
                      balance: "Service balance : 65000",
                      lebal: "Add Service amount",
                      onAdd: () {},
                      width: 132.w,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildInfoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 70.w,
          child: Text(
            '$label  :',
            style: FontStyles.body.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: FontStyles.body.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _Certificates(String label) {
  return Row(
    // mainAxisSize: MainAxisSize.min,

    // crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Checkbox(
        checkColor: Color(0xFF868686),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        value: false,
        onChanged: (value) {},
      ),
      Text(label, style: FontStyles.body.copyWith(fontSize: 10)),
    ],
  );
}

Widget _buildTransactionSection({
  required String title,
  required String total,
  required String balance,
  required VoidCallback onAdd,
  required String lebal,
  double? width,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 36.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: FontStyles.heading.copyWith(fontSize: 16)),
          Container(
            height: 28.h,
            width: width ?? 88.w,

            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 8.w),
                Text(
                  lebal,
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 10),
                ),
                SizedBox(width: 11.w),
                GestureDetector(
                  onTap: onAdd,
                  child: Container(
                    height: 28.h,
                    width: 28.w,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/icon/Group 189.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      SizedBox(height: 8.h),
      Text(total, style: FontStyles.body.copyWith(fontSize: 12)),
      Text(balance, style: FontStyles.body.copyWith(fontSize: 12)),
      SizedBox(height: 10.h),
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
              child: Row(
                children: const [
                  Expanded(
                    child: Text(
                      "Date",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Amount",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Particular",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Paid",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Action",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100.h,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icon/Group 99.png', height: 40.h),
                  SizedBox(height: 4.h),
                  Text(
                    "No data available",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 20.h),
    ],
  );
}
