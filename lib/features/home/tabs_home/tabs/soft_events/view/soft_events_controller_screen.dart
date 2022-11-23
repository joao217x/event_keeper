import 'package:event_keeper/features/home/tabs_home/tabs/soft_events/controller/soft_events_controller.dart';
import 'package:event_keeper/features/home/tabs_home/tabs/soft_events/view/error/soft_event_load_error_tab.dart';
import 'package:event_keeper/features/home/tabs_home/tabs/soft_events/view/error/soft_event_non_registered_tab.dart';
import 'package:event_keeper/shared/components/event_card.dart';
import 'package:event_keeper/shared/util/app_dependencies.dart';
import 'package:flutter/material.dart';

class SoftEventsControllerScreen extends StatelessWidget {
  SoftEventsControllerScreen({Key? key}) : super(key: key) {
    controller.getEventList();
  }

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
              : controller.onlineEventList.isEmpty
                  ? const SoftEventNonRegisteredTab()
                  : controller.isError
                      ? const SoftEventLoadErrorTab()
                      : ListView.builder(
                          itemCount: controller.onlineEventList.length,
                          itemBuilder: ((context, index) {
                            final item = controller.onlineEventList[index];

                            return EventCard(
                              weekDay: item.startTime,
                              day: item.startTime,
                              eventName: item.eventName,
                              eventDescription: item.eventDescription,
                              eventStartTime: item.startTime,
                              eventEndTime: item.endTime,
                              eventAddress: item.address?.street ?? '!!ERRO!!',
                            );
                          }),
                        );
        },
      ),
    );
  }
}
