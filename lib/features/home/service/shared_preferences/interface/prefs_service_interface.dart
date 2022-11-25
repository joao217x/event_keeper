import 'package:event_keeper/features/home/model/event_model.dart';

abstract class PrefsServiceInterface {
  Future<void> setStringList(List<EventModel> event);

  Future<List<EventModel>> getStringList();
}
