import 'package:flutter/material.dart';

/* 
Student Number  Student Name:
223060910    -  Moima TJ
223011345    -  Masitha KD
223018941    -  Madyira MCP
223029418    -  Maja ND
222010787    -  Nkuna LWT 
Question: Consultation view model
 */


class ConsultationViewModel with ChangeNotifier {
  final List<Map<String, String>> _consultations = [];

  List<Map<String, String>> get consultations => _consultations;

  void addConsultation(Map<String, String> consultation) {
    _consultations.add(consultation);
    notifyListeners();
  }

  void removeConsultation(int index) {
    _consultations.removeAt(index);
    notifyListeners();
  }
}
