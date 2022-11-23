import 'package:flutter/material.dart';

class SoftEventsController extends ChangeNotifier {
  // final AgendaClient agendaClient = AgendaClient();

  // //event list
  // @observable
  // List<EventModel> eventList = [];
  // @action
  // void setEventList(List<EventModel> value) => eventList = value;

  List<void> eventList = [];
  void setEventList(List value) {
    eventList = value;
    notifyListeners();
  }

  // //loading
  // @observable
  // bool isLoading = false;
  // @action
  // void setIsLoading(bool value) => isLoading = value;
  bool isLoading = false;
  void setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  // //error
  // @observable
  // bool isError = false;
  // @action
  // void setIsError(bool value) => isError = value;
  bool isError = false;
  void setIsError(bool value) {
    isError = value;
    notifyListeners();
  }

  // @action
  // void initLoading() {
  //   setIsError(false);
  //   setIsLoading(true);
  // }
  void initLoading() {
    setIsError(false);
    setIsLoading(true);
    notifyListeners();
  }

  // @action
  // void endLoading() {
  //   setIsError(false);
  //   setIsLoading(false);
  // }
  void endLoading() {
    setIsError(false);
    setIsLoading(true);
    notifyListeners();
  }

  // @action
  // Future<void> getListaEventos() async {
  //   try {
  //     initLoading();

  //     final result = await agendaClient.getListaEventosAgenda();
  //     setEventList(result);

  //     endLoading();
  //     inspect(eventList);
  //   } catch (e) {
  //     setIsError(true);
  //     throw e.toString();
  //   }
  // }
  void getEventList() {
    notifyListeners();
  }
}
