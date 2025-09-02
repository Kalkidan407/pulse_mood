import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:pulse_mood/views/history.dart';
import '../controllers/mood_controller.dart';
import 'scanner_screen.dart';
import 'summary_screen.dart';
import 'package:pulse_mood/thme/themeService.dart';
import 'package:google_fonts/google_fonts.dart';
//import '../views/summary_screen.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.find<MoodController>();
   final themeServices = ThemeService();


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
     backgroundColor: Colors.white ,
   
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: 
      
          
        Text(" Pluse Mood ", 
        style: GoogleFonts.oswald(
          fontWeight: FontWeight.bold, 
          fontSize: 18, 
        
          
          ), )
        ,

        actions: [

  IconButton(
            icon: const Icon( Icons.analytics_outlined),
            onPressed: () {
                showBottomSheet(context);
            },
          ),

          IconButton(
            onPressed: () {
            themeServices.switchTheme();
          },
           icon: Icon(Icons.brightness_6)
        )


            

       
        ],
        
        ),
      body: 
      
          Column(
          
           // crossAxisAlignment: CrossAxisAlignment.center,
           
       children: [ 

SizedBox(
  height: 70,
),

 Image.asset(
  'assets/gif/world_emo.gif',

  
  fit: BoxFit.cover,
),


SizedBox(
  height: 25,
),


         ElevatedButton(
            onPressed: () => Get.to(() => ScannerScreen()),
              style: ButtonStyle(
           // backgroundColor: WidgetStateProperty.all(Colors.lightBlue),
            //elevation: WidgetStateProperty.all(8.0),
              backgroundColor: WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.hovered)) return Colors.grey;
    if (states.contains(WidgetState.pressed))  return Colors.blue.shade200;
    return Colors.yellow[700];
  }),
             elevation: WidgetStateProperty.resolveWith((states) {
    return states.contains(WidgetState.pressed) ? 2.0 : 8.0;
  }),
            shadowColor: WidgetStateProperty.all(
              Colors.black
            ),
// padding: WidgetStateProperty.all(
// const EdgeInsets.symmetric(
//   horizontal: 18,
//   vertical: 12
// )
// ),

            
            ),
            child: Text("Click here to check your Mood",
            style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.w600,
              color: Colors.white
            ),
            ),
        
          ),
  

            ]   )
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
