import 'package:audit_info/bloc/lead/leadmanagement_bloc.dart';
import 'package:audit_info/repository/model/lead_management.dart';
import 'package:audit_info/ui/leadcall.dart';
import 'package:audit_info/ui/leadhistory.dart';
import 'package:audit_info/utils/FontStyle.dart';
import 'package:audit_info/utils/colors.dart';
import 'package:audit_info/utils/customDrawer.dart';
import 'package:audit_info/utils/table.dart';
import 'package:audit_info/utils/textfield.dart';
import 'package:audit_info/utils/updatepass_sheet.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class LeadManagment extends StatefulWidget {
  const LeadManagment({super.key});

  @override
  State<LeadManagment> createState() => _LeadManagmentState();
}

class _LeadManagmentState extends State<LeadManagment> {
  int _selectedIndex = 7;
  bool showDropdown = false;
  List<bool> _isVisibleList = List.generate(5, (_) => false);

  LeadManagementModel? selectedItem;
  LeadManagementModel? selectedSchool;
  LeadManagementModel? selectedStatus;
  LeadManagementModel? selectedBranch;
  LeadManagementModel? selectedSRC;
  LeadManagementModel? selectedSRO;
  LeadManagementModel? selectedCourse;

  List<LeadManagementModel> statuses = [];
  List<LeadManagementModel> branches = [];
  List<LeadManagementModel> schools = [];
  List<LeadManagementModel> subjects = [];
  List<LeadManagementModel> srcOptions = [];
  List<LeadManagementModel> sroOptions = [];
  List<LeadManagementModel> courses = [];

  void _onitemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _filterleads() {
    setState(() {
      showDropdown = !showDropdown;
    });
  }

  void _toggleVisibility(int index) {
    setState(() {
      _isVisibleList[index] = !_isVisibleList[index];
    });
  }

  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  TextEditingController percentageController = TextEditingController();

  void onSelected(LeadManagementModel selected) {
    setState(() {
      selectedItem = selected;
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<LeadmanagementBloc>(context).add(fetchlead());
  }

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
              (context) =>
                  showDropdown
                      ? IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LeadManagment(),
                            ),
                          );
                          setState(() {
                            showDropdown = false;
                          });
                        },
                      )
                      : IconButton(
                        icon: const Icon(Icons.more_vert, color: Colors.black),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
        ),
        title: Text("Lead Managment", style: FontStyles.heading),
        actions: [
          if (!showDropdown)
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
          if (!showDropdown)
            IconButton(
              onPressed: () {},
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
              Row(
                children: [
                  Container(
                    width: 25.w,
                    height: 25.h,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: _filterleads,
                      child: Icon(
                        Icons.filter_list_alt,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  if (!showDropdown) ...[
                    Spacer(),
                    Container(
                      height: 28.h,
                      width: 88.w,
                      decoration: BoxDecoration(
                        color: AppColors.kPrimaryColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 6.w),
                          Text(
                            "Upload lead",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(width: 3.w),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                ModalBottomSheetRoute(
                                  builder:
                                      (context) => _modalBottomSheet(context),
                                  isScrollControlled: true,
                                ),
                              );
                            },
                            child: Container(
                              height: 18.h,
                              width: 18.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(2),
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.add,
                                color: AppColors.kPrimaryColor,
                                size: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      height: 28.h,
                      width: 88.w,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 8.w),
                          Text(
                            "Add lead",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(width: 11.w),
                          GestureDetector(
                            onTap: () {
                              Addlead(
                                context,
                                onSelected,
                                nameController,
                                phonenumberController,
                                addressController,
                                confirmController,
                                percentageController,
                                dateController,
                                selectedSchool,
                                selectedBranch,
                                selectedSRC,
                                selectedSRO,
                                selectedBranch,
                                selectedCourse,
                                schools,
                                subjects,
                                srcOptions,
                                sroOptions,
                                branches,
                                courses,
                              );
                            },
                            child: Container(
                              height: 28.h,
                              width: 28.w,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/icon/Group 189.png",
                                  ),
                                  fit: BoxFit.cover,
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
              if (showDropdown) ...[
                SizedBox(height: 20.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    fullTextField(
                      title: "Start date - End date",
                      width: 360.w,
                      icon: Icons.calendar_today,
                      onTap: () async {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        ).then((pickedDate) {
                          if (pickedDate != null) {
                            dateController.text = DateFormat(
                              'yyyy-MM-dd',
                            ).format(pickedDate);
                          }
                        });
                      },
                    ),
                    SizedBox(height: 5.h),
                    DropdownField(
                      "School Name",
                      selectedSchool?.schoolId.name.toString(),
                      schools
                          .map((school) => school.schoolId.name)
                          .whereType<String>()
                          .toList(),
                      "Select School",
                      (selected) {
                        if (selected != null) {
                          final selectedSchoolModel = schools.firstWhere(
                            (s) => s.schoolId.name == selected,
                          );
                          onSelected(selectedSchoolModel);
                        }
                      },
                      context,
                    ),
                    SizedBox(height: 10.h),
                    DropdownField(
                      "Select status",
                      selectedStatus?.status.toString(),
                      statuses
                          .map((s) => s.status)
                          .whereType<String>()
                          .toList(),
                      "Select status",
                      (selected) {
                        if (selected != null) {
                          final status = statuses.firstWhere(
                            // Changed from branches to statuses
                            (s) => s.status == selected,
                          );
                          onSelected(status);
                        }
                      },
                      context,
                    ),
                    SizedBox(height: 10.h),
                    DropdownField(
                      "Branch",
                      selectedBranch?.branchId.name.toString(),
                      branches
                          .map((s) => s.branchId.name)
                          .whereType<String>()
                          .toList(),
                      "Select Branch",
                      (selected) {
                        if (selected != null) {
                          final Branches = branches.firstWhere(
                            (s) => s.branchId.name == selected,
                          );
                          onSelected(Branches);
                        }
                      },
                      context,
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 250),
                      child: GestureDetector(
                        onTap: () {
                          print('Show button tapped');
                        },
                        child: Container(
                          height: 30.h,
                          width: 120.w,
                          decoration: BoxDecoration(
                            color: AppColors.kPrimaryColor,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Show",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Results",
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          color: AppColors.kTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              SizedBox(height: 13.h),

              // Replace your existing Container(child: Table(...)) with this corrected widget.
              Container(
                width: 358.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(9),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  mainAxisSize:
                      MainAxisSize.min,
                  children: [
                 
                    _buildHeaderRow(),

                
                     Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xFFF2F2F2),
                    ),

          
                    _buildDataEntry(
                      index: 0,
                      date: "21-10-2024",
                      name: "Babu",
                      schoolName: "PKM",
                      src: "None",
                      phoneNumber: "3652154652",
                      status: 'Registered',
                    ),

                 
                     Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xFFF2F2F2),
                    ),

               
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionsRow(int index) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[200]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: GestureDetector(
          onTap: () => _toggleVisibility(index),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Actions",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 10.sp,
                ),
              ),
              Icon(
                _isVisibleList[index]
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                size: 16.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandableRow() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: _downbotton(context),
      ),
    );
  }


  Widget _buildDataEntry({
    required int index,
    required String date,
    required String name,
    required String schoolName,
    required String src,
    required String phoneNumber,
    required String status,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
     
        _leadRow(
          Date: date,
          name: name,
          Schoolname: schoolName,
          Src: src,
          phonenumber: phoneNumber,
          Status: status,
        ),
       
         Divider(height: 1, thickness: 1, color: Color(0xFFF2F2F2)),
     
        _buildActionsRow(index),

        if (_isVisibleList[index]) _buildExpandableRow(),
      ],
    );
  }

  Widget _buildHeaderRow() {
    Widget verticalDivider() {
      return const SizedBox(
        height: 40,
        child: VerticalDivider(
          width: 1,
          thickness: 1,
          color: Color(0xFFF2F2F2),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(9),
          topRight: Radius.circular(9),
        ),
      ),
      child: Row(
        children: [
          tableheadRow('Date', 55),
          verticalDivider(),
          tableheadRow('Name', 70),
          verticalDivider(),
          tableheadRow('School Name', 65),
          verticalDivider(),
          tableheadRow('SRC', 60),
          verticalDivider(),
          tableheadRow('Phone number', 65),
          verticalDivider(),
          tableheadRow('Status', 60),
        ],
      ),
    );
  }

  Widget _leadRow({
    required String Date,
    required String name,
    required String Schoolname,
    required String Src,
    required String phonenumber,
    required String Status,
  }) {
    Widget verticalDivider() {
      return const SizedBox(
        height: 40,
        child: VerticalDivider(
          width: 1,
          thickness: 1,
          color: Color(0xFFF2F2F2),
        ),
      );
    }

    return Container(
      color: Colors.white,
      child: Row(
        children: [
          cell(Date, 55),
          verticalDivider(),
          cell(name, 70),
          verticalDivider(),
          cell(Schoolname, 65),
          verticalDivider(),
          cell(Src, 60),
          verticalDivider(),
          cell(phonenumber, 65),
          verticalDivider(),

          SizedBox(
            width: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: Text(
                  Status,
                  style: GoogleFonts.poppins(
                    color: Status == 'Registered' ? Colors.green : Colors.red,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> Addlead(
    BuildContext context,
    Function(LeadManagementModel) onSelected,
    TextEditingController nameController,
    TextEditingController phonenumberController,
    TextEditingController AddressController,
    TextEditingController confirmController,
    TextEditingController percentageController,
    TextEditingController dateController,
    LeadManagementModel? selectedSchool,
    LeadManagementModel? selectedSubject,
    LeadManagementModel? selectedSRC,
    LeadManagementModel? selectedSRO,
    LeadManagementModel? selectedBranch,
    LeadManagementModel? selectedCourse,
    List<LeadManagementModel> schools,
    List<LeadManagementModel> subjects,
    List<LeadManagementModel> srcOptions,
    List<LeadManagementModel> sroOptions,
    List<LeadManagementModel> branches,
    List<LeadManagementModel> courses,
  ) async {
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Container(
                width: 358.w,
                height: 603.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 17.w,
                    vertical: 20.h,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Add New Lead", style: FontStyles.heading),
                            InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Icon(
                                Icons.close,
                                color: AppColors.kBorderColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        fullTextField(
                          title: "Name",
                          controller: nameController,
                        ),
                        SizedBox(height: 10.h),
                        fullTextField(
                          title: "Phone Number",
                          controller: phonenumberController,
                        ),
                        SizedBox(height: 10.h),
                        fullTextField(
                          title: "Address",
                          controller: AddressController,
                        ),
                        SizedBox(height: 13.h),
                        Row(
                          children: [
                            Expanded(
                              child: DropdownField(
                                "School Name",
                                selectedSchool?.schoolId.name.toString(),
                                schools
                                    .map((school) => school.schoolId.name)
                                    .whereType<String>()
                                    .toList(),
                                "Select School",
                                (selected) {
                                  if (selected != null) {
                                    final selectedSchoolModel = schools
                                        .firstWhere(
                                          (s) => s.schoolId.name == selected,
                                        );
                                    onSelected(selectedSchoolModel);
                                  }
                                },
                                context,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: DropdownField(
                                "Subject Name",
                                selectedSubject?.subjectName.toString(),
                                subjects
                                    .map((sub) => sub.subjectName)
                                    .whereType<String>()
                                    .toList(),
                                "Select Subject",
                                (Selected) {
                                  if (Selected != null) {
                                    final subjectModel = subjects.firstWhere(
                                      (s) => s.subjectName == Selected,
                                    );
                                    onSelected(subjectModel);
                                  }
                                },
                                context,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Expanded(
                              child: DropdownField(
                                "Select SRC",
                                selectedSRC?.sRcId?.name.toString(),
                                srcOptions
                                    .map((s) => s.sRcId?.name)
                                    .whereType<String>()
                                    .toList(),
                                "Select SRC",
                                (selected) {
                                  if (selected != null) {
                                    final src = srcOptions.firstWhere(
                                      (s) => s.sRcId!.name == selected,
                                    );
                                    onSelected(src);
                                  }
                                },
                                context,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: DropdownField(
                                "Select SRO",
                                selectedSRO?.sRoId?.name.toString(),
                                sroOptions
                                    .map((s) => s.sRoId?.name)
                                    .whereType<String>()
                                    .toList(),
                                "Select SRO",
                                (selected) {
                                  if (selected != null) {
                                    final sro = sroOptions.firstWhere(
                                      // Changed from srcOptions to sroOptions
                                      (s) => s.sRoId!.name == selected,
                                    );
                                    onSelected(sro);
                                  }
                                },
                                context,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        DropdownField(
                          "Branch",
                          selectedBranch?.branchId.name.toString(),
                          branches
                              .map((s) => s.branchId.name)
                              .whereType<String>()
                              .toList(),
                          "Select Branch",
                          (selected) {
                            if (selected != null) {
                              final Branches = branches.firstWhere(
                                (s) => s.branchId.name == selected,
                              );
                              onSelected(Branches);
                            }
                          },
                          context,
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Expanded(
                              child: DropdownField(
                                "Course name",
                                selectedCourse?.course.name.toString(),
                                courses
                                    .map((s) => s.course.name)
                                    .whereType<String>()
                                    .toList(),
                                "Select Course",
                                (selected) {
                                  if (selected != null) {
                                    final course = courses.firstWhere(
                                      (s) => s.course.name == selected,
                                    );
                                    onSelected(course);
                                  }
                                },
                                context,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: fullTextField(
                                title: "Mark percentage",
                                keyboardType: TextInputType.number,
                                controller: percentageController,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        fullTextField(
                          title: "Confirm Password",
                          isPassword: true,
                          controller: confirmController,
                        ),
                        SizedBox(height: 21.h),
                        SizedBox(
                          width: double.infinity,
                          height: 30.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            onPressed: () {
                              String formattedDate = '';
                              try {
                                if (dateController.text.isNotEmpty) {
                                  DateTime parsedDate = DateFormat(
                                    'yyyy-MM-dd',
                                  ).parse(dateController.text);
                                  formattedDate = DateFormat(
                                    'yyyy-MM-dd',
                                  ).format(parsedDate);
                                }
                              } catch (e) {
                                formattedDate = dateController.text;
                              }
                              // Add lead submission logic here
                            },
                            child: Text(
                              "Add Lead",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _downbotton(BuildContext context) {
    return Container(
      height: 35.h,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LeadHistory(context)),
              );
              print('Show button tapped');
            },
            child: Container(
              height: 25.h,
              width: 25.w,
              decoration: BoxDecoration(
                color: const Color(0xFFFF6212),
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.visibility,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => print('Edit button tapped'),
            child: Container(
              height: 25.h,
              width: 25.w,
              decoration: BoxDecoration(
                color: const Color(0xFF4D5CFF),
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.edit, color: Colors.white, size: 16),
            ),
          ),
          GestureDetector(
            onTap: () => print('Delete button tapped'),
            child: Container(
              height: 25.h,
              width: 25.w,
              decoration: BoxDecoration(
                color: const Color(0xFFEF615B),
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.delete, color: Colors.white, size: 16),
            ),
          ),
          GestureDetector(
            onTap: () => print('Description button tapped'),
            child: Container(
              height: 25.h,
              width: 25.w,
              decoration: BoxDecoration(
                color: const Color(0xFFFB952C),
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.description,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Leadcall()),
              );
              print('Phone button tapped');
            },
            child: Container(
              height: 25.h,
              width: 25.w,
              decoration: BoxDecoration(
                color: const Color(0xFF19A246),
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.phone, color: Colors.white, size: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _modalBottomSheet(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 41.w, vertical: 20.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DottedBorder(
                    dashPattern: [6, 3],
                    color: Color(0xFF868686),
                    strokeWidth: 1,
                    borderType: BorderType.RRect,
                    radius: Radius.circular(17),
                    child: Container(
                      height: 156.h,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.upload_outlined,
                            size: 50.sp,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "Click this here to upload your file",
                            style: GoogleFonts.poppins(
                              fontSize: 10.sp,
                              color: Color(0xFF525252),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  SizedBox(
                    width: double.infinity,
                    height: 30.h,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle submit
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF9900),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Submit",
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
