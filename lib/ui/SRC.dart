import 'package:audit_info/Repositry/model/SRCmodel.dart';
import 'package:audit_info/bloc/SRC/src_bloc_bloc.dart';
import 'package:audit_info/utils/FontStyle.dart';
import 'package:audit_info/utils/colors.dart';
import 'package:audit_info/utils/customDrawer.dart';
import 'package:audit_info/utils/updatepass_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Src extends StatefulWidget {
  const Src({super.key});

  @override
  State<Src> createState() => _SrcState();
}

class _SrcState extends State<Src> {
  List<SrcModel> filteredsrc = [];
  List<SrcModel> allsrc = [];

  int _selectedIndex = 3;
  void _onitemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void initState() {
    super.initState();
    BlocProvider.of<SrcBlocBloc>(context).add(fetchsrc());
    searchController.addListener(filtersrcList);
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
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
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
                          bottom: BorderSide(color: Colors.black),
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
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                ),
                                child: Text(
                                  'E.Code',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: 10.sp,
                                    color: AppColors.kTextColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                ),
                                child: Text(
                                  'Name',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: 10.sp,
                                    color: AppColors.kTextColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                ),
                                child: Text(
                                  'Branch name',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: 10.sp,
                                    color: AppColors.kTextColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                ),
                                child: Text(
                                  'phone number',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: 10.sp,
                                    color: AppColors.kTextColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                ),
                                child: Text(
                                  'Point Amount',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: 10.sp,
                                    color: AppColors.kTextColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                ),
                                child: Text(
                                  'Status',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: 10.sp,
                                    color: AppColors.kTextColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                ),
                                child: Text(
                                  'Actions',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: 10.sp,
                                    color: AppColors.kTextColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
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
                              onEdit: () {
                                SRCopenDialog(
                                  context,
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

TableRow _SrcRow({
  required String code,
  required String name,
  required String Branchname,
  required String phone,
  required String PointAmount,
  required VoidCallback onEdit,
  required VoidCallback onDelete,
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
      // Padding(
      //   padding: EdgeInsets.symmetric(vertical: 6.h),
      //   child: Center(
      //     child: Switch(
      //       value: true,
      //       onChanged: (val) {},
      //       activeColor: Colors.green,
      //     ),
      //   ),
      // ),
      Icon(Icons.toggle_on, color: Colors.green, size: 31),
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
) async {
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
                      Text("Create New SRC", style: FontStyles.heading),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.close, color: AppColors.kBorderColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 23.h),

                  _fullTextField(title: "Employee Code"),
                  SizedBox(height: 10.h),
                  _fullTextField(
                    title: "Date of Joining",

                    icon: Icons.calendar_today,
                  ),
                  SizedBox(height: 10.h),
                  _fullTextField(title: "Name"),
                  SizedBox(height: 10.h),
                  _fullTextField(title: "Email"),
                  SizedBox(height: 10.h),
                  _fullTextField(title: "Address"),
                  SizedBox(height: 10.h),
                  _fullTextField(title: "Phone Number"),
                  SizedBox(height: 10.h),
                  _fullTextField(title: "Password", isPassword: true),
                  SizedBox(height: 10.h),
                  _fullTextField(title: "Confirm Password", isPassword: true),

                  SizedBox(height: 10.h),
                  _fullTextField(
                    title: "Select branch",

                    icon: Icons.keyboard_arrow_down,
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Expanded(
                        child: _fullTextField(
                          title: "Salary",
                          width: double.infinity,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(width: 13.w),
                      Expanded(
                        child: _fullTextField(
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
                        final srcdata = {
                          'employeeCode': employecodeController.text,
                          'dateOfJoining': dateController.text,
                          'name': nameController.text,
                          'email': emailController.text,
                          'address': addressController.text,
                          'phoneNumber': phonenumber.text,
                          'password': passwordController.text,
                          // 'branch': selectedBranch ?? 'Branch 1',
                          'pointAmount': pointamountController.text,
                          'salary': salaryController.text,
                        };
                        BlocProvider.of<SrcBlocBloc>(
                          context,
                        ).add(AddSrc(srcdata: srcdata));
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
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Create",
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
          keyboardType: keyboardType,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintStyle: GoogleFonts.poppins(fontSize: 12),
            suffixIcon: icon != null ? Icon(icon, size: 18) : null,
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
