import 'package:consultation_booking_app/ViewModel/consultatin_view_model.dart';
import 'package:consultation_booking_app/views/add_consultation_screen.dart';
import 'package:consultation_booking_app/views/consultation_details_screen.dart';
import 'package:consultation_booking_app/views/profile_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/* 
Student Number  Student Name:
223060910    -  Moima TJ
223011345    -  Masitha KD
223018941    -  Madyira MCP
223029418    -  Maja ND
222010787    -  Nkuna LWT 
Question: Home screen
 */


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 24, 62, 159),
        title: Text('Consultation Booking'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            color: Colors.white,
            padding: EdgeInsets.only(right: 30, left: 25),
            tooltip: ('Profile'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              'My Consultation Diary 📅',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Consumer<ConsultationViewModel>(
              builder: (context, provider, child) {
                return provider.consultations.isEmpty
                    ? const Center(child: Text('No consultations booked.'))
                    : ListView.builder(
                      itemCount: provider.consultations.length,
                      itemBuilder: (context, index) {
                        final consultation = provider.consultations[index];
                        return ListTile(
                          title: Text(
                            consultation['description'] ?? 'No Description',
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => provider.removeConsultation(index),
                          ),
                          onTap:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => ConsultationDetailsScreen(
                                        consultation: consultation,
                                        index: index,
                                      ),
                                ),
                              ),
                        );
                      },
                    );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddConsultationScreen(),
            ),
          );
        },
        label: const Text('Add Consultation'),
        icon: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 24, 62, 159),
        unselectedItemColor: Color.fromARGB(224, 248, 247, 247),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 0,
        onTap: (index) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) =>
                      index == 0 ? const HomeScreen() : const ProfilePage(),
            ),
          );
        },
      ),
    );
  }
}
