import 'package:event_keeper/features/home/tabs/saved_events/view/saved_events_controller_screen.dart';
import 'package:event_keeper/features/home/tabs/soft_events/view/soft_events_controller_screen.dart';
import 'package:event_keeper/features/home/controller/tabs_home_controller.dart';
import 'package:event_keeper/shared/components/appbar_widget.dart';
import 'package:event_keeper/shared/components/tabs_widget.dart';
import 'package:event_keeper/shared/util/app_dependencies.dart';
import 'package:flutter/material.dart';

class TabsHomeScreen extends StatelessWidget {
  TabsHomeScreen({Key? key}) : super(key: key);

  final controller = getIt<TabsHomeController>();

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
          height: 55,
          child: TabBarWidget(),
        ),
        Expanded(
          child: TabBarView(
            children: [
              SoftEventsControllerScreen(),
              const SavedEventsControllerScreen(),
            ],
          ),
        ),
      ],
    );
  }
}
