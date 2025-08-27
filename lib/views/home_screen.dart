import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_mood/views/history.dart';
import '../controllers/mood_controller.dart';
import 'scanner_screen.dart';
import 'summary_screen.dart';
//import '../views/summary_screen.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.find<MoodController>();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
     
      appBar: AppBar(
        title: 
        Center(
          child: 
        Text("Mood Checker")),
        actions: [

          FloatingActionButton(

            backgroundColor: Colors.white,
            onPressed: () {
             Get.to(History());

            },
            child: Icon(
              Icons.analytics_outlined
            ),
            
            
            )
        ],
        
        ),
      body: 
          Center(
       child: 
          ElevatedButton(
            onPressed: () => Get.to(() => ScannerScreen()),
            child: Text("Check My Mood"),
          ),
          )
          // ElevatedButton(
          //   onPressed: () => Get.to(() => summary_scre),
          //   child: Text("View Summary"),
          // ),
          // Expanded(
          //   child: Obx(() => ListView.builder(
          //     itemCount: controller.moods.length,
          //     itemBuilder: (ctx, i) {
          //       final mood = controller.moods[i];
          //       return ListTile(
          //         title: Text(mood.mood),
          //         subtitle: Text(mood.date.toString()),
          //       );
          //     },
          //   )),
          // )
        
      
    );
  }
}
