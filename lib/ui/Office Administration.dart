import 'package:audit_info/repository/Api/Adiministactor/Adiministactor_Api.dart';
import 'package:audit_info/repository/model/Adiministactor.dart';
import 'package:audit_info/bloc/administrator/adiministactor_bloc.dart';
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

class Officeadministration extends StatefulWidget {
  const Officeadministration({super.key});

  @override
  State<Officeadministration> createState() => _OfficeadministrationState();
}

class _OfficeadministrationState extends State<Officeadministration> {
  List<Adiministactormodel> filteredAdimi = [];
  List<Adiministactormodel> allAdimi = [];
  List<Adiministactormodel> branches = [];
  Adiministactormodel? selectBranch;

  int _selectedIndex = 5;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void initState() {
    super.initState();
    BlocProvider.of<AdiministactorBloc>(context).add(fetchAdiministactor());
    fetchAdimini();
    searchController.addListener(() {
      _filterAdministrators();
    });
  }

  void _filterAdministrators() async {
    final qeury = searchController.text.toLowerCase();
    setState(() {
      filteredAdimi =
          allAdimi.where((admin) {
            return admin.employeeCode.toLowerCase().contains(qeury) ||
                admin.name.toLowerCase().contains(qeury) ||
                admin.email.toLowerCase().contains(qeury) ||
                admin.phoneNumber.toLowerCase().contains(qeury) ||
                admin.branchId.toString().toLowerCase().contains(qeury);
          }).toList();
    });
  }

  Future<void> fetchAdimini() async {
    try {
      final fetchAdiminis = await AdiministactorApi().getAdiministactor();

      setState(() {
        branches = fetchAdiminis;
        if (branches.isNotEmpty) {
          selectBranch = branches[0];
        }
      });
    } catch (e) {
      throw Exception("fetchAdimini Error$e");
    }
  }

  final TextEditingController searchController = TextEditingController();
  final TextEditingController _employeeCodeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  final TextEditingController _headAdminController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    _employeeCodeController.dispose();
    _dateController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _branchController.dispose();
    _salaryController.dispose();
    _headAdminController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Customdrawer(
        onitemTapped: _onItemTapped,
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
        title: Text("Administrator", style: FontStyles.heading),
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
                MaterialPageRoute(builder: (context) => const Loginpage()),
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
                        controller: searchController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color(0xFF404A80),
                          ),
                          hintText: "Search",
                          hintStyle: FontStyles.body,
                          suffixIcon:
                              searchController.text.isNotEmpty
                                  ? IconButton(
                                    icon: const Icon(Icons.clear, size: 16),
                                    onPressed: () {
                                      searchController.clear();
                                      _filterAdministrators();
                                    },
                                  )
                                  : null,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: AppColors.kBorderColor,
                            ),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
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
                      _employeeCodeController.clear();
                      _dateController.clear();
                      _nameController.clear();
                      _emailController.clear();
                      _addressController.clear();
                      _phoneController.clear();
                      _passwordController.clear();
                      _confirmPasswordController.clear();
                      _branchController.clear();
                      _salaryController.clear();
                      AdministratoropenDialog(
                        context,
                        selectBranch,
                        (Value) {
                          setState(() {
                            selectBranch = Value;
                          });
                        },
                        _employeeCodeController,
                        _dateController,
                        _nameController,
                        _emailController,
                        _addressController,
                        _phoneController,
                        _passwordController,
                        _confirmPasswordController,
                        _branchController,
                        _salaryController,

                        branches,
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
              BlocBuilder<AdiministactorBloc, AdiministactorState>(
                builder: (context, state) {
                  if (state is AdiministactorLoading) {
                    print('loading..');
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.kPrimaryColor,
                      ),
                    );
                  } else if (state is AdiministactorError) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icon/Group 99.png', height: 40.h),
                        SizedBox(height: 4.h),
                      ],
                    );
                  } else if (state is AdiministactorLoaded) {
                    print('loaded..');
                    allAdimi = state.adiministactors;

                    if (searchController.text.isEmpty) {
                      filteredAdimi = allAdimi;
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
                            horizontalInside: BorderSide(
                              color: AppColors.kBorderColor,
                            ),
                            verticalInside: BorderSide(
                              color: AppColors.kBorderColor,
                            ),
                            bottom: BorderSide(color: AppColors.kBorderColor),
                          ),
                          columnWidths: const <int, TableColumnWidth>{
                            0: FixedColumnWidth(55), // E.Code
                            1: FixedColumnWidth(90), // Name
                            2: FixedColumnWidth(74), // Phone number
                            3: FixedColumnWidth(40), // Status
                            4: FixedColumnWidth(60), // Actions
                          },
                          children: [
                            TableRow(
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                              ),
                              children: [
                                tableheadRow("E.Code"),
                                tableheadRow("Name"),
                                tableheadRow("Phone number"),
                                tableheadRow("Status"),
                                tableheadRow("Actions"),
                              ],
                            ),
                            ...List.generate(filteredAdimi.length, (index) {
                              final admin = filteredAdimi[index];
                              return _AdiministationTableRow(
                                code: admin.employeeCode,
                                name: admin.name,
                                phone: admin.phoneNumber,
                                status: admin.status,
                                onToggle: (value) {
                                  filteredAdimi[index].status = value;
                                  BlocProvider.of<AdiministactorBloc>(
                                    context,
                                  ).add(
                                    UpdateAdimini(
                                      updatedata: {"status": value},
                                      id: admin.id,
                                    ),
                                  );
                                },
                                onEdit: () {
                                  final Adiministactormodel selected = branches
                                      .firstWhere(
                                        (e) =>
                                            e.branchId?.id ==
                                            admin.branchId?.name,
                                        orElse:
                                            () =>
                                                branches.isNotEmpty
                                                    ? branches[0]
                                                    : admin,
                                      );
                                  setState(() {
                                    selectBranch = selected;
                                  });
                                  AdministratoropenDialog(
                                    context,
                                    selectBranch,
                                    (Value) {
                                      setState(() {
                                        selectBranch = Value;
                                      });
                                    },
                                    _employeeCodeController
                                      ..text = admin.employeeCode,
                                    _dateController
                                      ..text = DateFormat(
                                        'yyyy-MM-dd',
                                      ).format(admin.dateOfJoining),

                                    _nameController..text = admin.name,
                                    _emailController..text = admin.email,
                                    _addressController..text = admin.address,
                                    _phoneController..text = admin.phoneNumber,
                                    _passwordController..text = admin.password,
                                    _confirmPasswordController
                                      ..text = admin.password,
                                    _branchController
                                      ..text = admin.branchId!.id,
                                    _salaryController,

                                    branches,
                                    isupdate: true,
                                    adminId: admin.id,
                                  );
                                },
                                onDelete: () {
                                  BlocProvider.of<AdiministactorBloc>(
                                    context,
                                  ).add(DeleteAdimini(id: admin.id));
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

Future<void> AdministratoropenDialog(
  BuildContext context,
  Adiministactormodel? selectBranch,
  Function(Adiministactormodel) onBranchSelected,
  TextEditingController employeeCodeController,
  TextEditingController dateController,
  TextEditingController nameController,
  TextEditingController emailController,
  TextEditingController addressController,
  TextEditingController phoneController,
  TextEditingController passwordController,
  TextEditingController confirmPasswordController,
  TextEditingController branchController,
  TextEditingController salaryController,
  List<Adiministactormodel> branches, {
  bool isupdate = false,
  String? adminId,
}) async {
  return showDialog(
    context: context,
    builder: (context) {
      bool headAdmin =
          isupdate ? (selectBranch?.headAdministractor ?? false) : false;
      Adiministactormodel? selectedBranch = selectBranch;

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
              child: StatefulBuilder(
                builder: (BuildContext context, StateSetter dialogSetState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            isupdate
                                ? "Update Administrator"
                                : "Create New Administrator",
                            style: FontStyles.heading,
                          ),
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(
                              Icons.close,
                              color: AppColors.kBorderColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 23.h),
                      fullTextField(
                        title: "Employee Code",
                        controller: employeeCodeController,
                      ),
                      SizedBox(height: 10.h),
                      fullTextField(
                        title: "Date of Joining",
                        icon: Icons.calendar_today,
                        controller: dateController,
                        onTap: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (picked != null) {
                            dateController.text = DateFormat(
                              'yyyy-MM-dd',
                            ).format(picked);
                          }
                        },
                      ),
                      SizedBox(height: 10.h),
                      fullTextField(
                        title: "Name",
                        controller: nameController,
                        keyboardType: TextInputType.name,
                      ),
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
                        controller: phoneController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Phone number is required';
                          } else if (value.length != 10) {
                            return 'Enter a valid 10-digit phone number';
                          } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                            return 'Only numbers are allowed';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 10.h),
                      fullTextField(
                        title: "Password",
                        isPassword: true,
                        controller: passwordController,
                        validator:
                            (Value) =>
                                Value!.isEmpty
                                    ? "Password is required"
                                    : Value.length < 6
                                    ? "Password must be at least 6 characters"
                                    : null,
                      ),
                      SizedBox(height: 10.h),
                      fullTextField(
                        title: "Confirm Password",
                        isPassword: true,
                        controller: confirmPasswordController,
                        validator:
                            (Value) =>
                                Value!.isEmpty
                                    ? "Confirm Password is required"
                                    : Value != passwordController.text
                                    ? "Passwords do not match"
                                    : null,
                      ),
                      SizedBox(height: 10.h),
                      DropdownField(
                        "Select Branch",
                        selectedBranch?.branchId?.name,
                        branches
                            .map((e) => e.branchId?.name)
                            .whereType<String>()
                            .toList(),
                        "Select Branch",
                        (selected) {
                          if (selected != null) {
                            final branch = branches.firstWhere(
                              (e) => e.branchId?.name == selected,
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
                              title: "Salary",
                              keyboardType: TextInputType.number,
                              width: double.infinity,
                              controller: salaryController,
                              validator:
                                  (Value) =>
                                      Value!.isEmpty
                                          ? "Salary is required"
                                          : null,
                            ),
                          ),
                          SizedBox(width: 13.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Head Administrator",
                                  style: FontStyles.body.copyWith(
                                    color: AppColors.kBorderColor,
                                  ),
                                ),
                                Checkbox(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  value: headAdmin,
                                  onChanged: (value) {
                                    dialogSetState(() {
                                      headAdmin = value ?? false;
                                    });
                                  },
                                  activeColor: AppColors.kPrimaryColor,
                                ),
                              ],
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
                            if (passwordController.text !=
                                confirmPasswordController.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Passwords do not match"),
                                ),
                              );
                              return;
                            }

                            if (employeeCodeController.text.isEmpty ||
                                dateController.text.isEmpty ||
                                nameController.text.isEmpty ||
                                emailController.text.isEmpty ||
                                addressController.text.isEmpty ||
                                phoneController.text.isEmpty ||
                                passwordController.text.isEmpty ||
                                selectedBranch?.branchId?.id == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("All fields are required"),
                                ),
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
                              print("Date parsing error: $e");
                              formattedDate = dateController.text;
                            }

                            final adminData = {
                              'employee_code': employeeCodeController.text,
                              'date_of_joining': formattedDate,
                              'name': nameController.text,
                              'email': emailController.text,
                              'address': addressController.text,
                              'phone_number': phoneController.text,
                              'branchId': selectedBranch!.branchId?.id,
                              'head_administractor': headAdmin,
                              'salary': salaryController.text,
                              "status": true,
                              "password": passwordController.text,
                            };

                            print("Sending adminData: $adminData");

                            if (isupdate && adminId != null) {
                              BlocProvider.of<AdiministactorBloc>(context).add(
                                UpdateAdimini(
                                  id: adminId,
                                  updatedata: adminData,
                                ),
                              );
                            } else {
                              BlocProvider.of<AdiministactorBloc>(
                                context,
                              ).add(AddAdimini(adiminiData: adminData));
                            }

                            onBranchSelected(selectedBranch);

                            if (!isupdate) {
                              employeeCodeController.clear();
                              dateController.clear();
                              nameController.clear();
                              emailController.clear();
                              addressController.clear();
                              phoneController.clear();
                              passwordController.clear();
                              confirmPasswordController.clear();
                              branchController.clear();
                              salaryController.clear();
                            }
                            Navigator.pop(context);
                            BlocProvider.of<AdiministactorBloc>(
                              context,
                            ).add(fetchAdiministactor());
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
                  );
                },
              ),
            ),
          ),
        ),
      );
    },
  );
}

TableRow _AdiministationTableRow({
  required String code,

  required String name,
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
      cell(phone),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Center(
          child: Transform.scale(
            scale: 0.6,
            child: Switch(
              value: status,
              onChanged: onToggle,
              activeColor: Colors.white,
              activeTrackColor: const Color(0xFF28AC24),
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey[400],
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ),
      ),
      actionCell(onEdit, onDelete),
    ],
  );
}
