import 'package:event_keeper/features/home/model/event_model.dart';
import 'package:event_keeper/features/home/tabs_home/tabs/soft_events/service/event_api/interface/event_api_service_interface.dart';
import 'package:flutter/material.dart';

class SoftEventsController extends ChangeNotifier {
  final EventApiServiceInterface eventInterface;

  SoftEventsController({required this.eventInterface});

  List<EventModel> onlineEventList = [];

  Future<List<EventModel>> getEventList() async {
    try {
      final response = await eventInterface.getEventList();
      onlineEventList = response;
      notifyListeners();

      return onlineEventList;
    } catch (_) {
      notifyListeners();
      return [];
    }
  }

  bool isLoading = false;
  void setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  bool isError = false;
  void setIsError(bool value) {
    isError = value;
    notifyListeners();
  }

  void initLoading() {
    setIsError(false);
    setIsLoading(true);
    notifyListeners();
  }

  void endLoading() {
    setIsError(false);
    setIsLoading(true);
    notifyListeners();
  }
}
