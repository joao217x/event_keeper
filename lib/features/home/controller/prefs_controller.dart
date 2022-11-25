import 'dart:developer';
import 'package:event_keeper/features/home/model/event_model.dart';
import 'package:event_keeper/features/home/service/shared_preferences/prefs_service_impl.dart';

class PrefsController {
  final prefs = PrefsServiceImpl();

  List<EventModel> savedEventList = [];

  void addToSavedList(EventModel eventModel) {
    try {
      savedEventList.add(eventModel);
    } catch (_) {}
  }

  Future<void> getSavedEventList() async {
    try {
      final result = await prefs.getStringList();

      savedEventList = result;
      inspect(savedEventList);
    } catch (_) {}
  }
}
