import 'package:consultation_booking_app/ViewModel/consultatin_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

/* 
Student Number  Student Name:
223060910    -  Moima TJ
223011345    -  Masitha KD
223018941    -  Madyira MCP
223029418    -  Maja ND
222010787    -  Nkuna LWT 
Question: add consultation screen
 */


class AddConsultationScreen extends StatelessWidget {
  const AddConsultationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController topicController = TextEditingController();
    final TextEditingController dateController = TextEditingController();
    final TextEditingController timeController = TextEditingController();
    final TextEditingController descriptionsController =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 24, 62, 159),
        title: const Text('Book a Consultation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: dateController,
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(labelText: 'Date'),
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                );
                if (picked != null) {
                  dateController.text = DateFormat('yyyy-MM-dd').format(picked);
                }
              },
            ),
            TextField(
              controller: timeController,
              decoration: const InputDecoration(labelText: 'Time'),
              onTap: () async {
                final TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (picked != null) {
                  // ignore: use_build_context_synchronously
                  timeController.text = picked.format(context);
                }
              },
            ),
            TextField(
              controller: descriptionsController,
              decoration: const InputDecoration(labelText: 'Descriptions'),
            ),
            TextField(
              controller: topicController,
              decoration: const InputDecoration(labelText: 'Topic'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (descriptionsController.text.isNotEmpty &&
                    dateController.text.isNotEmpty &&
                    timeController.text.isNotEmpty &&
                    topicController.text.isNotEmpty) {
                  // Creating a proper consultation object
                  final consultation = {
                    'date': dateController.text,
                    'time': timeController.text,
                    'topic': topicController.text,
                    'description': descriptionsController.text,
                  };

                  Provider.of<ConsultationViewModel>(
                    context,
                    listen: false,
                  ).addConsultation(consultation);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Consultation booked successfully!'),
                    ),
                  );
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill in all fields!')),
                  );
                }
              },

              child: const Text('Save Consultation'),
            ),
          ],
        ),
      ),
    );
  }
}
