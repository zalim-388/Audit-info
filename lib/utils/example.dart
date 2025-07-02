// import 'dart:convert';

// import 'package:audit_info/utils/FontStyle.dart';
// import 'package:audit_info/utils/colors.dart';
// import 'package:audit_info/utils/customDrawer.dart';
// import 'package:audit_info/utils/updatepass_sheet.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Agent extends StatefulWidget {
//   const Agent({super.key});

//   @override
//   State<Agent> createState() => _AgentState();
// }

// class _AgentState extends State<Agent> {
//   List<Map<String, dynamic>> Agentlist = [];
//   List<Map<String, dynamic>> filterAgent = [];

//   TextEditingController _namecontroller = TextEditingController();
//   TextEditingController _phonecontroller = TextEditingController();
//   TextEditingController _addresscontroller = TextEditingController();
//   TextEditingController searchcontroller = TextEditingController();

//   void initState() {
//     super.initState();
//     getdataAgent();
//   }

//   @override
//   void dispose() {
//     _namecontroller.dispose();
//     _phonecontroller.dispose();
//     _addresscontroller.dispose();
//     super.dispose();
//   }

//   Future<void> getdataAgent() async {
//     final prerf = await SharedPreferences.getInstance();
//     final String? data = prerf.getString("agents");
//     if (data != null) {
//       List<Map<String, dynamic>> allAgents = List<Map<String, dynamic>>.from(
//         jsonDecode(data),
//       );
//       setState(() {
//         Agentlist = allAgents;
//         filterAgent = allAgents;
//       });
//     }
//   }

//   Future<void> setAgentdata() async {
//     final prefs = await SharedPreferences.getInstance();
//     final agent = {
//       'name': _namecontroller.text.trim(),
//       'phone': _phonecontroller.text.trim(),
//       'address': _addresscontroller.text.trim(),
//     };
//     setState(() {
//       Agentlist.add(agent);
//       filterAgent = Agentlist;
//     });

//     await prefs.setString('agents', jsonEncode(Agentlist));

//     _namecontroller.clear();
//     _phonecontroller.clear();
//     _addresscontroller.clear();
//   }

//   int _selectedIndex = 6;
//   void _onitemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   void _filtersearch(String query) {
//     setState(() {
//       filterAgent =
//           Agentlist.where((agent) {
//             final name = agent['name']?.toLowerCase() ?? '';
//             final phone = agent['phone']?.toLowerCase() ?? '';
//             final address = agent['Address']?.toLowerCase() ?? '';
//             return name.contains(query.toLowerCase()) ||
//                 phone.contains(query.toLowerCase()) ||
//                 address.contains(query.toLowerCase());
//           }).toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Customdrawer(
//         onitemTapped: _onitemTapped,
//         SelectedIndex: _selectedIndex,
//       ),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 4,
//         shadowColor: Colors.grey.withOpacity(0.4),
//         systemOverlayStyle: SystemUiOverlayStyle.dark,
//         leading: Builder(
//           builder:
//               (context) => IconButton(
//                 icon: const Icon(Icons.more_vert, color: Colors.black),
//                 onPressed: () {
//                   Scaffold.of(context).openDrawer();
//                 },
//               ),
//         ),
//         title: Text("Agent", style: FontStyles.heading),
//         actions: [
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
//             child: GestureDetector(
//               onTap: () {
//                 showModalBottomSheet(
//                   context: context,
//                   isScrollControlled: true,
//                   builder: (context) => const UpdatepassSheet(),
//                 );
//               },
//               child: Container(
//                 height: 20.h,
//                 width: 22.w,
//                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage("assets/icon/updatepass.png"),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.logout_rounded, color: Color(0xFF414143)),
//           ),
//         ],
//       ),
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 23),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(height: 13.h),
//               Row(
//                 children: [
//                   Expanded(
//                     child: SizedBox(
//                       width: 322.w,
//                       height: 30.h,
//                       child: TextField(
//                         controller: searchcontroller,
//                         onChanged: _filtersearch,
//                         decoration: InputDecoration(
//                           prefixIcon: Icon(
//                             Icons.search,
//                             color: Color(0xFF404A80),
//                           ),
//                           hintText: "search",
//                           hintStyle: FontStyles.body,
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: AppColors.kBorderColor,
//                             ),
//                             borderRadius: BorderRadius.circular(7),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: AppColors.kBorderColor,
//                             ),
//                             borderRadius: BorderRadius.circular(7),
//                           ),
//                           fillColor: Colors.white,
//                           filled: true,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 6.w),
//                   Container(
//                     height: 20.h,
//                     width: 22.w,
//                     padding: const EdgeInsets.symmetric(horizontal: 8),
//                     decoration: const BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage("assets/icon/Group 199.png"),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 6.w),
//                   GestureDetector(
//                     onTap: () {
//                       _namecontroller.clear();
//                       _phonecontroller.clear();
//                       _addresscontroller.clear();
//                       _AgentopenDialog(
//                         context,
//                         _namecontroller,
//                         _phonecontroller,
//                         _addresscontroller,
//                         setAgentdata,
//                         isEdit: false,
//                       );
//                     },
//                     child: Container(
//                       height: 20.h,
//                       width: 22.w,
//                       padding: const EdgeInsets.symmetric(horizontal: 8),
//                       decoration: const BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage("assets/icon/Group 199.png"),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       child: Container(
//                         height: 28.h,
//                         width: 28.w,
//                         padding: const EdgeInsets.symmetric(horizontal: 8),
//                         decoration: const BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage("assets/icon/Group 189.png"),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 13.h),
//               Container(
//                 width: 358.w,
//                 decoration: BoxDecoration(
//                   color: AppColors.kContainerColor,
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(4),
//                     topRight: Radius.circular(4),
//                   ),
//                   border: Border(
//                     top: BorderSide(color: Colors.black),
//                     left: BorderSide(color: Colors.black),
//                     right: BorderSide(color: Colors.black),
//                   ),
//                 ),
//                 child: Table(
//                   border: TableBorder(
//                     borderRadius: BorderRadius.circular(4),
//                     horizontalInside: BorderSide(color: AppColors.kBorderColor),
//                     verticalInside: BorderSide(color: AppColors.kBorderColor),
//                     bottom: BorderSide(color: Colors.black),
//                   ),
//                   columnWidths: const <int, TableColumnWidth>{
//                     0: FixedColumnWidth(55),
//                     1: FixedColumnWidth(80),
//                     2: FixedColumnWidth(74),
//                     3: FixedColumnWidth(60),
//                     4: FixedColumnWidth(60),
//                   },
//                   children: [
//                     TableRow(
//                       decoration: BoxDecoration(color: Colors.grey[300]),
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 10.0),
//                           child: Text(
//                             'SI.NO',
//                             textAlign: TextAlign.center,
//                             style: GoogleFonts.poppins(
//                               fontSize: 10.sp,
//                               color: AppColors.kTextColor,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 10.0),
//                           child: Text(
//                             'Name',
//                             textAlign: TextAlign.center,
//                             style: GoogleFonts.poppins(
//                               fontSize: 10.sp,
//                               color: AppColors.kTextColor,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 10.0),
//                           child: Text(
//                             'Phone number',
//                             textAlign: TextAlign.center,
//                             style: GoogleFonts.poppins(
//                               fontSize: 10.sp,
//                               color: AppColors.kTextColor,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 10.0),
//                           child: Text(
//                             'Address',
//                             textAlign: TextAlign.center,
//                             style: GoogleFonts.poppins(
//                               fontSize: 10.sp,
//                               color: AppColors.kTextColor,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 10.0),
//                           child: Text(
//                             'Actions',
//                             textAlign: TextAlign.center,
//                             style: GoogleFonts.poppins(
//                               fontSize: 10.sp,
//                               color: AppColors.kTextColor,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     ...List.generate(Agentlist.length, (index) {
//                       final agent = Agentlist[index];
//                       return _AgentRow(
//                         code: (index + 1).toString(),
//                         name: agent['name'] ?? '',
//                         phone: agent['phone'] ?? '',
//                         Address: agent['address'] ?? '',
//                         onEdit: () {
//                           _namecontroller.text = agent['name'] ?? '';
//                           _phonecontroller.text = agent['phone'] ?? '';
//                           _addresscontroller.text = agent['address'] ?? '';
//                           _AgentopenDialog(
//                             context,
//                             _namecontroller,
//                             _phonecontroller,
//                             _addresscontroller,
//                             () async {
//                               setState(() {
//                                 Agentlist[index] = {
//                                   'name': _namecontroller.text.trim(),
//                                   'phone': _phonecontroller.text.trim(),
//                                   'address': _addresscontroller.text.trim(),
//                                 };
//                               });
//                               final prefs =
//                                   await SharedPreferences.getInstance();
//                               await prefs.setString(
//                                 'agents',
//                                 jsonEncode(Agentlist),
//                               );
//                             },
//                             isEdit: true,
//                           );
//                         },
//                         onDelete: () async {
//                           setState(() {
//                             Agentlist.removeAt(index);
//                           });
//                           final prefs = await SharedPreferences.getInstance();
//                           await prefs.setString(
//                             'agents',
//                             jsonEncode(Agentlist),
//                           );
//                         },
//                       );
//                     }),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// TableRow _AgentRow({
//   required String code,
//   required String name,
//   required String phone,
//   required String Address,
//   required VoidCallback onEdit,
//   required VoidCallback onDelete,
// }) {
//   return TableRow(
//     children: [
//       Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         child: Center(child: Text(code, style: FontStyles.body)),
//       ),
//       Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         child: Center(child: Text(name, style: FontStyles.body)),
//       ),
//       Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         child: Center(child: Text(phone, style: FontStyles.body)),
//       ),
//       Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         child: Center(child: Text(Address, style: FontStyles.body)),
//       ),
//       Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: 25.w,
//               height: 25.h,
//               decoration: BoxDecoration(
//                 color: const Color(0xFF4A60E4),
//                 borderRadius: BorderRadius.circular(4),
//               ),
//               alignment: Alignment.center,
//               child: GestureDetector(
//                 onTap: onEdit,
//                 child: Icon(Icons.edit, color: Colors.white, size: 16.sp),
//               ),
//             ),
//             SizedBox(width: 6.w),
//             Container(
//               width: 25.w,
//               height: 25.h,
//               decoration: BoxDecoration(
//                 color: const Color(0xFFFF4C4C),
//                 borderRadius: BorderRadius.circular(4),
//               ),
//               alignment: Alignment.center,
//               child: GestureDetector(
//                 onTap: onDelete,
//                 child: Icon(
//                   Icons.delete_outline,
//                   color: Colors.white,
//                   size: 16.sp,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ],
//   );
// }

// Future<void> _AgentopenDialog(
//   BuildContext context,
//   TextEditingController namecontroller,
//   TextEditingController phonecontroller,
//   TextEditingController addresscontroller,
//   Future<void> Function() setAgentdata, {
//   required bool isEdit,
// }) async {
//   return showDialog(
//     context: context,
//     builder: (context) {
//       return Dialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
//         child: Container(
//           width: 358.w,
//           height: 282.h,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(18),
//             color: Colors.white,
//           ),
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 20.h),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         isEdit ? "Edit Agent" : "Create Agents",
//                         style: FontStyles.heading,
//                       ),
//                       InkWell(
//                         onTap: () => Navigator.pop(context),
//                         child: Icon(Icons.close, color: AppColors.kBorderColor),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 9.h),
//                   _fullTextField(title: "Name", controller: namecontroller),
//                   SizedBox(height: 10.h),
//                   _fullTextField(
//                     title: "Phone Number",
//                     keyboardType: TextInputType.phone,
//                     controller: phonecontroller,
//                   ),
//                   SizedBox(height: 10.h),
//                   _fullTextField(
//                     title: "Address",
//                     controller: addresscontroller,
//                   ),
//                   SizedBox(height: 21.h),
//                   SizedBox(
//                     width: double.infinity,
//                     height: 30.h,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.orange,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(6),
//                         ),
//                       ),
//                       onPressed: () async {
//                         await setAgentdata();
//                         Navigator.pop(context);
//                       },
//                       child: Text(
//                         isEdit ? "Update" : "Create",
//                         style: GoogleFonts.inter(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }

// Widget _fullTextField({
//   required String title,
//   IconData? icon,
//   bool isPassword = false,
//   double? width,
//   TextInputType keyboardType = TextInputType.text,
//   required TextEditingController controller,
// }) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(title, style: FontStyles.body),
//       SizedBox(height: 4.h),
//       SizedBox(
//         height: 30.h,
//         width: width ?? 324.w,
//         child: TextField(
//           controller: controller,
//           keyboardType: keyboardType,
//           obscureText: isPassword,
//           decoration: InputDecoration(
//             hintStyle: GoogleFonts.poppins(fontSize: 12),
//             suffixIcon: icon != null ? Icon(icon, size: 18) : null,
//             contentPadding: EdgeInsets.symmetric(horizontal: 12),
//             filled: true,
//             fillColor: Colors.white,
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(6),
//               borderSide: BorderSide(color: AppColors.kBorderColor),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(6),
//               borderSide: BorderSide(color: AppColors.kBorderColor),
//             ),
//           ),
//         ),
//       ),
//     ],
//   );
// }

import 'package:audit_info/bloc/administrator/adiministactor_bloc.dart';
import 'package:audit_info/utils/FontStyle.dart';
import 'package:audit_info/utils/colors.dart';
import 'package:audit_info/utils/customDrawer.dart';
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
  int _selectedIndex = 5;
  final TextEditingController _searchController = TextEditingController();

  void _onitemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AdiministactorBloc>(context).add(fetchAdiministactor());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
        title: Text(" Administrator", style: FontStyles.heading),
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
                padding: EdgeInsets.symmetric(horizontal: 8),
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
      body: BlocConsumer<AdiministactorBloc, AdiministactorState>(
        listener: (context, state) {
          if (state is AdiministactorError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
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
                            controller: _searchController,
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
                          _showAddAdministratorDialog(context);
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
                  _buildAdministratorTable(state),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAdministratorTable(AdiministactorState state) {
    if (state is AdiministactorLoading) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50.h),
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
          ),
        ),
      );
    }

    if (state is AdiministactorLoaded) {
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
            horizontalInside: BorderSide(color: AppColors.kBorderColor),
            verticalInside: BorderSide(color: AppColors.kBorderColor),
            bottom: BorderSide(color: Colors.black),
          ),
          columnWidths: const <int, TableColumnWidth>{
            0: FixedColumnWidth(55),
            1: FixedColumnWidth(90),
            2: FixedColumnWidth(74),
            3: FixedColumnWidth(40),
            4: FixedColumnWidth(60),
          },
          children: [
            _buildTableHeader(),
            ...state.adiministactors.map(
              (admin) => _buildAdministrationRow(
                code: admin.employeeCode ?? "N/A",
                name: admin.name ?? "N/A",
                phone: admin.phoneNumber ?? "N/A",
                isActive: admin.status ?? false,
                onEdit: () => _showEditAdministratorDialog(context, admin),
                onDelete:
                    () => _showDeleteConfirmation(context, admin.id ?? ""),
                onToggleStatus: () => _toggleAdminStatus(admin),
              ),
            ),
          ],
        ),
      );
    }

    // Default fallback with static data
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
          horizontalInside: BorderSide(color: AppColors.kBorderColor),
          verticalInside: BorderSide(color: AppColors.kBorderColor),
          bottom: BorderSide(color: Colors.black),
        ),
        columnWidths: const <int, TableColumnWidth>{
          0: FixedColumnWidth(55),
          1: FixedColumnWidth(90),
          2: FixedColumnWidth(74),
          3: FixedColumnWidth(40),
          4: FixedColumnWidth(60),
        },
        children: [
          _buildTableHeader(),
          _buildAdministrationRow(
            code: "0000",
            name: "Salim",
            phone: "9562791690",
            onEdit: () {},
            onDelete: () {},
          ),
        ],
      ),
    );
  }

  TableRow _buildTableHeader() {
    return TableRow(
      decoration: BoxDecoration(color: Colors.grey[300]),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
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
          padding: const EdgeInsets.symmetric(vertical: 10.0),
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
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'Phone',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 10.sp,
              color: AppColors.kTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
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
          padding: const EdgeInsets.symmetric(vertical: 10.0),
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
    );
  }

  TableRow _buildAdministrationRow({
    required String code,
    required String name,
    required String phone,
    bool isActive = true,
    VoidCallback? onEdit,
    VoidCallback? onDelete,
    VoidCallback? onToggleStatus,
  }) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Center(child: Text(code, style: FontStyles.body)),
        ),
        Center(child: Text(name, style: FontStyles.body)),
        Center(child: Text(phone, style: FontStyles.body)),
        GestureDetector(
          onTap: onToggleStatus,
          child: Icon(
            isActive ? Icons.toggle_on : Icons.toggle_off,
            color: isActive ? Colors.green : Colors.grey,
            size: 31,
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

  void _toggleAdminStatus(dynamic admin) {
    // Implement toggle status functionality
    final updatedData = {'status': !(admin.status ?? false)};

    BlocProvider.of<AdiministactorBloc>(
      context,
    ).add(UpdateAdimini(id: admin.id ?? "", updatedata: updatedData));
  }

  void _showDeleteConfirmation(BuildContext context, String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure you want to delete this administrator?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                BlocProvider.of<AdiministactorBloc>(
                  context,
                ).add(DeleteAdimini(id: id));
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _showAddAdministratorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AddAdministratorDialog(),
    );
  }

  void _showEditAdministratorDialog(BuildContext context, dynamic admin) {
    showDialog(
      context: context,
      builder:
          (context) => AddAdministratorDialog(isEdit: true, adminData: admin),
    );
  }
}

class AddAdministratorDialog extends StatefulWidget {
  final bool isEdit;
  final dynamic adminData;

  const AddAdministratorDialog({Key? key, this.isEdit = false, this.adminData})
    : super(key: key);

  @override
  State<AddAdministratorDialog> createState() => _AddAdministratorDialogState();
}

class _AddAdministratorDialogState extends State<AddAdministratorDialog> {
  final _formKey = GlobalKey<FormState>();

  // Form Controllers
  final TextEditingController _employeeCodeController = TextEditingController();
  final TextEditingController _joiningDateController = TextEditingController();
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
  void initState() {
    super.initState();
    if (widget.isEdit && widget.adminData != null) {
      _populateFields();
    }
  }

  void _populateFields() {
    final admin = widget.adminData;
    _employeeCodeController.text = admin.employeeCode ?? '';
    _joiningDateController.text = admin.joiningDate ?? '';
    _nameController.text = admin.name ?? '';
    _emailController.text = admin.email ?? '';
    _addressController.text = admin.address ?? '';
    _phoneController.text = admin.phoneNumber ?? '';
    _branchController.text = admin.branch ?? '';
    _salaryController.text = admin.salary?.toString() ?? '';
    _headAdminController.text = admin.headAdmin?.toString() ?? '';
  }

  @override
  void dispose() {
    _employeeCodeController.dispose();
    _joiningDateController.dispose();
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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdiministactorBloc, AdiministactorState>(
      listener: (context, state) {
        if (state is AdiministactorLoaded) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                widget.isEdit
                    ? 'Administrator updated successfully!'
                    : 'Administrator added successfully!',
              ),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is AdiministactorError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is AdiministactorLoading;

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Container(
            width: 358.w,
            height: 683.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 20.h),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.isEdit
                                ? "Edit Administrator"
                                : "Create New Administrator",
                            style: FontStyles.heading,
                          ),
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.close,
                              color: AppColors.kBorderColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 23.h),

                      _buildTextField(
                        title: "Employee Code",
                        controller: _employeeCodeController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Employee code is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h),

                      _buildTextField(
                        title: "Date of Joining",
                        controller: _joiningDateController,
                        icon: Icons.calendar_today,
                        readOnly: true,
                        onTap: () => _selectDate(context),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Joining date is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h),

                      _buildTextField(
                        title: "Name",
                        controller: _nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Name is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h),

                      _buildTextField(
                        title: "Email",
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          if (!RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          ).hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h),

                      _buildTextField(
                        title: "Address",
                        controller: _addressController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Address is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h),

                      _buildTextField(
                        title: "Phone Number",
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Phone number is required';
                          }
                          if (value.length < 10) {
                            return 'Please enter a valid phone number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h),

                      if (!widget.isEdit) ...[
                        _buildTextField(
                          title: "Password",
                          controller: _passwordController,
                          isPassword: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10.h),

                        _buildTextField(
                          title: "Confirm Password",
                          controller: _confirmPasswordController,
                          isPassword: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10.h),
                      ],

                      _buildTextField(
                        title: "Select branch",
                        controller: _branchController,
                        icon: Icons.keyboard_arrow_down,
                        readOnly: true,
                        onTap: () => _showBranchSelection(context),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Branch selection is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h),

                      Row(
                        children: [
                          Expanded(
                            child: _buildTextField(
                              title: "Salary",
                              controller: _salaryController,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Salary is required';
                                }
                                if (double.tryParse(value) == null) {
                                  return 'Please enter a valid salary';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: 13.w),
                          Expanded(
                            child: _buildTextField(
                              title: "Head Administrator",
                              controller: _headAdminController,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  if (int.tryParse(value) == null) {
                                    return 'Please enter a valid number';
                                  }
                                }
                                return null;
                              },
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
                          onPressed: isLoading ? null : _submitForm,
                          child:
                              isLoading
                                  ? SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                      strokeWidth: 2,
                                    ),
                                  )
                                  : Text(
                                    widget.isEdit ? "Update" : "Create",
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
          ),
        );
      },
    );
  }

  Widget _buildTextField({
    required String title,
    required TextEditingController controller,
    IconData? icon,
    bool isPassword = false,
    bool readOnly = false,
    VoidCallback? onTap,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: FontStyles.body),
        SizedBox(height: 4.h),
        SizedBox(
          height: 30.h,
          width: 324.w,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: isPassword,
            readOnly: readOnly,
            onTap: onTap,
            validator: validator,
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
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _joiningDateController.text =
            "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  void _showBranchSelection(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Branch'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Main Branch'),
                onTap: () {
                  _branchController.text = 'Main Branch';
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('Secondary Branch'),
                onTap: () {
                  _branchController.text = 'Secondary Branch';
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('Third Branch'),
                onTap: () {
                  _branchController.text = 'Third Branch';
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final adminData = {
        'employeeCode': _employeeCodeController.text.trim(),
        'joiningDate': _joiningDateController.text.trim(),
        'name': _nameController.text.trim(),
        'email': _emailController.text.trim(),
        'address': _addressController.text.trim(),
        'phoneNumber': _phoneController.text.trim(),
        'branch': _branchController.text.trim(),
        'salary': double.tryParse(_salaryController.text.trim()) ?? 0.0,
        'headAdmin':
            _headAdminController.text.isNotEmpty
                ? int.tryParse(_headAdminController.text.trim())
                : null,
        'status': true, // Default status
      };
    }
  }
}


