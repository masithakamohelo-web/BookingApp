import 'package:consultation_booking_app/ViewModel/consultatin_view_model.dart';
import 'package:consultation_booking_app/ViewModel/profile_view_model.dart';
import 'package:consultation_booking_app/routes/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
/* 
Student Number  Student Name:
223060910    -  Moima TJ
223011345    -  Masitha KD
223018941    -  Madyira MCP
223029418    -  Maja ND
222010787    -  Nkuna LWT 
Question: Main.dart
 */

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ConsultationViewModel()),
        ChangeNotifierProvider(create: (context) => ProfileViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConsultationViewModel(),
      child: MaterialApp(
        title: 'Consultation Booking Application',
         debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: RouteManager.homeScreen,
        onGenerateRoute: RouteManager.generateRoute,
      ),
    );
  }
}
