import 'dart:async';

import 'package:audit_info/repository/Api/SRC/SRCapi.dart';
import 'package:audit_info/repository/model/SRCmodel.dart';
import 'package:audit_info/repository/model/accountant_modal.dart';
import 'package:audit_info/bloc/accountant/accountant_bloc.dart';
import 'package:audit_info/ui/loginpage.dart';
import 'package:audit_info/utils/FontStyle.dart';
import 'package:audit_info/utils/colors.dart';
import 'package:audit_info/utils/customDrawer.dart';
import 'package:audit_info/utils/table.dart';
import 'package:audit_info/utils/textfield.dart';
import 'package:audit_info/utils/updatepass_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Accountant extends StatefulWidget {
  const Accountant({super.key});

  @override
  State<Accountant> createState() => _AccountantState();
}

class _AccountantState extends State<Accountant> {
  int _selectedIndex = 2;
  bool toggle = false;
  void _onitemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  TextEditingController searchController = TextEditingController();
  List<AccountantModel> filteredAccounts = [];
  List<AccountantModel> AllAccounts = [];
  List<SrcModel> branches = [];

  SrcModel? selectedBranch;

  void initState() {
    super.initState();
    BlocProvider.of<AccountantBloc>(context).add(fetchAccountant());
    // context.read<AccountantBloc>().add(fetchAccountant());
    searchController.addListener(filterAccountsList);
  }

  Timer? _debounce;
  void filterAccountsList() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: 300), () {
      final query = searchController.text.toLowerCase();
      setState(() {
        filteredAccounts =
            AllAccounts.where((account) {
              return account.employeeCode.toLowerCase().contains(query) ||
                  account.name.toLowerCase().contains(query) ||
                  account.email.toLowerCase().contains(query) ||
                  account.phoneNumber.toLowerCase().contains(query) ||
                  (account.id.toString().toLowerCase().contains(query));
            }).toList();
      });
    });
  }

  Future<void> fetchbranch() async {
    try {
      final fetchbranches = await Srcapi().getsrc();
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

  TextEditingController employeeCodeController = TextEditingController();
  TextEditingController dateOfJoiningController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  @override
  void dispose() {
    searchController.removeListener(filterAccountsList);
    searchController.dispose();
    employeeCodeController.dispose();
    dateOfJoiningController.dispose();
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmpasswordcontroller.dispose();
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
        title: Text(" Accountant", style: FontStyles.heading),
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
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                        controller: searchController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xFF404A80),
                          ),
                          hintText: "search Accountant",
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
                      AccountantopenDialog(
                        context,
                        selectedBranch,
                        (value) {
                          setState(() {
                            selectedBranch = value;
                          });
                        },
                        employeeCodeController,
                        dateOfJoiningController,
                        nameController,
                        emailController,
                        addressController,
                        phoneController,
                        confirmpasswordcontroller,
                        passwordController,
                        salaryController,
                        branches,
                        isupdate: false,
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

              BlocBuilder<AccountantBloc, AccountantState>(
                builder: (context, state) {
                  if (state is Accountantblocloading) {
                    print("loading");

                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.kPrimaryColor,
                      ),
                    );
                  } else if (state is AccountantblocError) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icon/Group 99.png', height: 40.h),
                        SizedBox(height: 4.h),
                      ],
                    );
                  } else if (state is Accountantblocloaded) {
                    print("loaded..");
                    var allAccounts = state.Account;
                    if (searchController.text.isEmpty) {
                      filteredAccounts = allAccounts;
                    }
                    return Container(
                      width: 358.w,

                      decoration: BoxDecoration(
                        color: AppColors.kContainerColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),

                        border: Border(
                          top: BorderSide(color: AppColors.kBorderColor),
                          left: BorderSide(color: AppColors.kBorderColor),
                          right: BorderSide(color: AppColors.kBorderColor),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
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

                            bottom: BorderSide(color: AppColors.kBorderColor),
                          ),
                          columnWidths: const <int, TableColumnWidth>{
                            0: FixedColumnWidth(40), // E.Code
                            1: FixedColumnWidth(40), // Name
                            2: FixedColumnWidth(70), // Email
                            3: FixedColumnWidth(70), // Phone
                            4: FixedColumnWidth(50), // Status
                            5: FlexColumnWidth(50), // Actions
                          },

                          children: [
                            TableRow(
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                              ),
                              children: [
                                tableheadRow('E.Code'),
                                tableheadRow('Name'),
                                tableheadRow('Email'),
                                tableheadRow("phone number"),
                                tableheadRow('Status'),
                                tableheadRow('Actions'),
                              ],
                            ),

                            ...List.generate(filteredAccounts.length, (index) {
                              final account = filteredAccounts[index];
                              return _accountantRow(
                                code: account.employeeCode.toString(),
                                name: account.name.toString(),
                                email: account.email.toString(),
                                phone: account.phoneNumber.toString(),
                                status: account.status,
                                onToggle: (bool value) {
                                  filteredAccounts[index].status = value;
                                  BlocProvider.of<AccountantBloc>(context).add(
                                    UpdateAccount(
                                      updatedData: {"status": value},
                                      id: account.status.toString(),
                                    ),
                                  );
                                },

                                onEdit: () {
                                  //  final AccountantModel selected = branches.firstWhere(
                                  //                                   (e) => e.branchId?.id == account.?.name,
                                  //                                   orElse:
                                  //                                       () =>
                                  //                                           branches.isNotEmpty ? branches[0] : SRC,
                                  //                                 );
                                  //                                 setState(() {
                                  //                                   selectedBranch = selected;
                                  //                                 });

                                  AccountantopenDialog(
                                    context,
                                    selectedBranch,
                                    (value) {
                                      setState(() {
                                        selectedBranch = value;
                                      });
                                    },
                                    employeeCodeController
                                      ..text = account.employeeCode.toString(),
                                    dateOfJoiningController
                                      ..text = DateFormat(
                                        'yyyy-MM-dd',
                                      ).format(account.dateOfJoining),
                                    nameController..text = account.name,
                                    emailController..text = account.email,
                                    addressController..text = account.address,
                                    phoneController..text = account.phoneNumber,
                                    confirmpasswordcontroller
                                      ..text = account.password,
                                    passwordController..text = account.password,
                                    salaryController..text = "",
                                    branches,
                                    isupdate: true,
                                    accountId: account.id,
                                  );
                                },
                                onDelete: () {
                                  BlocProvider.of<AccountantBloc>(
                                    context,
                                  ).add(deleteaccount(id: account.id));
                                },
                              );
                            }),
                          ],
                        ),
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

TableRow _accountantRow({
  required String code,
  required String name,
  required String email,
  required String phone,
  required bool status,
  required VoidCallback onEdit,
  required VoidCallback onDelete,
  required ValueChanged<bool> onToggle,
}) {
  return TableRow(
    children: [
      cell(code),
      cell(name),
      cell(email),
      cell(phone),

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

      actionCell(onEdit, onDelete),
    ],
  );
}

Future<void> AccountantopenDialog(
  BuildContext context,
  SrcModel? selectedBranch,
  Function(SrcModel) onBranchSelected,
  TextEditingController employecodeController,
  TextEditingController dateOfJoiningController,
  TextEditingController nameController,
  TextEditingController emailController,
  TextEditingController addressController,
  TextEditingController phoneController,
  TextEditingController confirmpasswordcontroller,
  TextEditingController passwordController,
  TextEditingController salaryController,
  List<SrcModel> branches, {
  bool isupdate = false,
  String? accountId,
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
                        isupdate
                            ? "Update Accountant"
                            : "Create New Accountant ",
                        style: FontStyles.heading,
                      ),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.close, color: AppColors.kBorderColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),

                  fullTextField(
                    title: "Employee Code",
                    keyboardType: TextInputType.name,
                    controller: employecodeController,
                  ),
                  fullTextField(
                    title: "Date of Joining",
                    controller: dateOfJoiningController,
                    icon: Icons.calendar_today,
                    onTap: () async {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      ).then((pickedDate) {
                        if (pickedDate != null) {
                          dateOfJoiningController.text = DateFormat(
                            'yyyy-MM-dd',
                          ).format(pickedDate);
                        }
                      });
                    },

                    validator:
                        (Value) =>
                            Value!.isEmpty
                                ? "Date of Joining is required"
                                : null,
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
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
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
                    controller: confirmpasswordcontroller,
                  ),
                  SizedBox(height: 10.h),
                  DropdownField(
                    "Select Branch",
                    selectedBranch?.branchId?.name,
                    branches.map((e) => e.branchId!.name).toList(),
                    "Select Branch",
                    (selected) {
                      if (selected != null) {
                        final branch = branches.firstWhere(
                          (e) => e.branchId!.name == selected,
                        );
                        onBranchSelected(branch);
                      }
                    },
                    context,
                  ),
                  fullTextField(
                    title: "Salary",
                    keyboardType: TextInputType.number,
                    controller: salaryController,
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
                        if (passwordController.text !=
                            confirmpasswordcontroller.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Passwords do not match"),
                            ),
                          );
                          return;
                        }

                        String formattedDate = '';
                        try {
                          if (dateOfJoiningController.text.isNotEmpty) {
                            DateTime parsedDate = DateFormat(
                              'yyyy-MM-dd',
                            ).parse(dateOfJoiningController.text);
                            formattedDate = DateFormat(
                              'yyyy-MM-dd',
                            ).format(parsedDate);
                          }
                        } catch (e) {
                          formattedDate = dateOfJoiningController.text;
                        }

                        final Accountdata = {
                          'employee_code': employecodeController.text,
                          'date_of_joining': formattedDate,
                          'name': nameController.text,
                          'email': emailController.text,
                          'phone_number': phoneController.text,
                          'address': addressController.text,
                          'password': passwordController.text,
                          'state': true,
                          "branchId": selectedBranch?.branchId?.id ?? "",
                        };
                        if (isupdate && accountId != null) {
                          BlocProvider.of<AccountantBloc>(context).add(
                            UpdateAccount(
                              updatedData: Accountdata,
                              id: accountId,
                            ),
                          );
                        } else {
                          BlocProvider.of<AccountantBloc>(
                            context,
                          ).add(AddAccount(Accountdata: Accountdata));
                        }
                        if (!isupdate) {
                          employecodeController.clear();
                          dateOfJoiningController.clear();
                          nameController.clear();
                          emailController.clear();
                          phoneController.clear();
                          addressController.clear();
                          passwordController.clear();
                          confirmpasswordcontroller.clear();
                          salaryController.clear();
                        }
                        Navigator.pop(context);
                        BlocProvider.of<AccountantBloc>(
                          context,
                        ).add(fetchAccountant());
                      },
                      child: Text(
                        isupdate ? "Update" : "Create",
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
