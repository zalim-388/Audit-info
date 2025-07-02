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




  // Widget _actionButton({
  //   required IconData icon,
  //   required Color color,
  //   required VoidCallback onTap,
  // }) {
  //   return InkWell(
  //     onTap: onTap,
  //     child: Container(
  //       padding: EdgeInsets.all(8),
  //       decoration: BoxDecoration(
  //         color: color.withOpacity(0.1),
  //         borderRadius: BorderRadius.circular(8),
  //       ),
  //       child: Icon(icon, color: color, size: 20),
  //     ),
  //   );
  // }
