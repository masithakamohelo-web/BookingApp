import 'package:consultation_booking_app/ViewModel/consultatin_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
/* 
Student Number  Student Name:
223060910    -  Moima TJ
223011345    -  Masitha KD
223018941    -  Madyira MCP
223029418    -  Maja ND
222010787    -  Nkuna LWT 
Question: Consultation details screen
 */


class ConsultationDetailsScreen extends StatelessWidget {
  final Map<String, String> consultation;
  final int index;

  const ConsultationDetailsScreen({
    super.key,
    required this.consultation,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 24, 62, 159),
        title: Text('Consultation Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date: ${consultation['date']}',
              style: const TextStyle(color: Colors.purple),
            ),
            Text(
              'Time: ${consultation['time']}',
              style: const TextStyle(color: Colors.purple),
            ),
            Text(
              'Description: ${consultation['description']}',
              style: const TextStyle(color: Colors.purple),
            ),
            Text(
              'Topic: ${consultation['topic']}',
              style: const TextStyle(color: Colors.purple),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            title: const Text('Delete Consultation'),
                            content: const Text(
                              'Are you sure sure you want to delete this consultation?',
                              style: TextStyle(color: Colors.purple),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Provider.of<ConsultationViewModel>(
                                    context,
                                    listen: false,
                                  ).removeConsultation(index);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                    );
                  },
                  child: const Text('Delete'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Back to Home'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
