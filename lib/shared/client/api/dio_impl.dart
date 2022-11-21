import 'package:event_keeper/shared/client/api/interface/api_reponse_interface.dart';
import 'package:event_keeper/shared/client/api/interface/api_client_interface.dart';
import 'package:dio/dio.dart' as dio;

class DioImpl implements ApiClientInterface {
  final client = dio.Dio();

  @override
  Future<ApiResponseInterface> get(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    final response = await client.get(path);

    return ApiResponseInterface.fromResponse(response);
  }
}
