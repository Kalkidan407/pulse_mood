
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/mood_controller.dart';


class History extends StatelessWidget {
  final controller = Get.find<MoodController>();

@override
Widget build(BuildContext context){

  return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.moods.length,
              itemBuilder: (ctx, i) {
                final mood = controller.moods[i];
                return ListTile(
                  title: Text(mood.mood),
                  subtitle: Text(mood.date.toString()),
                );
              },
            )),
          )
      ],

    ),



  );

}


}