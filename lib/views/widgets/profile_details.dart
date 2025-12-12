import 'package:consultation_booking_app/ViewModel/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/* 
Student Number  Student Name:
223060910    -  Moima TJ
223011345    -  Masitha KD
223018941    -  Madyira MCP
223029418    -  Maja ND
222010787    -  Nkuna LWT 
Question: Profile details screen
 */


class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewModel>(
      builder: (context, profileViewModel, child) {
        return Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Aligns everything to the left
          children: [
            Text(
              profileViewModel.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurpleAccent,
              ),
            ),
            Text(
              profileViewModel.role,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Text(
              'Email: ${profileViewModel.email}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Phone: ${profileViewModel.phoneNumber}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        );
      },
    );
  }
}
