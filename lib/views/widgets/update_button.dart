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
Question: update button
 */


class UpdateButton extends StatelessWidget {
  const UpdateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewModel>(
      builder: (context, profileViewModel, child) {
        return ElevatedButton(
          onPressed: () {
            profileViewModel.updateName('Tshegofatso Junior');
            profileViewModel.updateRole('Student');
            profileViewModel.updateEmail('tshegojunior@cut.ac.za');
            profileViewModel.updatePhoneNumber('081-637-6255');
            print("'updated'");
          },
          child: Text('Update Details'),
        );
      },
    );
  }
}
