import 'package:event_keeper/features/home/model/event_model.dart';
import 'package:event_keeper/features/home/tabs_home/tabs/soft_events/service/event_api/interface/event_api_service_interface.dart';
import 'package:event_keeper/shared/service/firebase/interface/firebase_service_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class TabsHomeController extends ChangeNotifier {
  final FirebaseAuth firebaseAuth;
  final FirebaseServiceInterface firebaseInterface;
  final EventApiServiceInterface eventInterface;

  TabsHomeController({
    required this.firebaseAuth,
    required this.firebaseInterface,
    required this.eventInterface,
  });

  List<EventModel> onlineEventList = [];

  Future<List<EventModel>> getEventList() async {
    try {
      initLoading();

      final response = await eventInterface.getEventList();
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

  Future<void> logout() async {
    await firebaseInterface.logout();
    setIsLogged(false);
    notifyListeners();
  }

  bool isLogged = false;
  void setIsLogged(bool value) {
    isLogged = value;
    notifyListeners();
  }

  void checkLogged() {
    if (firebaseAuth.currentUser != null) {
      setIsLogged(true);
      notifyListeners();
    } else {
      setIsLogged(false);
      notifyListeners();
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
