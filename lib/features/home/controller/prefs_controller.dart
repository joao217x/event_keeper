import 'package:event_keeper/features/home/model/event_model.dart';
import 'package:event_keeper/features/home/service/shared_preferences/prefs_service_impl.dart';
import 'package:mobx/mobx.dart';
part 'prefs_controller.g.dart';

class PrefsController = _PrefsControllerBase with _$PrefsController;

abstract class _PrefsControllerBase with Store {
  final prefs = PrefsServiceImpl();

  @observable
  List<EventModel> savedEventList = [];
  @action
  void addToSavedList(EventModel eventModel) {
    initLoading();

    savedEventList.add(eventModel);
    syncLists();

    endLoading();
  }

  @action
  void removeFromSavedList(EventModel eventModel) {
    initLoading();

    savedEventList.remove(eventModel);
    syncLists();

    endLoading();
  }

  @action
  void clearSavedList() {
    savedEventList.clear();
  }

  @action
  Future<void> syncLists() async {
    await prefs.setStringList(savedEventList);
  }

  @action
  Future<void> getSavedEventList() async {
    try {
      initLoading();
      final result = await prefs.getStringList();
      savedEventList = result;
      endLoading();
    } catch (_) {
      setIsError(true);
    }
  }

  @observable
  bool isLoading = false;
  @action
  void setIsLoading(bool value) {
    isLoading = value;
  }

  @observable
  bool isError = false;
  @action
  void setIsError(bool value) {
    isError = value;
  }

  @action
  void initLoading() {
    setIsError(false);
    setIsLoading(true);
  }

  @action
  void endLoading() {
    setIsError(false);
    setIsLoading(false);
  }
}
