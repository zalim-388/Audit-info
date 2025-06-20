import 'package:audit_info/Repositry/Api/SRC/SRCapi.dart';
import 'package:audit_info/Repositry/model/SRCmodel.dart';
import 'package:audit_info/bloc/SRC/src_bloc_bloc.dart';
import 'package:audit_info/ui/loginpage.dart';
import 'package:audit_info/utils/FontStyle.dart';
import 'package:audit_info/utils/colors.dart';
import 'package:audit_info/utils/customDrawer.dart';
import 'package:audit_info/utils/updatepass_sheet.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Src extends StatefulWidget {
  const Src({super.key});

  @override
  State<Src> createState() => _SrcState();
}

class _SrcState extends State<Src> {
  List<SrcModel> filteredsrc = [];
  List<SrcModel> allsrc = [];
  List<SrcModel> branch = [];

  int _selectedIndex = 3;
  void _onitemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  SrcModel? selectedBranch;

  void initState() {
    super.initState();
    BlocProvider.of<SrcBlocBloc>(context).add(fetchsrc());
    searchController.addListener(filtersrcList);
    fetchsrcbranch();
  }

  TextEditingController searchController = TextEditingController();
  TextEditingController employecodeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  TextEditingController pointamountController = TextEditingController();
  TextEditingController salaryController = TextEditingController();

  void filtersrcList() async {
    final qeury = searchController.text.toLowerCase();
    setState(() {
      filteredsrc =
          allsrc.where((Src) {
            return Src.employeeCode.toLowerCase().contains(qeury) ||
                Src.name.toLowerCase().contains(qeury) ||
                Src.email.toLowerCase().contains(qeury) ||
                Src.phoneNumber.toLowerCase().contains(qeury) ||
                Src.branchId.toString().toLowerCase().contains(qeury);
          }).toList();
    });
  }

  Future<void> fetchsrcbranch() async {
    try {
      final fetchsrcbranches = await Srcapi().getsrc();

      setState(() {
        branch = fetchsrcbranches;
        if (branch.isNotEmpty) {
          selectedBranch = branch[0];
        }
      });
    } catch (e) {
      throw Exception("fetchsrcbranch Error$e");
    }
  }

  @override
  void dispose() {
    searchController.removeListener(filtersrcList);
    searchController.dispose();
    employecodeController.dispose();
    dateController.dispose();
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    phonenumber.dispose();
    passwordController.dispose();
    confirmController.dispose();
    salaryController.dispose();
    super.dispose();
  }

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
        title: Text(" SRC", style: FontStyles.heading),
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
                MaterialPageRoute(builder: (context) => Loginpage()),
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
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 322.w,
                      height: 30.h,

                      child: TextField(
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
                  SizedBox(width: 7.w),
                  GestureDetector(
                    onTap: () {
                      SRCopenDialog(
                        context,
                        selectedBranch,
                        (value) {
                          setState(() {
                            selectedBranch = value;
                          });
                        },
                        employecodeController,
                        dateController,
                        nameController,
                        emailController,
                        addressController,
                        phonenumber,
                        confirmController,
                        pointamountController,
                        salaryController,
                        passwordController,
                        branch,
                      );
                    },
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

              SizedBox(height: 13.h),

              BlocBuilder<SrcBlocBloc, SrcBlocState>(
                builder: (context, state) {
                  if (state is SrcBlocloading) {
                    print("loading");
                    Center(child: CircularProgressIndicator());
                  } else if (state is srcblocError) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icon/Group 99.png', height: 40.h),
                        SizedBox(height: 4.h),
                      ],
                    );
                  } else if (state is srcBlocloaded) {
                    var allsrc = state.SRC;
                    if (searchController.text.isEmpty) {
                      filteredsrc = allsrc;
                    }

                    return Container(
                      width: 358.w,

                      decoration: BoxDecoration(
                        color: AppColors.kContainerColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                        border: Border(
                          bottom: BorderSide(color: AppColors.kBorderColor),

                          top: BorderSide(color: AppColors.kBorderColor),
                        ),
                      ),
                      child: Table(
                        border: TableBorder(
                          borderRadius: BorderRadius.circular(4),
                          horizontalInside: BorderSide(
                            color: AppColors.kBorderColor,
                          ),
                          verticalInside: BorderSide(
                            color: AppColors.kBorderColor,
                          ),

                          left: BorderSide(color: AppColors.kBorderColor),
                          right: BorderSide(color: AppColors.kBorderColor),
                        ),
                        columnWidths: const <int, TableColumnWidth>{
                          0: FixedColumnWidth(50), // E.CODE
                          1: FixedColumnWidth(50), // Name
                          2: FixedColumnWidth(40), // Branch Name
                          3: FixedColumnWidth(70), // Phone Number
                          4: FixedColumnWidth(40), // Point Amount
                          5: FixedColumnWidth(40), // Status (toggle)
                          6: FixedColumnWidth(80), // Actions (icons)
                        },

                        children: [
                          TableRow(
                            decoration: BoxDecoration(color: Colors.grey[300]),
                            children: [
                              _tableheadRow(heading: 'E.Code'),
                              _tableheadRow(heading: 'Name'),
                              _tableheadRow(heading: 'Branch name'),
                              _tableheadRow(heading: "phone number"),
                              _tableheadRow(heading: 'Point Amount'),
                              _tableheadRow(heading: 'Status'),
                              _tableheadRow(heading: 'Actions'),
                            ],
                          ),
                          ...List.generate(filteredsrc.length, (index) {
                            final SRC = filteredsrc[index];

                            return _SrcRow(
                              code: SRC.employeeCode,
                              name: SRC.name,
                              Branchname: SRC.branchId.toString(),
                              phone: SRC.phoneNumber,
                              PointAmount: SRC.pointAmount.toString(),
                              status: SRC.status,
                              onToggle: (bool value) {
                                filteredsrc[index].status = value;
                              },
                              onEdit: () {
                                final SrcModel selected = branch.firstWhere(
                                  (e) => e.branchId?.id == SRC.branchId?.name,
                                  orElse:
                                      () => branch.isNotEmpty ? branch[0] : SRC,
                                );
                                setState(() {
                                  selectedBranch = selected;
                                });

                                SRCopenDialog(
                                  context,
                                  selectedBranch,
                                  (value) {
                                    setState(() {
                                      selectedBranch = value;
                                    });
                                  },
                                  employecodeController
                                    ..text = SRC.employeeCode,
                                  dateController
                                    ..text = DateFormat(
                                      'yyyy-MM-dd',
                                    ).format(SRC.dateOfJoining),

                                  nameController..text = SRC.name,
                                  emailController..text = SRC.email,
                                  addressController..text = SRC.address,
                                  phonenumber
                                    ..text = SRC.phoneNumber.toString(),
                                  confirmController..text = SRC.password,
                                  pointamountController
                                    ..text = SRC.pointAmount.toString(),
                                  salaryController,
                                  passwordController..text = SRC.password,
                                  branch,
                                  isUpdate: true,
                                  srcId: SRC.id,
                                );
                              },
                              onDelete: () {
                                BlocProvider.of<SrcBlocBloc>(
                                  context,
                                ).add(deletesrc(id: SRC.id));
                              },
                            );
                          }),
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _tableheadRow({required String heading}) {
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

TableRow _SrcRow({
  required String code,
  required String name,
  required String Branchname,
  required String phone,
  required String PointAmount,
  required VoidCallback onEdit,
  required VoidCallback onDelete,
  required bool status,
  required ValueChanged<bool> onToggle,
}) {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Center(child: Text(code, style: FontStyles.body)),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Center(child: Text(name, style: FontStyles.body)),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Center(child: Text(Branchname, style: FontStyles.body)),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Center(child: Text(phone, style: FontStyles.body)),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Center(child: Text(PointAmount, style: FontStyles.body)),
      ),
      Transform.scale(
        scale: 0.65,
        child: Switch(
          value: status,
          onChanged: onToggle,
          activeColor: Colors.white,
          activeTrackColor: Color(0xFF28AC24),
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: Colors.grey[400],
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),

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
    ],
  );
}

Future<void> SRCopenDialog(
  BuildContext context,
  SrcModel? selectedBranch,
  Function(SrcModel) onBranchSelected,
  TextEditingController employecodeController,
  TextEditingController dateController,
  TextEditingController nameController,
  TextEditingController emailController,
  TextEditingController addressController,
  TextEditingController phonenumber,
  TextEditingController confirmController,
  TextEditingController pointamountController,
  TextEditingController salaryController,
  TextEditingController passwordController,
  List<SrcModel> branch, {
  bool isUpdate = false,
  String? srcId,
}) async {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Container(
          width: 358.w,
          height: 683.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 20.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        isUpdate ? "Update SRC" : "Create New SRC",
                        style: FontStyles.heading,
                      ),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.close, color: AppColors.kBorderColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 23.h),

                  _fullTextField(
                    title: "Employee Code",
                    controller: employecodeController,
                  ),
                  SizedBox(height: 10.h),
                  _fullTextField(
                    title: "Date of Joining",
                    controller: dateController,
                    icon: Icons.calendar_today,
                    onTap: () async {
                      final dateRange = await showRangePickerDialog(
                        context: context,
                        initialDate: DateTime.now(),
                        minDate: DateTime(2021, 1, 1),
                        maxDate: DateTime(2025, 12, 31),
                      );

                      if (dateRange != null) {
                        dateController.text = DateFormat(
                          'yyyy-MM-dd',
                        ).format(dateRange.start);
                      }
                    },
                  ),
                  SizedBox(height: 10.h),
                  _fullTextField(title: "Name", controller: nameController),
                  SizedBox(height: 10.h),
                  _fullTextField(
                    title: "Email",
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                  ),
                  SizedBox(height: 10.h),
                  _fullTextField(
                    title: "Address",
                    controller: addressController,
                  ),
                  SizedBox(height: 10.h),
                  _fullTextField(
                    title: "Phone Number",
                    keyboardType: TextInputType.number,
                    controller: phonenumber,
                  ),
                  SizedBox(height: 10.h),
                  _fullTextField(
                    title: "Password",
                    isPassword: true,
                    controller: passwordController,
                  ),
                  SizedBox(height: 10.h),
                  _fullTextField(
                    title: "Confirm Password",
                    isPassword: true,

                    controller: confirmController,
                  ),

                  SizedBox(height: 10.h),
                  _buildDropdownField(
                    "select branch",
                    selectedBranch?.branchId?.name,
                    branch
                        .map((s) => s.branchId?.name)
                        .whereType<String>()
                        .toList(),
                    "select branch",
                    (selected) {
                      if (selected != null) {
                        final Branches = branch.firstWhere(
                          (s) => s.branchId!.name == selected,
                        );
                        onBranchSelected(Branches);
                      }
                    },
                    context,
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Expanded(
                        child: _fullTextField(
                          title: "Salary",
                          width: double.infinity,
                          keyboardType: TextInputType.number,
                          controller: salaryController,
                        ),
                      ),
                      SizedBox(width: 13.w),
                      Expanded(
                        child: _fullTextField(
                          controller: pointamountController,
                          title: "point Amount",
                          width: double.infinity,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
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
                        if (passwordController.text != confirmController.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Passwords do not match")),
                          );
                          return;
                        }

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
                        final srcdata = {
                          'employee_code': employecodeController.text,
                          'date_of_joining': formattedDate,
                          'name': nameController.text,
                          'email': emailController.text,
                          'address': addressController.text,
                          'phone_number': phonenumber.text,
                          'password': passwordController.text,
                          "status": true,
                          'point_amount': pointamountController.text,
                          'salary': salaryController.text,
                          "branchId": selectedBranch!.branchId?.id,
                        };
                        if (isUpdate && srcId != null) {
                          BlocProvider.of<SrcBlocBloc>(
                            context,
                          ).add(updatesrc(updatedData: srcdata, id: srcId));
                        } else {
                          BlocProvider.of<SrcBlocBloc>(
                            context,
                          ).add(AddSrc(srcdata: srcdata));
                        }
                        if (!isUpdate) {
                          employecodeController.clear();
                          dateController.clear();
                          nameController.clear();
                          emailController.clear();
                          addressController.clear();
                          phonenumber.clear();
                          passwordController.clear();
                          confirmController.clear();
                          pointamountController.clear();
                          salaryController.clear();
                        }
                        Navigator.pop(context);
                        BlocProvider.of<SrcBlocBloc>(context).add(fetchsrc());
                      },

                      child: Text(
                        isUpdate ? "Update" : "Create",
                        style: GoogleFonts.poppins(
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
}

Widget _fullTextField({
  required String title,
  IconData? icon,
  bool isPassword = false,
  double? width,
  TextInputType keyboardType = TextInputType.text,
  VoidCallback? onTap,
  TextEditingController? controller,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: FontStyles.body),
      SizedBox(height: 4.h),
      SizedBox(
        height: 30.h,
        width: width ?? 324.w,

        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintStyle: GoogleFonts.poppins(fontSize: 12),
            suffixIcon: IconButton(
              onPressed: onTap,
              icon: Icon(icon, size: 18),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12),
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: AppColors.kBorderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: AppColors.kBorderColor),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _buildDropdownField(
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
