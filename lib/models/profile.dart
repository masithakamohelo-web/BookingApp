import 'dart:io';

/* 
Student Number  Student Name:
223060910    -  Moima TJ
223011345    -  Masitha KD
223018941    -  Madyira MCP
223029418    -  Maja ND
222010787    -  Nkuna LWT 
Question: Profile
 */


class ProfileData {
  String name;
  String role;
  String email;
  String phoneNumber;
  File? image;

  ProfileData({
    required this.name,
    required this.role,
    required this.email,
    required this.phoneNumber,
    this.image,
 
 });

 // The 'update' method creates a new Profile instance with updated fields.
  ProfileData update({
    String? name,
    String? role,
    String? email,
    String? phone,
    String? profileImage,
  }) {
    return ProfileData(
      name: name ?? this.name,
      role: role ?? this.role,
      email: email ?? this.email,
      phoneNumber: phone ?? this.phoneNumber,
      image: image ?? this.image,
    );
  }
}