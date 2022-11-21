import 'package:dio/dio.dart';
import 'package:event_keeper/features/login/service/firebase_service.dart';
import 'package:event_keeper/features/login/service/interface/firebase_service_interface.dart';
import 'package:event_keeper/shared/client/api/dio_impl.dart';
import 'package:event_keeper/shared/client/api/interface/api_client_interface.dart';
import 'package:event_keeper/shared/client/firebase/firebase_impl.dart';
import 'package:event_keeper/shared/client/firebase/interface/firebase_client_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance();

class AppDependencies {
  void setup() {
    //Libs
    getIt.registerFactory<Dio>(() => Dio());
    getIt.registerFactory<FirebaseAuth>(() => FirebaseAuth.instance);

    //Implementations
    getIt.registerFactory<ApiClientInterface>(() => DioImpl());
    getIt.registerFactory<FirebaseClientInterface>(() => FirebaseImpl());

    //Services
    getIt.registerFactory<FirebaseServiceInterface>(
      () => FirebaseService(firebaseClient: getIt<FirebaseClientInterface>()),
    );
  }
}
