import 'package:audit_info/bloc/manger/manager_bloc.dart';
import 'package:audit_info/utils/FontStyle.dart';
import 'package:audit_info/utils/colors.dart';
import 'package:audit_info/utils/customDrawer.dart';
import 'package:audit_info/utils/updatepass_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BranchManager extends StatefulWidget {
  const BranchManager({super.key});

  @override
  State<BranchManager> createState() => _BranchMangerState();
}

class _BranchMangerState extends State<BranchManager> {
  bool toggle = true;
  int _selectedIndex = 1;
  void _onitemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String? selectedBranch = 'Branch 1';

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ManagerBloc>(context).add(fetchmanager());
  }

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
        title: Text("Branch Manager", style: FontStyles.heading),
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
                          hintText: "search manager",
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
                      _BranchManageropenDialog(
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
              BlocBuilder<ManagerBloc, ManagerState>(
                builder: (context, state) {
                  print("loading");
                  if (state is ManagerBlocloading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ManagerBlocError) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icon/Group 99.png', height: 40.h),
                        SizedBox(height: 4.h),
                      ],
                    );
                  } else if (state is ManagerBlocloaded) {
                    var managers = state.manager;
                    return Column(
                      children: [
                        Container(
                          height: 20.h,
                          width: 354.w,
                          decoration: BoxDecoration(
                            color: AppColors.kContainerColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(9),
                              topRight: Radius.circular(9),
                            ),
                          ),
                          child: Table(
                            border: TableBorder(
                              horizontalInside: BorderSide(
                                color: AppColors.kBorderColor,
                              ),
                              verticalInside: BorderSide(
                                color: AppColors.kBorderColor,
                              ),
                              bottom: BorderSide(color: Colors.black),
                              left: BorderSide(color: Colors.black),
                              right: BorderSide(color: Colors.black),
                              top: BorderSide(color: Colors.black),
                            ),
                            columnWidths: {
                              0: FixedColumnWidth(180),
                              1: FixedColumnWidth(10),
                              2: FixedColumnWidth(60),
                            },
                            children: [
                              TableRow(
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                ),
                                children: [
                                  Text(
                                    'Id',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: 10.sp,
                                      color: AppColors.kTextColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Status',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: 10.sp,
                                      color: AppColors.kTextColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Actions',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: 10.sp,
                                      color: AppColors.kTextColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),

                              ...List.generate(managers.length, (index) {
                                final manager = managers[index];
                                return _TableRow(
                                  Id: manager.id,
                                  status: manager.refresh,
                                  onToggle: (bool value) {
                                    setState(() {
                                      toggle = value;
                                    });
                                  },

                                  onTapEdit: () {
                                    _BranchManageropenDialog(
                                      context,
                                      selectedBranch,
                                      (value) {
                                        setState(() {
                                          selectedBranch = value;
                                        });
                                      },
                                      employecodeController
                                        ..text = manager.employeeCode,
                                      dateController
                                        ..text =
                                            manager.dateOfJoining.toString(),
                                      nameController..text = manager.name,
                                      emailController..text = manager.email,
                                      addressController..text = manager.address,
                                      phonenumber
                                        ..text = manager.phoneNumber.toString(),
                                      confirmController
                                        ..text = manager.password,
                                      pointamountController
                                        ..text = manager.pointAmount.toString(),
                                      salaryController
                                        ..text = manager.salary.toString(),
                                      passwordController
                                        ..text = manager.password,
                                    );
                                  },
                                  onTapDelete: () {
                                    BlocProvider.of<ManagerBloc>(
                                      context,
                                    ).add(DeleteManager(id: manager.id));
                                  },
                                );
                              }),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  return SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TableRow _TableRow({
  required String Id,
  required VoidCallback onTapEdit,
  required VoidCallback onTapDelete,
  required ValueChanged<bool> onToggle,
  required bool status,
}) {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Center(child: Text(Id, style: FontStyles.body)),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        child: Center(
          child: Switch(
            value: status,
            onChanged: onToggle,
            activeColor: Colors.green,
            inactiveTrackColor: Colors.grey,
          ),
        ),
      ),

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          children: [
            Material(
              color: Color(0xFF4A60E4),
              borderRadius: BorderRadius.circular(4),
              child: InkWell(
                onTap: onTapEdit,
                borderRadius: BorderRadius.circular(4),
                child: SizedBox(
                  width: 25.w,
                  height: 25.h,
                  child: Icon(Icons.edit, color: Colors.white, size: 16.sp),
                ),
              ),
            ),
            SizedBox(width: 18.w),

        
            Material(
              color: Color(0xFFFF4C4C),
              borderRadius: BorderRadius.circular(4),
              child: InkWell(
                onTap: onTapDelete,
                borderRadius: BorderRadius.circular(4),
                child: SizedBox(
                  width: 25.w,
                  height: 25.h,
                  child: Icon(
                    Icons.delete_outline,
                    color: Colors.white,
                    size: 16.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Future<void> _BranchManageropenDialog(
  BuildContext context,
  String? selectedBranch,
  Function(String) onBranchSelected,
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
                      Text(
                        "Create New Branch Manager",
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
                  ),
                  _fullTextField(title: "Name", controller: nameController),
                  SizedBox(height: 10.h),
                  _fullTextField(title: "Email", controller: emailController),
                  SizedBox(height: 10.h),
                  _fullTextField(
                    title: "Address",
                    controller: addressController,
                  ),
                  SizedBox(height: 10.h),
                  _fullTextField(
                    title: "Phone Number",
                    keyboardType: TextInputType.phone,
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
                  customDropdown(
                    context: context,
                    title: "Select Branch",
                    selectedValue: selectedBranch,
                    items: ['Branch 1', 'Branch 2', 'Branch 3'],
                    onSelected: (value) {
                      onBranchSelected(value);
                    },
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Expanded(
                        child: _fullTextField(
                          title: "Point Amount",
                          width: double.infinity,
                          keyboardType: TextInputType.number,
                          controller: pointamountController,
                        ),
                      ),
                      SizedBox(width: 13.w),
                      Expanded(
                        child: _fullTextField(
                          title: "Salary",
                          width: double.infinity,
                          keyboardType: TextInputType.number,
                          controller: salaryController,
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
                        final managerdata = {
                          'id': employecodeController.text.isEmpty,
                          'employeeCode': employecodeController.text,
                          'dateOfJoining': dateController.text,
                          'name': nameController.text,
                          'email': emailController.text,
                          'address': addressController.text,
                          'phoneNumber': phonenumber.text,
                          'password': passwordController.text,
                          'branch': selectedBranch ?? 'Branch 1',
                          'pointAmount': pointamountController.text,
                          'salary': salaryController.text,
                        };
                        BlocProvider.of<ManagerBloc>(
                          context,
                        ).add(Addmanager(managerdata: managerdata));
                        // employecodeController.clear();
                        // dateController.clear();
                        // nameController.clear();
                        // emailController.clear();
                        // addressController.clear();
                        // phonenumber.clear();
                        // passwordController.clear();
                        // confirmController.clear();
                        // pointamountController.clear();
                        // salaryController.clear();
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Create",
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
}

Widget _fullTextField({
  required String title,
  IconData? icon,
  bool isPassword = false,
  double? width,
  TextInputType keyboardType = TextInputType.text,
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

Widget customDropdown({
  required BuildContext context,
  required String title,
  required String? selectedValue,
  required void Function(String value) onSelected,
  required List<String> items,
  double? width,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: FontStyles.body),
      SizedBox(height: 4.h),
      Container(
        height: 27.h,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: GestureDetector(
          onTapDown: (details) async {
            final selected = await showMenu<String>(
              context: context,
              position: RelativeRect.fromLTRB(
                details.globalPosition.dx,
                details.globalPosition.dy,
                details.globalPosition.dx,
                details.globalPosition.dy,
              ),
              items:
                  items.map((item) {
                    return PopupMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
            );
            if (selected != null) {
              onSelected(selected);
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedValue ?? title,
                style: GoogleFonts.inter(fontSize: 10, color: Colors.grey),
              ),
              const Icon(Icons.keyboard_arrow_down, size: 16),
            ],
          ),
        ),
      ),
    ],
  );
}
