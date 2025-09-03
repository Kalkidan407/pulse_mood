import 'package:flutter/material.dart';
import 'package:heart_bpm/heart_bpm.dart';
import './heartcont.dart';

class ScannerScreen extends StatefulWidget {
  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen>  with WidgetsBindingObserver{
  List<int> recentBPMs = [];
  int minBpm = 40;
  int maxBpm = 200;

  bool fingerDetected = false; // true when finger is on the camera
  bool scanningComplete = false;

  @override
  void initState(){
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
   void dispose(){
       WidgetsBinding.instance.removeObserver(this);
       super.dispose();
   }

    @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive || state == AppLifecycleState.paused) {
      setState(() {
        fingerDetected = false; // stop scanning
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scanner")),
      body: Column(
        children: [
          SizedBox(height: 15),
          HeartShape(),
        //  SizedBox(height: 10),
          Container(
            padding: EdgeInsets.only(top: 25, bottom: 40, left: 80, right: 50),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Show black until finger is detected
                // if (!fingerDetected)
                //   Container(
                //     height: 80,
                //     width: 65,
                //     color: Colors.black,
                //   ),

                // HeartBPM sensor
                fingerDetected ? 
                HeartBPMDialog(
                  context: context,
                  cameraWidgetHeight: 80,
                  cameraWidgetWidth: 65,
                  showTextValues: true,
                  borderRadius: 80,
                  centerLoadingWidget: Column(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 10),
                      Text(
                        "Initializing Sensor...",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),

                  // Detect finger using raw data
                  onRawData: (value) {
                    bool fingerOn = value.value > 0;
                    if (fingerOn != fingerDetected) {
                      setState(() {
                        fingerDetected = fingerOn;
                        if(!fingerOn){
                          recentBPMs.clear();
                        }
                      });
                      if (!fingerDetected) {

                        setState(() {
                          fingerDetected = true;
                          scanningComplete = false;
                          recentBPMs.clear();
                        });
                      }
                    } 
                  },

                  onBPM: (value) {
                    if (!fingerDetected) return; // ignore if no finger

                    if (value < minBpm || value > maxBpm) {
                      recentBPMs.clear();
                      return;
                    }

                    recentBPMs.add(value);
                    if (recentBPMs.length > 5) recentBPMs.removeAt(0);

                    double avg = recentBPMs.reduce((a, b) => a + b) / recentBPMs.length;

                    bool stable = recentBPMs.every((bpm) => (bpm - avg).abs() < 5);

                    if (stable && recentBPMs.length == 5) {
                      setState(() {
                        scanningComplete = true;
                        fingerDetected = false; // hide camera after complete
                      });
                      recentBPMs.clear();
                    }
                  },
                ): 
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 50, ),
                    height: 85,
                    width: 65,
              
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black
                    ),
                  ),
            
              ],
            ),
          ),
          SizedBox(height: 20),
          scanningComplete
              ? Text(
                  "Scan Complete!",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              : Text(
                  fingerDetected ? "Scanning..." : "Place your finger on the camera",
                  style: TextStyle(fontSize: 16),
                ),
        ],
      ),
    );
  }
}
