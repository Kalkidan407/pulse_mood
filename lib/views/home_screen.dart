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

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.find<MoodController>();

   final themeServices = ThemeService();

  bool _isPressed = false;

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

  GestureDetector(
    onTapDown: (_) => setState(
      () => _isPressed = true
    ),
    onTapUp: (_) => setState(() {
      _isPressed= false;
    }),


     child:   
     AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      transform: Matrix4.identity()
         ..scale(_isPressed ? 0.95 : 1.0),
    child:   ElevatedButton(
            onPressed: () => Get.to(() => ScannerScreen()),
              style: 
             ElevatedButton.styleFrom(
              backgroundColor: _isPressed ? const Color.fromARGB(255, 255, 193, 7) : Colors.amber,
              elevation: _isPressed ? 2 : 8, // shadow lowers when pressed
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Text("What’s your vibe? Click me!",
            style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.w600,
              color: Colors.white
            ),
            ),
        
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
