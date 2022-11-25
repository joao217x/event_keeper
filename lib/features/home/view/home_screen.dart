import 'package:event_keeper/features/home/controller/firebase_controller.dart';
import 'package:event_keeper/features/home/view/tabs/saved_events/saved_events_tabs.dart';
import 'package:event_keeper/features/home/view/tabs/soft_events/soft_events_tabs.dart';
import 'package:event_keeper/shared/components/appbar_widget.dart';
import 'package:event_keeper/shared/components/tabs_widget.dart';
import 'package:event_keeper/shared/service_locator/app_dependencies.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final controller = getIt<FirebaseController>();

  @override
  Widget build(BuildContext context) {
    controller.checkLogged();

    return _content(context);
  }

  Widget _content(context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBarWidget(
          logout: controller.isLogged
              ? () async {
                  await controller.logout().then((_) {
                    return Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/login',
                      (route) => false,
                    );
                  });
                }
              : null,
        ),
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        const SizedBox(
          height: 40,
          child: TabBarWidget(),
        ),
        Expanded(
          child: TabBarView(
            children: [
              SoftEventsTabs(),
              SavedEventsTabs(),
            ],
          ),
        ),
      ],
    );
  }
}
