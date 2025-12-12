import 'package:consultation_booking_app/views/add_consultation_screen.dart';
import 'package:consultation_booking_app/views/consultation_details_screen.dart';
import 'package:consultation_booking_app/views/home_screen.dart';
import 'package:consultation_booking_app/views/profile_page_screen.dart';
import 'package:flutter/material.dart';

/* 
Student Number  Student Name:
223060910    -  Moima TJ
223011345    -  Masitha KD
223018941    -  Madyira MCP
223029418    -  Maja ND
222010787    -  Nkuna LWT 
Question: Route manager
 */


class RouteManager {
  static const String homeScreen = '/';
  static const String profileScreen = '/profileScreen';
  static const String addConsultationScreen = '/addConsultationScreen';
  static const String consultationDetailsScreen = '/consultationDetailsScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case profileScreen:
        return MaterialPageRoute(builder: (context) => const ProfilePage());

      case addConsultationScreen:
        return MaterialPageRoute(
          builder: (context) => const AddConsultationScreen(),
        );

      case consultationDetailsScreen:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder:
              (context) => ConsultationDetailsScreen(
                consultation: args['consultation'],
                index: args['index'],
              ),
        );

      default:
        throw const FormatException('Oops!!! Page does not exist');
    }
  }
}
