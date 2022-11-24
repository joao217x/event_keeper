import 'package:event_keeper/features/home/tabs_home/controller/tabs_home_controller.dart';
import 'package:event_keeper/features/home/tabs_home/tabs/soft_events/view/error/soft_event_load_error_tab.dart';
import 'package:event_keeper/features/home/tabs_home/tabs/soft_events/view/error/soft_event_non_registered_tab.dart';
import 'package:event_keeper/shared/components/event_card.dart';
import 'package:event_keeper/shared/theme/app_color.dart';
import 'package:event_keeper/shared/util/app_dependencies.dart';
import 'package:event_keeper/shared/util/app_parses.dart';
import 'package:flutter/material.dart';

class SoftEventsControllerScreen extends StatelessWidget {
  SoftEventsControllerScreen({Key? key}) : super(key: key) {
    controller.getEventList();
  }

  final TabsHomeController controller = getIt<TabsHomeController>();

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
                      : _listViewBuilder();
        },
      ),
    );
  }

  Widget _listViewBuilder() {
    return ListView.builder(
      itemCount: controller.onlineEventList.length,
      itemBuilder: ((context, index) {
        final item = controller.onlineEventList[index];

        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/details', arguments: item);
          },
          child: EventCard(
            weekDay: AppParses.weekDay(
              DateTime.parse(item.startTime),
            ),
            dayAndMonth: AppParses.dayMonth(
              DateTime.parse(item.startTime),
            ),
            iconButton: IconButton(
              onPressed: () {},
              icon:
                  // const Icon(
                  //   Icons.check,
                  //   color: AppColor.green,
                  //   size: 20,
                  // ),
                  const Icon(
                Icons.close,
                color: AppColor.red,
                size: 20,
              ),
            ),
            eventName: item.eventName,
            eventDescription: item.eventDescription,
            eventStartTime: AppParses.hour(
              DateTime.parse(item.startTime),
            ),
            eventEndTime: AppParses.hour(
              DateTime.parse(item.endTime),
            ),
            eventAddress: item.address?.street ?? '!!ERRO!!',
          ),
        );
      }),
    );
  }
}
