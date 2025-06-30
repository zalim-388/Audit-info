import 'package:audit_info/ui/loginpage.dart';
import 'package:audit_info/utils/FontStyle.dart';
import 'package:audit_info/utils/colors.dart';
import 'package:audit_info/utils/customDrawer.dart';
import 'package:audit_info/utils/table.dart';
import 'package:audit_info/utils/updatepass_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Request extends StatefulWidget {
  const Request({super.key});

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  int _selectedIndex = 13;
  void _onitemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int selectedRequestIndex = -1;
  List<dynamic> Requests = [
    "Admission",
    "Registration",
    "Booking",
    "College Fees",
    "Booking Confirmation",
    "Acknowledgement",
    "Refund",
    "Amount Collection",
    "Agent Payment",
  ];

  // Sample data for table
  List<Map<String, String>> tableData = [
    {
      "slNo": "1",
      "studentName": "Salim",
      "collegeName": "MSP",
      "courseName": "BBA",
      "fullAmount": "700000",
      "receivedAmount": "50000",
    },
    // Add more data as needed
  ];

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Customdrawer(
        onitemTapped: _onitemTapped,
        SelectedIndex: _selectedIndex,
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 4,
        shadowColor: Colors.grey.withOpacity(0.4),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: const Icon(Icons.more_vert, color: Colors.black),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
        ),
        title: Text(" Request's", style: FontStyles.heading),
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
            onPressed: () {
              Navigator.push(
                context,
                DialogRoute(
                  context: context,
                  builder: (context) => Loginpage(),
                ),
              );
            },
            icon: const Icon(Icons.logout_rounded, color: Color(0xFF414143)),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 13.h),
              // Search Field
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 322.w,
                      height: 30.h,
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xFF404A80),
                          ),
                          hintText: "search",
                          hintStyle: FontStyles.body,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.kBorderColor,
                            ),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.kBorderColor,
                            ),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 13.h),

              // Request Grid
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 17,
                  childAspectRatio: 2.8,
                ),
                itemCount: Requests.length,
                itemBuilder: (context, index) {
                  final request = Requests[index];
                  final bool isSelected = selectedRequestIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedRequestIndex = index;
                      });
                    },
                    child: Container(
                      height: 25.h,
                      decoration: BoxDecoration(
                        color:
                            isSelected ? AppColors.kPrimaryColor : Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text(
                          request,
                          style: FontStyles.body.copyWith(
                            color: Colors.white,
                            fontSize: 11,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 23.h),

              if (selectedRequestIndex != -1) ...[
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppColors.kBorderColor),
                  ),
                  child: Column(
                    children: [
                      Table(
                        border: TableBorder(
                          horizontalInside: BorderSide(
                            color: AppColors.kBorderColor,
                          ),
                          verticalInside: BorderSide(
                            color: AppColors.kBorderColor,
                          ),
                        ),
                        columnWidths: <int, TableColumnWidth>{
                          0: FixedColumnWidth(50),
                          1: FixedColumnWidth(50),
                          2: FixedColumnWidth(30),
                          3: FixedColumnWidth(30),
                          4: FixedColumnWidth(60),
                          5: FixedColumnWidth(30),
                        },
                        children: [
                          TableRow(
                            decoration: BoxDecoration(color: Colors.grey[300]),
                            children: [
                              tableheadRow("Sl.No"),
                              tableheadRow("Student name"),
                              tableheadRow("College Name"),
                              tableheadRow("Course name"),
                              tableheadRow("Full amount"),
                              tableheadRow("Received amount"),
                            ],
                          ),

                          ...tableData
                              .map(
                                (data) => _AdmissionTableRow(
                                  slNo: data["slNo"]!,
                                  studentName: data["studentName"]!,
                                  collegeName: data["collegeName"]!,
                                  courseName: data["courseName"]!,
                                  fullAmount: data["fullAmount"]!,
                                  receivedAmount: data["receivedAmount"]!,
                                ),
                              )
                              .toList(),
                        ],
                      ),

                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(4),
                            bottomRight: Radius.circular(4),
                          ),
                          border: Border(
                            top: BorderSide(color: AppColors.kBorderColor),
                          ),
                        ),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              _showAddAmountDialog();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.kPrimaryColor,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Text(
                              "Add amount",
                              style: FontStyles.body.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  TableRow _AdmissionTableRow({
    required String slNo,
    required String studentName,
    required String collegeName,
    required String courseName,
    required String fullAmount,
    required String receivedAmount,
  }) {
    return TableRow(
      children: [
        cell(slNo),
        cell(studentName),
        cell(collegeName),
        cell(courseName),
        cell(fullAmount),
        cell(receivedAmount),
      ],
    );
  }

  void _showAddAmountDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add Amount"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Amount",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle save action
                Navigator.pop(context);
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }
}
