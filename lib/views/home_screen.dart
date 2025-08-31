import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:pulse_mood/views/history.dart';
import '../controllers/mood_controller.dart';
import 'scanner_screen.dart';
import 'summary_screen.dart';
//import '../views/summary_screen.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.find<MoodController>();


  void showBottomSheet(BuildContext context){
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20)
            )
          ),
           builder: (context){
            return DraggableScrollableSheet(
              initialChildSize: 0.4,
              minChildSize: 0.2,
              maxChildSize: 0.9,
              expand: false,
              builder: (context, ScrollController){
                return 
                       
             
             Obx(() => ListView.builder(
              itemCount: controller.moods.length,
              itemBuilder: (ctx, i) {
                final mood = controller.moods[i];
                return ListTile(
                  title: Text(mood.mood),
                  subtitle: Text(mood.date.toString()),
                );
              },
            ));
        
              
              }
              
              );
           },
           
           );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
     
      appBar: AppBar(
        title: 
        Center(
          child: 
        Text("Mood Checker")),
        actions: [


  IconButton(
            icon: const Icon( Icons.analytics_outlined),
            onPressed: () {
                showBottomSheet(context);
            },
          ),

            
       
        ],
        
        ),
      body: 
          Center(
       child: 
          IconButton(
            icon: Icon(Icons.favorite, size: 225,
               color: Colors.redAccent,),
            

            onPressed: () => Get.to(() => ScannerScreen()),
            //child: Text("Check My Mood"),
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
