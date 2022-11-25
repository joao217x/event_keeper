import 'package:event_keeper/features/home/controller/api_controller.dart';
import 'package:event_keeper/features/home/controller/prefs_controller.dart';
import 'package:event_keeper/features/home/view/tabs/soft_events/error/soft_event_load_error_tab.dart';
import 'package:event_keeper/features/home/view/tabs/soft_events/error/soft_event_non_registered_tab.dart';
import 'package:event_keeper/shared/components/event_card.dart';
import 'package:event_keeper/shared/theme/app_color.dart';
import 'package:event_keeper/shared/core/app_dependencies.dart';
import 'package:event_keeper/shared/util/app_parses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SoftEventsTabs extends StatelessWidget {
  SoftEventsTabs({Key? key}) : super(key: key) {
    apiController.getEventList();
  }

  final ApiController apiController = getIt<ApiController>();
  final PrefsController prefsController = getIt<PrefsController>();

  @override
  Widget build(BuildContext context) {
    return _content();
  }

  Widget _content() {
    return Scaffold(
      body: AnimatedBuilder(
        animation: apiController,
        builder: (context, _) {
          return apiController.isLoading
              ? const Center(child: CircularProgressIndicator())
              : apiController.onlineEventList.isEmpty
                  ? const SoftEventNonRegisteredTab()
                  : apiController.isError
                      ? const SoftEventLoadErrorTab()
                      : _listViewBuilder();
        },
      ),
    );
  }

  Widget _listViewBuilder() {
    return ListView.builder(
      itemCount: apiController.onlineEventList.length,
      itemBuilder: ((context, index) {
        final event = apiController.onlineEventList[index];

        return Observer(builder: (context) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/details', arguments: event);
            },
            child: EventCard(
              weekDay: AppParses.weekDay(
                DateTime.parse(event.startTime),
              ),
              dayAndMonth: AppParses.dayMonth(
                DateTime.parse(event.startTime),
              ),
              iconButton: IconButton(
                onPressed: () {
                  if (prefsController.savedEventList.contains(event)) {
                    prefsController.removeFromSavedList(event);
                  } else {
                    prefsController.addToSavedList(event);
                  }
                },
                icon: prefsController.savedEventList.contains(event)
                    ? const Icon(Icons.check, color: AppColor.green, size: 30)
                    : const Icon(Icons.close, color: AppColor.red, size: 30),
              ),
              thumbnail: event.thumbnail,
              eventName: event.eventName,
              eventDescription: event.eventDescription,
              eventStartTime: AppParses.hour(
                DateTime.parse(event.startTime),
              ),
              eventEndTime: AppParses.hour(
                DateTime.parse(event.endTime),
              ),
              eventAddress: event.address?.street ?? '!!ERRO!!',
            ),
          );
        });
      }),
    );
  }
}
