import 'dart:io';

import 'package:consultation_booking_app/ViewModel/profile_view_model.dart';
import 'package:consultation_booking_app/views/widgets/profile_details.dart';
import 'package:consultation_booking_app/views/widgets/profile_images.dart';
import 'package:consultation_booking_app/views/widgets/update_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

/* 
Student Number  Student Name:
223060910    -  Moima TJ
223011345    -  Masitha KD
223018941    -  Madyira MCP
223029418    -  Maja ND
222010787    -  Nkuna LWT 
Question: Profile page screen
 */


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Provider.of<ProfileViewModel>(
        context,
        listen: false,
      ).updateImage(File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileViewModel = Provider.of<ProfileViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        backgroundColor: const Color.fromARGB(255, 24, 62, 159),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align everything to the left
          children: [
            ProfileImage(
              onImagePick: _pickImage,
              image: profileViewModel.image,
            ),
            const SizedBox(height: 10),
            const ProfileDetails(),
            const SizedBox(height: 10),
            const UpdateButton(),
          ],
        ),
      ),
    );
  }
}
