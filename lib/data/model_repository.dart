import 'package:hive/hive.dart';
import 'mood_model.dart';

class MoodRepository {
  
  final Box<Mood> _box = Hive.box<Mood>('moods');

  Future<void> saveMood(String mood) async {
    final entry = Mood(mood: mood, date: DateTime.now());
    await _box.add(entry);
  }

  List<Mood> getAllMoods() {
    return _box.values.toList();
  }

}
