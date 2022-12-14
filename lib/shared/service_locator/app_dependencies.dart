import 'package:dio/dio.dart';
import 'package:event_keeper/features/home/controller/firebase_controller.dart';
import 'package:event_keeper/features/home/controller/prefs_controller.dart';
import 'package:event_keeper/features/home/service/event_api/event_api_service_impl.dart';
import 'package:event_keeper/features/home/service/event_api/interface/event_api_service_interface.dart';
import 'package:event_keeper/features/home/controller/api_controller.dart';
import 'package:event_keeper/features/login/controller/login_controller.dart';
import 'package:event_keeper/features/home/service/firebase/firebase_service_impl.dart';
import 'package:event_keeper/features/home/service/firebase/interface/firebase_service_interface.dart';
import 'package:event_keeper/features/splash/controller/splash_controller.dart';
import 'package:event_keeper/shared/client/api/dio_client_impl.dart';
import 'package:event_keeper/shared/client/api/interface/api_client_interface.dart';
import 'package:event_keeper/shared/client/auth/firebase_client_impl.dart';
import 'package:event_keeper/shared/client/auth/interface/auth_client_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class AppDependencies {
  void setup() {
    //Libs
    getIt.registerFactory<FirebaseAuth>(() => FirebaseAuth.instance);
    getIt.registerFactory<Dio>(() => Dio());

    //Clients
    getIt.registerFactory<AuthClientInterface>(
      () => FirebaseClientImpl(client: getIt<FirebaseAuth>()),
    );
    getIt.registerFactory<ApiClientInterface>(
      () => DioClientImpl(client: getIt<Dio>()),
    );

    //Services
    getIt.registerFactory<FirebaseServiceInterface>(
      () => FirebaseServiceImpl(client: getIt<AuthClientInterface>()),
    );
    getIt.registerFactory<EventApiServiceInterface>(
      () => EventApiServiceImpl(clientInterface: getIt<ApiClientInterface>()),
    );

    //Controllers
    getIt.registerFactory<SplashController>(() => SplashController());
    getIt.registerFactory<LoginController>(
      () => LoginController(firebase: getIt<FirebaseServiceInterface>()),
    );
    getIt.registerFactory<FirebaseController>(
      () => FirebaseController(
        firebaseAuth: getIt<FirebaseAuth>(),
        firebase: getIt<FirebaseServiceInterface>(),
      ),
    );
    getIt.registerFactory<ApiController>(
      () => ApiController(eventApi: getIt<EventApiServiceInterface>()),
    );
    getIt.registerFactory<PrefsController>(() => PrefsController());
  }
}
