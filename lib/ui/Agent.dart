import 'package:audit_info/Repositry/model/Agent_model.dart';
import 'package:audit_info/bloc/Agent/agent_bloc.dart';
import 'package:audit_info/ui/loginpage.dart';
import 'package:audit_info/utils/FontStyle.dart';
import 'package:audit_info/utils/colors.dart';
import 'package:audit_info/utils/customDrawer.dart';
import 'package:audit_info/utils/updatepass_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Agent extends StatefulWidget {
  const Agent({super.key});

  @override
  State<Agent> createState() => _AgentState();
}

class _AgentState extends State<Agent> {
  List<AgentModel> Agentlist = [];
  List<AgentModel> filterAgent = [];

  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _phonecontroller = TextEditingController();
  TextEditingController _addresscontroller = TextEditingController();
  TextEditingController searchcontroller = TextEditingController();

  void initState() {
    super.initState();
    BlocProvider.of<AgentBloc>(context).add(fetchAgent());
    _filtersearch("");
    _namecontroller.addListener(() {
      _filtersearch(searchcontroller.text);
    });
  }

  @override
  void dispose() {
    _namecontroller.dispose();
    _phonecontroller.dispose();
    _addresscontroller.dispose();
    super.dispose();
  }

  int _selectedIndex = 6;
  void _onitemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _filtersearch(String query) {
    setState(() {
      filterAgent =
          Agentlist.where((agent) {
            final name = agent.name.toLowerCase();
            final phone = agent.phoneNumber.toString().toLowerCase();
            final address = agent.address.toLowerCase();
            return name.contains(query.toLowerCase()) ||
                phone.contains(query.toLowerCase()) ||
                address.contains(query.toLowerCase());
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
        title: Text("Agent", style: FontStyles.heading),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => const UpdatepassSheet(),
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
                        controller: searchcontroller,
                        onChanged: _filtersearch,
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
                  SizedBox(width: 6.w),
                  Container(
                    height: 20.h,
                    width: 22.w,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/icon/Group 199.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 6.w),
                  GestureDetector(
                    onTap: () {
                      _namecontroller.clear();
                      _phonecontroller.clear();
                      _addresscontroller.clear();
                      _AgentopenDialog(
                        context,
                        _namecontroller,
                        _phonecontroller,
                        _addresscontroller,
                        isEdit: false,
                      );
                    },
                    child: Container(
                      height: 20.h,
                      width: 22.w,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/icon/Group 199.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
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
                  ),
                ],
              ),
              SizedBox(height: 13.h),

              BlocBuilder<AgentBloc, AgentState>(
                builder: (context, state) {
                  if (state is AgentBlocloading) {
                    print("loading");
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.kPrimaryColor,
                      ),
                    );
                  } else if (state is AgentBlocError) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icon/Group 99.png', height: 40.h),
                        SizedBox(height: 4.h),
                        Text("Error: ${state.error}"),
                      ],
                    );
                  } else if (state is AgentBlocloaded) {
                    var Agentlist = state.agent;
                    if (searchcontroller.text.isEmpty) {
                      filterAgent = Agentlist;
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
                          0: FixedColumnWidth(55),
                          1: FixedColumnWidth(80),
                          2: FixedColumnWidth(74),
                          3: FixedColumnWidth(60),
                          4: FixedColumnWidth(60),
                        },
                        children: [
                          TableRow(
                            decoration: BoxDecoration(color: Colors.grey[300]),
                            children: [
                              _tableheadRow(heading: 'SI.NO'),
                              _tableheadRow(heading: 'Name'),
                              _tableheadRow(heading: 'Phone Number'),
                              _tableheadRow(heading: 'Address'),
                              _tableheadRow(heading: 'Actions'),
                            ],
                          ),
                          ...List.generate(filterAgent.length, (index) {
                            final agent = filterAgent[index];
                            return _AgentRow(
                              code: (index + 1).toString(),
                              name: agent.name,
                              phone: agent.phoneNumber.toString(),
                              Address: agent.address,
                              onEdit: () {
                                _namecontroller.text = agent.name;
                                _phonecontroller.text =
                                    agent.phoneNumber.toString();
                                _addresscontroller.text = agent.address;
                                _AgentopenDialog(
                                  context,
                                  _namecontroller,
                                  _phonecontroller,
                                  _addresscontroller,
                                  isEdit: true,
                                  AgentId: agent.id,
                                );
                              },
                              onDelete: () async {
                                BlocProvider.of<AgentBloc>(
                                  context,
                                ).add(DeleteAgent(id: agent.id));
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

TableRow _AgentRow({
  required String code,
  required String name,
  required String phone,
  required String Address,
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
        child: Center(child: Text(phone, style: FontStyles.body)),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Center(child: Text(Address, style: FontStyles.body)),
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

Future<void> _AgentopenDialog(
  BuildContext context,
  TextEditingController namecontroller,
  TextEditingController phonecontroller,
  TextEditingController addresscontroller, {
  required bool isEdit,
  String? AgentId,
}) async {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Container(
          width: 358.w,
          height: 282.h,
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
                        isEdit ? "Edit Agent" : "Create Agents",
                        style: FontStyles.heading,
                      ),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.close, color: AppColors.kBorderColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 9.h),
                  _fullTextField(title: "Name", controller: namecontroller),
                  SizedBox(height: 10.h),
                  _fullTextField(
                    title: "Phone Number",
                    keyboardType: TextInputType.phone,
                    controller: phonecontroller,
                  ),
                  SizedBox(height: 10.h),
                  _fullTextField(
                    title: "Address",
                    controller: addresscontroller,
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
                      onPressed: () async {
                        if (namecontroller.text.isEmpty ||
                            phonecontroller.text.isEmpty ||
                            addresscontroller.text.isEmpty) {
                          print("Validation failed: All fields are required");
                          return;
                        }
                        // if (phonecontroller.text.length < 10) {
                        //   print(
                        //     "Validation failed: Phone number must be at least 10 digits",
                        //   );
                        //   return;
                        // }
                        final agendata = {
                          // "_id": AgentId ?? "",

                          "name": namecontroller.text.trim(),
                          "phone_number": phonecontroller.text.trim(),

                          "address": addresscontroller.text.trim(),

                          

                        };

                        if (isEdit && AgentId != null) {
                          BlocProvider.of<AgentBloc>(
                            context,
                          ).add(updateAgent(updatedata: agendata, id: AgentId));
                          Navigator.pop(context);
                        } else {
                          BlocProvider.of<AgentBloc>(
                            context,
                          ).add(AddAgent(agentData: agendata));
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        isEdit ? "Update" : "Create",
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
  required TextEditingController controller,
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
