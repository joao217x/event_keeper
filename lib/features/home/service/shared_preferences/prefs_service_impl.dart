import 'dart:convert';
import 'package:event_keeper/features/home/model/event_model.dart';
import 'package:event_keeper/features/home/service/shared_preferences/interface/prefs_service_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsServiceImpl implements PrefsServiceInterface {
  final String eventsKey = 'eventsKey';

  // @override
  // Future<void> setStringList(List<EventModel> eventModel) async {
  //   final prefs = await SharedPreferences.getInstance();

  //   final eventsList = eventModel.map((e) => jsonEncode(e.toJson())).toList();

  //   await prefs.setStringList(eventsKey, eventsList);
  // }

  @override
  Future<List<EventModel>> getStringList() async {
    final prefs = await SharedPreferences.getInstance();

    final eventsListJson = prefs.getStringList(eventsKey);
    if (eventsListJson != null) {
      final result = List<Map<String, dynamic>>.from(
        eventsListJson.map((e) => jsonDecode(e)),
      );

      return result.map(EventModel.fromJson).toList();
    }
    return [];
  }
}
