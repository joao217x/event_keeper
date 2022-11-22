import 'package:dio/dio.dart';
import 'package:event_keeper/shared/client/api/interface/api_reponse_interface.dart';
import 'package:event_keeper/shared/client/api/interface/api_client_interface.dart';

class DioClientImpl implements ApiClientInterface {
  final Dio client;

  DioClientImpl({required this.client});

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
