import 'package:consultation_booking_app/models/profile.dart';
import 'package:flutter/material.dart';
import 'dart:io';

/* 
Student Number  Student Name:
223060910    -  Moima TJ
223011345    -  Masitha KD
223018941    -  Madyira MCP
223029418    -  Maja ND
222010787    -  Nkuna LWT 
Question: Profile view model
 */


class ProfileViewModel with ChangeNotifier {
  final ProfileData _profileData = ProfileData(
    name: 'Tshegofatso',
    role: 'Student',
    email: 'tshego@gmail.com',
    phoneNumber: '073 529 7345',
  );

  String get name => _profileData.name;
  String get role => _profileData.role;
  String get email => _profileData.email;
  String get phoneNumber => _profileData.phoneNumber;
  File? get image => _profileData.image;

  void updateName(String newName) {
    _profileData.name = newName;
    notifyListeners();
  }

  void updateRole(String newRole) {
    _profileData.role = newRole;
    notifyListeners();
  }

  void updateEmail(String newEmail) {
    _profileData.email = newEmail;
    notifyListeners();
  }

  void updatePhoneNumber(String newPhoneNumber) {
    _profileData.phoneNumber = newPhoneNumber;
    notifyListeners();
  }

  void updateImage(File newImage) {
    _profileData.image = newImage;
    notifyListeners();
  }
}
