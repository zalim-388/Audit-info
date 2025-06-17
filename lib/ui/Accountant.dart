import 'package:audit_info/Repositry/model/accountant_modal.dart';
import 'package:audit_info/bloc/accountant/accountant_bloc.dart';
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

  String? selectedBranch = 'Branch 1';

  void inistate() {
    super.initState();
    BlocProvider.of<AccountantBloc>(context).add(fetchAccountant());
  }

  void filterAccountsList() async {
    final query = searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredAccounts = AllAccounts;
      } else {
        filteredAccounts =
            AllAccounts.where((account) {
              return account.name.toLowerCase().contains(query) ||
                  account.email.toLowerCase().contains(query) ||
                  account.employeeCode.toLowerCase().contains(query) ||
                  account.phoneNumber.toLowerCase().contains(query);
            }).toList();
      }
    });
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
  // void dispose() {
  //   searchController.dispose();
  //   super.dispose();
  // }
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

                    return Center(child: CircularProgressIndicator());
                  } else if (state is AccountantblocError) {
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icon/Group 99.png', height: 40.h),
                        SizedBox(height: 4.h),
                      ],
                    );
                  } else if (state is Accountantblocloaded) {
                    var allAccounts = state.Account;
                    if (searchController.text.isEmpty) {
                      filteredAccounts = allAccounts;
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
                          0: FixedColumnWidth(50), // E.Code
                          1: FixedColumnWidth(50), // Name
                          2: FixedColumnWidth(70), // Email
                          3: FixedColumnWidth(74), // Phone
                          4: FixedColumnWidth(60), // Status
                          5: FixedColumnWidth(60),
                          6: FlexColumnWidth(60), // Actions
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
                                  'Email',
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

                          ...List.generate(filteredAccounts.length, (index) {
                            final account = filteredAccounts[index];
                            return _accountantRow(
                              code: account.employeeCode.toString(),
                              name: account.name.toString(),
                              email: account.email.toString(),
                              phone: account.phoneNumber.toString(),
                              status: account.status,
                              onToggle: (bool value) {
                                setState(() {
                                  filteredAccounts[index].status = value;
                                });
                              },

                              onEdit: () {
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
                                  salaryController..text = '',
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
  required VoidCallback onEdit,
  required VoidCallback onDelete,

  required ValueChanged<bool> onToggle,
  required bool status,
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
        child: Center(child: Text(email, style: FontStyles.body)),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Center(child: Text(phone, style: FontStyles.body)),
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

Future<void> AccountantopenDialog(
  BuildContext context,
  String? selectedBranch,
  Function(String) onBranchSelected,
  TextEditingController employecodeController,
  TextEditingController dateOfJoiningController,
  TextEditingController nameController,
  TextEditingController emailController,
  TextEditingController addressController,
  TextEditingController phoneController,
  TextEditingController confirmpasswordcontroller,
  TextEditingController passwordController,
  TextEditingController salaryController, {
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

                  _fullTextField(
                    title: "Employee Code",
                    keyboardType: TextInputType.name,
                    controller: employecodeController,
                  ),
                  _fullTextField(
                    title: "Date of Joining",
                    controller: dateOfJoiningController,
                    icon: Icons.calendar_today,
                    onTap: () async {
                      final dateRange = await showRangePickerDialog(
                        context: context,
                        initialDate: DateTime.now(),
                        minDate: DateTime(2021, 1, 1),
                        maxDate: DateTime(2025, 12, 31),
                      );

                      if (dateRange != null) {
                        dateOfJoiningController.text = DateFormat(
                          'yyyy-MM-dd',
                        ).format(dateRange.start);
                      }
                    },
                  ),
                  _fullTextField(title: "Name", controller: nameController),
                  SizedBox(height: 10.h),
                  _fullTextField(
                    title: "Email",
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 10.h),
                  _fullTextField(
                    title: "Address",
                    controller: addressController,
                  ),
                  SizedBox(height: 10.h),
                  _fullTextField(
                    title: "Phone Number",
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
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
                    controller: confirmpasswordcontroller,
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
                  _fullTextField(
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

                        employecodeController.clear();
                        dateOfJoiningController.clear();
                        nameController.clear();
                        emailController.clear();
                        phoneController.clear();
                        addressController.clear();
                        passwordController.clear();
                        confirmpasswordcontroller.clear();
                        salaryController.clear();
                        Navigator.pop(context);
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

Widget _fullTextField({
  required String title,
  IconData? icon,
  bool isPassword = false,
  double? width,
  TextInputType keyboardType = TextInputType.text,
  TextEditingController? controller,

  VoidCallback? onTap,
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
