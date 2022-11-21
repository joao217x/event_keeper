import 'package:event_keeper/shared/client/api/interface/api_reponse_interface.dart';

abstract class ApiClientInterface {
  Future<ApiResponseInterface> get(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  });
}
