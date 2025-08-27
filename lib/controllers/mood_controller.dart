import 'package:get/get.dart';
import 'package:pulse_mood/data/model_repository.dart';
import '../data/mood_model.dart';
import '../data/model_repository.dart';

class MoodController extends GetxController {
  
  final MoodRepository repo = MoodRepository();
  var moods = <Mood>[].obs;

  @override
  void onInit() {
    moods.value = repo.getAllMoods();
    super.onInit();
  }

  void addMood(String mood) async {
    await repo.saveMood(mood);
    moods.value = repo.getAllMoods(); // refresh
  }

}
