import 'package:audit_info/bloc/Adiministactor/adiministactor_bloc.dart';
import 'package:audit_info/bloc/Agent/agent_bloc.dart';
import 'package:audit_info/bloc/SRC/src_bloc_bloc.dart';
import 'package:audit_info/bloc/SRO/sro_bloc.dart';
import 'package:audit_info/bloc/accountant/accountant_bloc.dart';
import 'package:audit_info/bloc/manger/manager_bloc.dart';
import 'package:audit_info/ui/Agent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// String baseUrl = "http://192.168.1.83:3000/api";
final String baseurl = "https://audit-info-backend.onrender.com/api/";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ManagerBloc>(
          create: (BuildContext context) => ManagerBloc(),
        ),
        BlocProvider<AccountantBloc>(
          create: (BuildContext context) => AccountantBloc(),
        ),
        BlocProvider<SrcBlocBloc>(
          create: (BuildContext context) => SrcBlocBloc(),
        ),
        BlocProvider<SroBloc>(create: (BuildContext context) => SroBloc()),
        BlocProvider<AgentBloc>(create: (BuildContext context) => AgentBloc()),
        BlocProvider<AdiministactorBloc>(
          create: (BuildContext context) => AdiministactorBloc(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: Size(402, 874),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            // home: Loginpage(),
            // home: StudentHistory(),
            home: Agent(),
          );
        },
      ),
    );
  }
}



//  MultiBlocProvider(
//       providers: [],
//       child:







// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// void main() {
//   runApp(const AuditApp());
// }

// class AuditApp extends StatelessWidget {
//   const AuditApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(useMaterial3: true),
//       home: const AuditHomePage(),
//     );
//   }
// }

// class AuditHomePage extends StatefulWidget {
//   const AuditHomePage({Key? key}) : super(key: key);

//   @override
//   _AuditHomePageState createState() => _AuditHomePageState();
// }

// class _AuditHomePageState extends State<AuditHomePage> {
//   late List<_ChartData> leadsData;
//   late List<_ChartData> admissionData;
//   late TooltipBehavior _tooltip;

//   @override
//   void initState() {
//     super.initState();
//     // Data for Leads and Admission
//     leadsData = [
//       _ChartData('Jan', 0.5),
//       _ChartData('Feb', 3.0),
//       _ChartData('Mar', 1.0),
//       _ChartData('Apr', 2.0),
//       _ChartData('May', 4.0),
//     ];
//     admissionData = [
//       _ChartData('Jan', 1.0),
//       _ChartData('Feb', 1.0),
//       _ChartData('Mar', 2.0),
//       _ChartData('Apr', 0.5),
//       _ChartData('May', 3.0),
//     ];
//     _tooltip = TooltipBehavior(
//       enable: true,
//       format: 'point.x : point.y',
//       color: Colors.grey[800],
//       textStyle: const TextStyle(color: Colors.white),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
    
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Chart Section
//             Expanded(
//               flex: 2,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Select Branch Dropdown
//                   SizedBox(height: 16.0),
//                   // Pole Chart
//                   SizedBox(
//                     height: 300,
//                     child: SfCartesianChart(
//                       tooltipBehavior: _tooltip,
//                       primaryXAxis: CategoryAxis(
//                         majorGridLines: const MajorGridLines(width: 0),
//                       ),
//                       primaryYAxis: NumericAxis(
//                         minimum: 0,
//                         maximum: 4,
//                         interval: 0.5,
//                         majorGridLines: const MajorGridLines(width: 0),
//                       ),
//                       legend: const Legend(
//                         isVisible: true,
//                         position: LegendPosition.top,
//                       ),
//                       series: <CartesianSeries<_ChartData, String>>[
//                         ColumnSeries<_ChartData, String>(
//                           dataSource: leadsData,
//                           xValueMapper: (datum, _) => datum.x,
//                           yValueMapper: (datum, _) => datum.y,
//                           color: Colors.blue,
//                           width: 0.3,
//                           spacing: 0.1,
//                           name: 'Leads',
//                         ),
//                         ColumnSeries<_ChartData, String>(
//                           dataSource: admissionData,
//                           xValueMapper: (datum, _) => datum.x,
//                           yValueMapper: (datum, _) => datum.y,
//                           color: Colors.green,
//                           width: 0.3,
//                           spacing: 0.1,
//                           name: 'Admission',
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _ChartData {
//   const _ChartData(this.x, this.y);
//   final String x;
//   final double y;
// }
