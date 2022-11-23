import 'package:event_keeper/features/home/tabs_home/tabs/soft_events/controller/soft_events_controller.dart';
import 'package:event_keeper/features/home/tabs_home/tabs/soft_events/view/error/soft_event_load_error_tab.dart';
import 'package:event_keeper/features/home/tabs_home/tabs/soft_events/view/error/soft_event_non_registered_tab.dart';
import 'package:event_keeper/shared/util/app_dependencies.dart';
import 'package:flutter/material.dart';

class SoftEventsControllerScreen extends StatelessWidget {
  SoftEventsControllerScreen({Key? key}) : super(key: key);

  final SoftEventsController controller = getIt<SoftEventsController>();

  @override
  Widget build(BuildContext context) {
    return _content();
  }

  Widget _content() {
    return Scaffold(
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          return controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : controller.eventList.isEmpty
                  ? const SoftEventNonRegisteredTab()
                  : controller.isError
                      ? const SoftEventLoadErrorTab()
                      : ListView.builder(
                          itemCount: controller.eventList.length,
                          itemBuilder: ((context, index) {
                            // final item = controller.onlineList[index];
                            return Column();
                          }),
                        );
        },
      ),
    );
  }
}
