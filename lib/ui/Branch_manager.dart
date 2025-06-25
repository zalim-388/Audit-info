import 'package:audit_info/Repositry/Api/manager/managerApi.dart';
import 'package:audit_info/Repositry/model/manager_model.dart';
import 'package:audit_info/bloc/manger/manager_bloc.dart';
import 'package:audit_info/ui/loginpage.dart';
import 'package:audit_info/utils/FontStyle.dart';
import 'package:audit_info/utils/colors.dart';
import 'package:audit_info/utils/customDrawer.dart';
import 'package:audit_info/utils/table.dart';
import 'package:audit_info/utils/textfield.dart';
import 'package:audit_info/utils/updatepass_sheet.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BranchManager extends StatefulWidget {
  const BranchManager({super.key});

  @override
  State<BranchManager> createState() => _BranchMangerState();
}

class _BranchMangerState extends State<BranchManager> {
  List<Managermodel> filteredmanger = [];
  List<Managermodel> allManagers = [];
  List<Managermodel> branches = [];
  Managermodel? selectedBranch;
  bool toggle = true;
  int _selectedIndex = 1;
  void _onitemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ManagerBloc>(context).add(fetchmanager());
    searchController.addListener(filteredmangerlist);
    fetchbranch();
  }

  Future<void> fetchbranch() async {
    try {
      final fetchbranches = await ManagerApi().getManager();
      setState(() {
        branches = fetchbranches;
        if (branches.isNotEmpty) {
          selectedBranch = branches[0];
        }
      });
    } catch (e) {
      throw Exception("fetchbranch Error$e");
    }
  }

  void filteredmangerlist() async {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredmanger =
          allManagers.where((manger) {
            return manger.id.toLowerCase().contains(query);
          }).toList();
    });
  }

  TextEditingController searchController = TextEditingController();
  TextEditingController employecodeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  TextEditingController pointamountController = TextEditingController();
  TextEditingController salaryController = TextEditingController();

  @override
  void dispose() {
    searchController.removeListener(filteredmangerlist);
    searchController.dispose();
    employecodeController.dispose();
    dateController.dispose();
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    phonenumberController.dispose();
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
                      height: 25.12.h,
                      child: TextField(
                        controller: searchController,
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
                        phonenumberController,
                        confirmController,
                        pointamountController,
                        salaryController,
                        passwordController,
                        branches,
                        isUpdate: false,
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
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.kPrimaryColor,
                      ),
                    );
                  } else if (state is ManagerBlocError) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icon/Group 99.png', height: 40.h),
                        SizedBox(height: 4.h),
                      ],
                    );
                  } else if (state is ManagerBlocloaded) {
                    var allManagers = state.manager;
                    if (searchController.text.isEmpty) {
                      filteredmanger = allManagers;
                    }
                    return Column(
                      children: [
                        Container(
                          height: 20.h,
                          width: 354.w,
                          decoration: BoxDecoration(
                            color: AppColors.kContainerColor,
                            border: Border(
                              top: BorderSide(color: AppColors.kBorderColor),

                              bottom: BorderSide(color: AppColors.kBorderColor),
                            ),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(9),
                              topLeft: Radius.circular(9),
                              topRight: Radius.circular(9),
                              bottomRight: Radius.circular(9),
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
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(9),
                                topRight: Radius.circular(9),
                              ),
                              bottom: BorderSide(color: AppColors.kBorderColor),
                              left: BorderSide(color: AppColors.kBorderColor),
                              right: BorderSide(color: AppColors.kBorderColor),
                            ),
                            columnWidths: {
                              0: FixedColumnWidth(150),
                              1: FixedColumnWidth(40),
                              2: FixedColumnWidth(70),
                            },
                            children: [
                              TableRow(
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                ),
                                children: [
                                  tableheadRow("Id"),
                                  tableheadRow("Status"),
                                  tableheadRow("Actions"),
                                ],
                              ),
                              ...List.generate(filteredmanger.length, (index) {
                                final manager = filteredmanger[index];
                                return buildTableRow(
                                  id: manager.employeeCode,
                                  showSwitch: true,
                                  switchValue: manager.refresh,
                                  onToggle: (bool value) {
                                    setState(() {
                                      filteredmanger[index].refresh = value;
                                    });
                                  },

                                  onEdit: () {
                                    final Managermodel selected = branches
                                        .firstWhere(
                                          (b) =>
                                              b.branchId.id ==
                                              manager.branchId.name,

                                          orElse:
                                              () =>
                                                  branches.isNotEmpty
                                                      ? branches[0]
                                                      : manager,
                                        );
                                    setState(() {
                                      selectedBranch = selected;
                                    });

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
                                        ..text = DateFormat(
                                          'yyyy-MM-dd',
                                        ).format(manager.dateOfJoining),

                                      nameController..text = manager.name,
                                      emailController..text = manager.email,
                                      addressController..text = manager.address,
                                      phonenumberController
                                        ..text = manager.phoneNumber.toString(),
                                      confirmController
                                        ..text = manager.password,
                                      pointamountController
                                        ..text = manager.pointAmount.toString(),
                                      salaryController
                                        ..text = manager.salary.toString(),
                                      passwordController
                                        ..text = manager.password,
                                      branches,
                                      isUpdate: true,
                                      managerid: manager.id,
                                    );
                                  },
                                  onDelete: () {
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

Future<void> _BranchManageropenDialog(
  BuildContext context,
  Managermodel? selectedBranch,
  Function(Managermodel) onBranchSelected,
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
  List<Managermodel> branches, {
  bool isUpdate = false,
  String? managerid,
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
                        isUpdate
                            ? "Update Branch Manager"
                            : "Create New Branch Manager",
                        style: FontStyles.heading,
                      ),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.close, color: AppColors.kBorderColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 23.h),
                  fullTextField(
                    title: "Employee Code",
                    controller: employecodeController,
                  ),
                  SizedBox(height: 10.h),
                  fullTextField(
                    title: "Date of Joining",

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
                  fullTextField(title: "Name", controller: nameController),
                  SizedBox(height: 10.h),
                  fullTextField(
                    title: "Email",
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 10.h),
                  fullTextField(
                    title: "Address",
                    controller: addressController,
                  ),
                  SizedBox(height: 10.h),
                  fullTextField(
                    title: "Phone Number",
                    keyboardType: TextInputType.phone,
                    controller: phonenumber,
                  ),
                  SizedBox(height: 10.h),
                  fullTextField(
                    title: "Password",
                    isPassword: true,
                    controller: passwordController,
                  ),
                  SizedBox(height: 10.h),
                  fullTextField(
                    title: "Confirm Password",
                    isPassword: true,
                    controller: confirmController,
                  ),
                  SizedBox(height: 10.h),
                  _buildDropdownField(
                    "Select Branch",
                    selectedBranch?.branchId.name,
                    branches.map((e) => e.branchId.name).toList(),
                    "Select Branch",
                    (selected) {
                      if (selected != null) {
                        final branch = branches.firstWhere(
                          (e) => e.branchId.name == selected,
                        );
                        onBranchSelected(branch);
                      }
                    },
                    context,
                  ),

                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Expanded(
                        child: fullTextField(
                          title: "Point Amount",
                          width: double.infinity,
                          keyboardType: TextInputType.number,
                          controller: pointamountController,
                        ),
                      ),
                      SizedBox(width: 13.w),
                      Expanded(
                        child: fullTextField(
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

                        final managerdata = {
                          "name": nameController.text.trim(),
                          "email": emailController.text.trim(),
                          "password": passwordController.text.trim(),
                          "position": "Manager",
                          "employee_code": employecodeController.text.trim(),
                          "phone_number":
                              int.tryParse(phonenumber.text.trim()) ?? 0,
                          "date_of_joining": formattedDate,
                          "address": addressController.text.trim(),
                          "head_administractor": true,
                          "point_amount":
                              int.tryParse(pointamountController.text.trim()) ??
                              0,
                          "salary":
                              int.tryParse(salaryController.text.trim()) ?? 0,
                          "branchId": selectedBranch?.branchId.id ?? "",
                        };
                        if (isUpdate && managerid != null) {
                          BlocProvider.of<ManagerBloc>(context).add(
                            updatemanger(managerid, updatedata: managerdata),
                          );
                        } else {
                          BlocProvider.of<ManagerBloc>(
                            context,
                          ).add(Addmanager(managerdata: managerdata));
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
                        BlocProvider.of<ManagerBloc>(
                          context,
                        ).add(fetchmanager());
                      },
                      child: Text(
                        isUpdate ? "Update" : "Create",
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
