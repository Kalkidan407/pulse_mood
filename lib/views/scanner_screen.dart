import 'package:flutter/material.dart';
import 'package:heart_bpm/heart_bpm.dart';
import 'package:get/get.dart';
import 'package:pulse_mood/test.dart';
import '../controllers/mood_controller.dart';
import 'result_screen.dart';

class ScannerScreen extends StatefulWidget {
  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  int bpm = 0;
  int  minBpm = 40;
  int maxBpm = 200;
  List<int> recentBPMs = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scanner")),
      body: Center(
        child: HeartBPMDialog(
          context: context,
          onRawData: (value) {
            
          }, // can ignore
          onBPM: (value) {
  if(value < minBpm || value > maxBpm ){
  //   recentBPMs.add(value);
  
  //      if(recentBPMs.length >= 3){
  //       double avg = recentBPMs.reduce(
  //         (a,b) => a+ b)/recentBPMs.length;

  //         Get.to(
  //            () => ResultScreen(bpm: avg.toInt())
  //         );
  //         recentBPMs.clear();
  //      }

  // } else{

    recentBPMs.clear();
    return;
  }

  recentBPMs.add(value);

if( recentBPMs.length > 5){
  recentBPMs.removeAt(0);
}

     double avg = recentBPMs.reduce(
      (a,b) => a + b
     )/ recentBPMs.length;
     bool stable  = recentBPMs.every(
       (bpm) => (bpm - avg).abs() < 5
     );
     if(stable && recentBPMs.length == 5){
      Get.to( () => ResultScreen(bpm: avg.toInt()));
      recentBPMs.clear();
     }

          },
        ),
      ),
    );
  }
}
