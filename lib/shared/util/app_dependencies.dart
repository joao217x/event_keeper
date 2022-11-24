import 'package:dio/dio.dart';
import 'package:event_keeper/features/home/tabs_home/tabs/soft_events/service/event_api/event_api_service_impl.dart';
import 'package:event_keeper/features/home/tabs_home/tabs/soft_events/service/event_api/interface/event_api_service_interface.dart';
import 'package:event_keeper/features/home/tabs_home/controller/tabs_home_controller.dart';
import 'package:event_keeper/features/login/controller/login_controller.dart';
import 'package:event_keeper/shared/service/firebase/firebase_service_impl.dart';
import 'package:event_keeper/shared/service/firebase/interface/firebase_service_interface.dart';
import 'package:event_keeper/shared/client/api/dio_client_impl.dart';
import 'package:event_keeper/shared/client/api/interface/api_client_interface.dart';
import 'package:event_keeper/shared/client/firebase/firebase_client_impl.dart';
import 'package:event_keeper/shared/client/firebase/interface/firebase_client_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class AppDependencies {
  void setup() {
    //Libs
    getIt.registerFactory<FirebaseAuth>(() => FirebaseAuth.instance);
    getIt.registerFactory<Dio>(() => Dio());

    //Implementations
    getIt.registerFactory<FirebaseClientInterface>(
      () => FirebaseClientImpl(client: getIt<FirebaseAuth>()),
    );
    getIt.registerFactory<ApiClientInterface>(
      () => DioClientImpl(client: getIt<Dio>()),
    );

    //Services
    getIt.registerFactory<FirebaseServiceInterface>(
      () => FirebaseServiceImpl(client: getIt<FirebaseClientInterface>()),
    );
    getIt.registerFactory<EventApiServiceInterface>(
      () => EventApiServiceImpl(clientInterface: getIt<ApiClientInterface>()),
    );

    //Controllers
    getIt.registerFactory<LoginController>(
      () => LoginController(firebase: getIt<FirebaseServiceInterface>()),
    );
    getIt.registerFactory<TabsHomeController>(
      () => TabsHomeController(
        firebaseAuth: getIt<FirebaseAuth>(),
        firebaseInterface: getIt<FirebaseServiceInterface>(),
        eventInterface: getIt<EventApiServiceInterface>(),
      ),
    );
    // getIt.registerFactory<SoftEventsController>(
    //   () => SoftEventsController(
    //     eventInterface: getIt<EventApiServiceInterface>(),
    //   ),
    // );
  }
}
