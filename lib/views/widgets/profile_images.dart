import 'package:consultation_booking_app/ViewModel/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:provider/provider.dart';

/* 
Student Number  Student Name:
223060910    -  Moima TJ
223011345    -  Masitha KD
223018941    -  Madyira MCP
223029418    -  Maja ND
222010787    -  Nkuna LWT 
Question: Profile images
 */


class ProfileImage extends StatelessWidget {
  final File? image;
  final VoidCallback onImagePick;

  const ProfileImage({
    super.key,
    required this.image,
    required this.onImagePick,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewModel>(
      builder: (context, profileViewModel, child) {
        return GestureDetector(
          onTap: onImagePick,
          child: CircleAvatar(
            radius: 50,
            backgroundImage:
                profileViewModel.image != null
                    ? FileImage(profileViewModel.image!)
                    : NetworkImage('https://picsum.photos/250?image=9')
                        as ImageProvider,
            child: profileViewModel.image == null
                    ? Icon(Icons.camera_alt, size: 50, color: Colors.white)
                    : null,
          ),
        );
      },
    );
  }
}
