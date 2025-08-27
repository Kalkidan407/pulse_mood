import 'package:hive/hive.dart';
part 'mood_model.g.dart';

@HiveType(typeId: 0)
class Mood extends HiveObject {

  @HiveField(0)
  String mood;

  @HiveField(1)
  DateTime date;

  Mood({required this.mood, required this.date});
}
