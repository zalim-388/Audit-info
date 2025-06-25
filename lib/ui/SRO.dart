import 'package:audit_info/Repositry/Api/SRO/sroapi.dart';
import 'package:audit_info/Repositry/model/SRO_model.dart';
import 'package:audit_info/bloc/SRO/sro_bloc.dart';
import 'package:audit_info/ui/loginpage.dart';
import 'package:audit_info/utils/FontStyle.dart';
import 'package:audit_info/utils/colors.dart';
import 'package:audit_info/utils/customDrawer.dart';
import 'package:audit_info/utils/textfield.dart';
import 'package:audit_info/utils/updatepass_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Sro extends StatefulWidget {
  const Sro({super.key});

  @override
  State<Sro> createState() => _SroState();
}

class _SroState extends State<Sro> {
  List<SroModel> filledsro = [];
  List<SroModel> Allsro = [];
  List<SroModel> branches = [];
  SroModel? selectedBranch;
  SroModel? selectedSRC;
  int _selectedIndex = 4;
  void _onitemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void initState() {
    super.initState();
    BlocProvider.of<SroBloc>(context).add(fetchSro());
    searchController.addListener(filtersroList);

    // fetchsrobranch();
  }

  void filtersroList() async {
    final qeury = searchController.text.toLowerCase();
    setState(() {
      filledsro =
          Allsro.where((Src) {
            return Src.employeeCode.toLowerCase().contains(qeury) ||
                Src.name.toLowerCase().contains(qeury) ||
                Src.email.toLowerCase().contains(qeury) ||
                Src.phoneNumber.toLowerCase().contains(qeury) ||
                Src.branchId.toString().toLowerCase().contains(qeury);
          }).toList();
    });
  }

  Future<void> fetchsrobranch() async {
    try {
      final fetchsrcbranches = await Sroapi().getsro();

      setState(() {
        branches = fetchsrcbranches;
        if (branches.isNotEmpty) {
          selectedBranch = branches[0];
        }
      });
    } catch (e) {
      throw Exception("fetchsrcbranch Error$e");
    }
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
        title: Text(" SRO", style: FontStyles.heading),
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
                  SizedBox(width: 7.w),
                  GestureDetector(
                    onTap: () {
                      SROopenDialog(
                        context,
                        selectedBranch,
                        selectedSRC,
                        (value) {
                          setState(() {
                            selectedBranch = value;
                          });
                        },
                        branches,
                        employecodeController,
                        dateController,
                        nameController,
                        emailController,
                        addressController,
                        phonenumber,
                        passwordController,
                        confirmController,
                        pointamountController,
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

              BlocBuilder<SroBloc, SroState>(
                builder: (context, state) {
                  if (state is SroBlocloading) {
                    print("loading");
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.kPrimaryColor,
                      ),
                    );
                  } else if (state is srcblocError) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icon/Group 99.png', height: 40.h),
                        SizedBox(height: 4.h),
                      ],
                    );
                  } else if (state is sroBlocloaded) {
                    Allsro = state.SRO;
                    if (searchController.text.isEmpty) {
                      filledsro = Allsro;
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
                          2: FixedColumnWidth(30), // Branch Name
                          3: FixedColumnWidth(30), //SRC
                          4: FixedColumnWidth(60), // Phone Number
                          5: FixedColumnWidth(30), // Point Amount
                          6: FixedColumnWidth(40), // Status (toggle)
                          7: FixedColumnWidth(80), // Actions (icons)
                        },

                        children: [
                          TableRow(
                            decoration: BoxDecoration(color: Colors.grey[300]),
                            children: [
                              _tableheadRow(heading: "E.Code"),
                              _tableheadRow(heading: "Name"),
                              _tableheadRow(heading: "Branch Name"),
                              _tableheadRow(heading: "SRC"),
                              _tableheadRow(heading: "phone Number"),
                              _tableheadRow(heading: "Point Amount"),
                              _tableheadRow(heading: "Status"),
                              _tableheadRow(heading: "Actions"),
                            ],
                          ),

                          ...List.generate(filledsro.length, (index) {
                            final sro = filledsro[index];
                            return _SroRow(
                              code: sro.employeeCode,
                              name: sro.name,
                              Branchname: sro.branchId.toString(),
                              SRC: sro.srcId,
                              phone: sro.phoneNumber,
                              PointAmount: sro.pointAmount.toString(),
                              onEdit: () {
                                final SroModel selectedsro = branches
                                    .firstWhere(
                                      (e) =>
                                          (e.branchId?.id ?? "") ==
                                          (sro.branchId?.name ?? ""),
                                      orElse:
                                          () =>
                                              branches.isNotEmpty
                                                  ? branches[0]
                                                  : sro,
                                    );
                                setState(() {
                                  selectedBranch = selectedsro;
                                });
                                SROopenDialog(
                                  context,
                                  selectedBranch,
                                  selectedSRC,
                                  (value) {
                                    setState(() {
                                      selectedBranch = value;
                                    });
                                  },
                                  branches,
                                  employecodeController,
                                  dateController,
                                  nameController,
                                  emailController,
                                  addressController,
                                  phonenumber,
                                  passwordController,
                                  confirmController,
                                  pointamountController,
                                  salaryController,
                                  isUpdate: true,
                                  sroid: sro.id,
                                );
                              },
                              onDelete: () {
                                BlocProvider.of<SroBloc>(
                                  context,
                                ).add(deletesro(id: sro.id));
                              },
                              status: sro.status,
                              onToggle: (value) {
                                filledsro[index].status = value;
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

TableRow _SroRow({
  required String code,
  required String name,
  required String Branchname,
  required String SRC,
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
        child: Center(child: Text(SRC, style: FontStyles.body)),
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

Future<void> SROopenDialog(
  BuildContext context,
  SroModel? selectedBranch,
  SroModel? selectedSRC,
  Function(SroModel) onBranchSelected,
  List<SroModel> branch,
  employecodeController,
  dateController,
  nameController,
  emailController,
  addressController,
  phonenumber,
  passwordController,
  confirmController,
  pointamountController,
  salaryController, {
  bool isUpdate = false,
  String? sroid,
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
                        isUpdate ? "Update SRO" : "Create New SRO",
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
                    controller: dateController,
                    keyboardType: TextInputType.datetime,
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
                    controller: phonenumber,
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
                    controller: confirmController,
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Expanded(
                        child: _buildDropdownField(
                          "select branch",
                          selectedBranch?.branchId?.name ?? "Select branch",
                          branch
                              .map((s) => s.branchId?.name)
                              .whereType<String>()
                              .toList(),
                          "select branch",
                          (selected) {
                            if (selected != null) {
                              final Branches = branch.firstWhere(
                                (s) => s.branchId?.name == selected,
                                orElse:
                                    () =>
                                        branch.isNotEmpty
                                            ? branch[0]
                                            : SroModel(
                                              id: "",
                                              name: "",
                                              email: "",
                                              password: "",
                                              position: "",
                                              employeeCode: "",
                                              phoneNumber: "",
                                              dateOfJoining: DateTime.now(),
                                              address: "",
                                              status: false,
                                              pointAmount: 0,
                                              isAdmin: false,
                                              headAdministractor: false,
                                              branchId: BranchId(
                                                id: "",
                                                name: "",
                                                code: "",
                                                status: false,
                                                createdAt: DateTime.now(),
                                                updatedAt: DateTime.now(),
                                                v: 0,
                                              ),
                                              managerPoint: [],
                                              srcId: "",
                                              lead: [],
                                              registration: [],
                                              createdAt: DateTime.now(),
                                              updatedAt: DateTime.now(),
                                              v: 0,
                                            ),
                              );
                              onBranchSelected(Branches);
                            }
                          },
                          context,
                        ),
                      ),
                      SizedBox(width: 13.w),
                      Expanded(
                        child: _buildDropdownField(
                          "Select SRC",
                          selectedSRC?.srcId ?? "Select SRC",
                          branch
                              .map((s) => s.srcId)
                              .whereType<String>()
                              .toList(),
                          "select SRC",
                          (selected) {
                            if (selected != null) {
                              final Branches = branch.firstWhere(
                                (s) => s.srcId == selected,
                                orElse:
                                    () =>
                                        branch.isNotEmpty
                                            ? branch[0]
                                            : SroModel(
                                              id: "",
                                              name: "",
                                              email: "",
                                              password: "",
                                              position: "",
                                              employeeCode: "",
                                              phoneNumber: "",
                                              dateOfJoining: DateTime.now(),
                                              address: "",
                                              status: false,
                                              pointAmount: 0,
                                              isAdmin: false,
                                              headAdministractor: false,
                                              branchId: BranchId(
                                                id: "",
                                                name: "",
                                                code: "",
                                                status: false,
                                                createdAt: DateTime.now(),
                                                updatedAt: DateTime.now(),
                                                v: 0,
                                              ),
                                              managerPoint: [],
                                              srcId: "",
                                              lead: [],
                                              registration: [],
                                              createdAt: DateTime.now(),
                                              updatedAt: DateTime.now(),
                                              v: 0,
                                            ),
                              );
                              onBranchSelected(Branches);
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
                        child: fullTextField(
                          title: "Point Amount",
                          width: double.infinity,
                          controller: pointamountController,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(width: 13.w),
                      Expanded(
                        child: fullTextField(
                          title: "Salary",
                          width: double.infinity,
                          controller: salaryController,
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
                        final sroData = {
                          "employee_code": employecodeController.text,
                          "dateOfJoining": formattedDate,
                          "name": nameController.text,
                          "email": emailController.text,
                          "address": addressController.text,
                          "phoneNumber": phonenumber.text,
                          "password": passwordController.text,
                          "branchId": selectedBranch?.branchId?.id ?? "",
                          "srcId": selectedSRC?.srcId ?? "",
                          "pointAmount":
                              double.tryParse(pointamountController.text) ??
                              0.0,
                          "salary":
                              double.tryParse(salaryController.text) ?? 0.0,
                          "status": true,
                        };
                        if (isUpdate && sroid != null) {
                          BlocProvider.of<SroBloc>(
                            context,
                          ).add(updatesro(updatedata: sroData, id: sroid));
                        } else {
                          BlocProvider.of<SroBloc>(
                            context,
                          ).add(Addsro(srodata: sroData));
                        }
                        Navigator.pop(context);
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

// SizedBox(
//   width: 322.w,
//   height: 30.h,
//   child: ValueListenableBuilder(
//     valueListenable: searchController,
//     builder: (context, value, child) {
//       filtersroList();
//       return TextField(
//         controller: searchController,
//         decoration: InputDecoration(
//           prefixIcon: Icon(Icons.search, color: Color(0xFF404A80)),
//           hintText: "Search",
//           hintStyle: FontStyles.body,
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: AppColors.kBorderColor),
//             borderRadius: BorderRadius.circular(7),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: AppColors.kBorderColor),
//             borderRadius: BorderRadius.circular(7),
//           ),
//           fillColor: Colors.white,
//           filled: true,
//         ),
//       );
//     },
//   ),
