import 'package:event_keeper/features/home/model/event_model.dart';
import 'package:event_keeper/features/home/tabs_home/tabs/soft_events/service/event_api/interface/event_api_service_interface.dart';
import 'package:event_keeper/shared/client/api/interface/api_client_interface.dart';
import 'package:event_keeper/shared/util/app_urls.dart';

class EventApiServiceImpl implements EventApiServiceInterface {
  final ApiClientInterface clientInterface;

  EventApiServiceImpl({required this.clientInterface});

  @override
  Future<List<EventModel>> getEventList() async {
    final response = await clientInterface.get('${AppUrls.baseUrl}');

    switch (response.statusCode) {
      case 200:
        return List.from(response.data)
            .map((event) => EventModel.fromJson(event))
            .toList();
      default:
        throw Exception();
    }
  }
}
