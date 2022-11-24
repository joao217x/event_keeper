import 'package:event_keeper/features/home/model/event_model.dart';
import 'package:event_keeper/features/home/service/event_api/interface/event_api_service_interface.dart';
import 'package:flutter/material.dart';

class ApiController extends ChangeNotifier {
  final EventApiServiceInterface eventApi;

  ApiController({
    required this.eventApi,
  });

  List<EventModel> onlineEventList = [];

  Future<List<EventModel>> getEventList() async {
    try {
      initLoading();

      final response = await eventApi.getEventList();
      onlineEventList = response;

      endLoading();

      notifyListeners();
      return onlineEventList;
    } catch (_) {
      setIsError(true);
      setIsLoading(false);

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
    setIsLoading(false);
    notifyListeners();
  }
}
