import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data/mood_model.dart';
import 'views/home_screen.dart';
import 'controllers/mood_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MoodAdapter());
  await Hive.openBox<Mood>('moods');

  Get.put(MoodController()); // Inject controller globally

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mood Checker',
      home: HomeScreen(),
    );

  }
}
