import 'package:flutter/material.dart';
import 'package:heart_bpm/heart_bpm.dart';
import 'package:get/get.dart';
//get/get_core/src/get_main.dart

import 'package:get/get_core/src/get_main.dart';
import 'package:pulse_mood/test.dart';
import './heartcont.dart';
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
  bool isScanning = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scanner")),
      body: 
      Column(
        children: [
          SizedBox(height: 20,),

Container(
  child: HeartShape(),
),

SizedBox(height: 35,),

      Container(
        padding: EdgeInsets.only(top: 25, bottom: 40, left: 90, right: 50 ),
        child: 
        isScanning ?
        HeartBPMDialog(
          context: context,
          cameraWidgetHeight: 80,
          cameraWidgetWidth:65,
          showTextValues: true,
          borderRadius: 80,
          centerLoadingWidget: Column(
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 10,),
              Text("Initializing Sensor..." , style: TextStyle(color: Colors.black),),

            ],
          ),

          onRawData: (value) {
            
          }, // can ignore

        onBPM: (value) {

   if (!isScanning) return;
  if(value < minBpm || value > maxBpm ){
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

  final avgInt = avg.toInt();
  setState(
    () => isScanning = false
  );



     bool stable  = recentBPMs.every(
       (bpm) => (bpm - avg).abs() < 5
     );
     
     if(stable && recentBPMs.length == 5){
      setState(() {
        isScanning = false;
      });
      recentBPMs.clear();
      
     
     // recentBPMs.clear();
     }

//       Get.to(
//     () => ResultScreen(
//         bpm: avgInt)
    
//     )?.then(
//         (_) {
//   setState(() => isScanning = true); // restart when user returns
// }
// );

          },
        ) :
       Center(
        child: ElevatedButton.icon(
            icon: Icon(Icons.favorite_rounded),
            label: Text(isScanning
                ? "Stop measurement" : "Measure BPM"),
            onPressed: () => setState(() =>
                isScanning = !isScanning 
            ),
        ),
      ),
      ),
        ]
      )
    );
  }
}
