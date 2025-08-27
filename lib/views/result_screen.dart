import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/mood_controller.dart';

class ResultScreen extends StatelessWidget {
  final int bpm;
  ResultScreen({required this.bpm});

  final controller = Get.find<MoodController>();

  String detectMood(int bpm) {
    if (bpm < 70) return "Calm 😌";
    if (bpm < 90) return "Normal 🙂";
    return "Stressed 😬";
  }

  @override
  Widget build(BuildContext context) {
    final mood = detectMood(bpm);

    return Scaffold(
      appBar: AppBar(title: Text("Result")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your BPM: $bpm"),
            SizedBox(height: 10),
            Text("Mood: $mood", style: TextStyle(fontSize: 22)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.addMood(mood);
                Get.back(); // return to home
              },
              child: Text("Save Mood"),
            )
          ],
        ),
      ),
    );
  }
}
