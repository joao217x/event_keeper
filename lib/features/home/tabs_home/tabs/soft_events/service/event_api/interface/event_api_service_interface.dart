import 'package:event_keeper/features/home/model/event_model.dart';

abstract class EventApiServiceInterface {
  Future<List<EventModel>> getEventList();
}
