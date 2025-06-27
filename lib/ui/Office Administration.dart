import 'package:audit_info/Repositry/model/Adiministactor.dart';
import 'package:audit_info/bloc/Adiministactor/adiministactor_bloc.dart';
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

class Officeadministration extends StatefulWidget {
  const Officeadministration({super.key});

  @override
  State<Officeadministration> createState() => _OfficeadministrationState();
}

class _OfficeadministrationState extends State<Officeadministration> {
  List<Adiministactormodel> filteredAdimi = [];
  List<Adiministactormodel> allAdimi = [];
  final TextEditingController searchController = TextEditingController();
  Adiministactormodel? selectBranch;
  List<Adiministactormodel> branches = [];
  int _selectedIndex = 5;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AdiministactorBloc>(context).add(fetchAdiministactor());
    searchController.addListener(() {
      _filterAdministrators(searchController.text);
    });
  }

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

  void _filterAdministrators(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredAdimi = allAdimi;
      } else {
        filteredAdimi =
            allAdimi.where((admin) {
              return admin.name.toLowerCase().contains(query.toLowerCase()) ||
                  admin.employeeCode.toLowerCase().contains(
                    query.toLowerCase(),
                  ) ||
                  admin.phoneNumber.toLowerCase().contains(
                    query.toLowerCase(),
                  ) ||
                  admin.email.toLowerCase().contains(query.toLowerCase());
            }).toList();
      }
    });
  }

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
                                      _filterAdministrators('');
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
                      AdministratoropenDialog(
                        context,
                        (selectedBranch) {
                          setState(() {
                            selectBranch = selectedBranch;
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
                        _headAdminController,
                        selectBranch,
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
                    allAdimi = state.adiministactors;

                    _filterAdministrators(searchController.text);
                    return Container(
                      width: 358.w,
                      decoration: BoxDecoration(
                        color: AppColors.kContainerColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                        border: const Border(
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                        ),
                      ),
                      child: Table(
                        border: TableBorder(
                          borderRadius: BorderRadius.circular(4),
                          horizontalInside: const BorderSide(
                            color: AppColors.kBorderColor,
                          ),
                          verticalInside: const BorderSide(
                            color: AppColors.kBorderColor,
                          ),
                          bottom: const BorderSide(color: Colors.black),
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
                            decoration: BoxDecoration(color: Colors.grey[300]),
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
                                setState(() {
                                  filteredAdimi[index].status = value;
                                  BlocProvider.of<AdiministactorBloc>(
                                    context,
                                  ).add(
                                    UpdateAdimini(
                                      updatedata: {"status": value},
                                      id: admin.id,
                                    ),
                                  );
                                });
                              },
                              onEdit: () {
                                AdministratoropenDialog(
                                  context,
                                  (selectedBranch) {
                                    setState(() {
                                      selectBranch = selectedBranch;
                                    });
                                  },
                                  _employeeCodeController
                                    ..text = admin.employeeCode,
                                  _dateController,
                                  _nameController..text = admin.name,
                                  _emailController..text = admin.email,
                                  _addressController..text = admin.address,
                                  _phoneController..text = admin.phoneNumber,
                                  _passwordController..text = admin.password,
                                  _confirmPasswordController
                                    ..text = admin.password,
                                  _branchController..text = admin.branchId.id,
                                  _salaryController,
                                  _headAdminController
                                    ..text =
                                        admin.headAdministractor.toString(),
                                  selectBranch,
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
  TextEditingController headAdminController,
  Adiministactormodel? selectBranch,
  List<Adiministactormodel> branches, {
  bool isupdate = false,
  String? adminId,
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
                        dateController.text =
                            "${picked.day}/${picked.month}/${picked.year}";
                      }
                    },
                  ),
                  SizedBox(height: 10.h),
                  fullTextField(title: "Name", controller: nameController),
                  SizedBox(height: 10.h),
                  fullTextField(title: "Email", controller: emailController),
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
                    controller: confirmPasswordController,
                  ),
                  SizedBox(height: 10.h),
                  DropdownField(
                    "Select Branch",
                    selectBranch?.branchId.name,
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
                          title: "Salary",
                          keyboardType: TextInputType.number,
                          width: double.infinity,
                          controller: salaryController,
                        ),
                      ),
                      SizedBox(width: 13.w),
                      Expanded(
                        child: fullTextField(
                          title: "Head Administrator",
                          keyboardType: TextInputType.number,
                          controller: headAdminController,
                          width: 30,
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
                            const SnackBar(
                              content: Text("Passwords do not match"),
                            ),
                          );
                          return;
                        }

                        final adminData = {
                          'employee_code': employeeCodeController.text.trim(),
                          'date_of_joining': dateController.text.trim(),
                          'name': nameController.text.trim(),
                          'email': emailController.text.trim(),
                          'address': addressController.text.trim(),
                          'phone_number': phoneController.text.trim(),
                          'password':
                              passwordController.text
                                  .trim(), 
                          'position':
                              'Administrator', 
                          'branchId':
                              selectBranch?.branchId.id ??
                              '', // Ensure branchId is just the ID
                          'head_administractor':
                              headAdminController.text.trim() == "true"
                                  ? true
                                  : false,
                          'salary':
                              double.tryParse(salaryController.text.trim()) ??
                              0.0,
                          'status': true,
                          'is_admin': true, // Adjust based on your logic
                          'managerPoint': [], // Default empty list
                          'lead': [], // Default empty list
                          'registration': [], // Default empty list
                          'createdAt':
                              DateTime.now()
                                  .toIso8601String(), // Add current timestamp
                          'updatedAt':
                              DateTime.now()
                                  .toIso8601String(), // Add current timestamp
                          '__v': 0, // Default version
                        };

                        if (isupdate && adminId != null) {
                          BlocProvider.of<AdiministactorBloc>(context).add(
                            UpdateAdimini(id: adminId, updatedata: adminData),
                          );
                        } else {
                          BlocProvider.of<AdiministactorBloc>(
                            context,
                          ).add(AddAdimini(adiminiData: adminData));
                        }

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
                        headAdminController.clear();

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
      actionCell(onEdit, onDelete),
    ],
  );
}
