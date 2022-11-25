import 'package:event_keeper/features/home/controller/prefs_controller.dart';
import 'package:event_keeper/features/home/view/tabs/saved_events/error/saved_event_empty_list_tab.dart';
import 'package:event_keeper/shared/components/event_card.dart';
import 'package:event_keeper/shared/core/app_dependencies.dart';
import 'package:event_keeper/shared/util/app_parses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SavedEventsTabs extends StatefulWidget {
  const SavedEventsTabs({Key? key}) : super(key: key);

  @override
  State<SavedEventsTabs> createState() => _SavedEventsTabsState();
}

class _SavedEventsTabsState extends State<SavedEventsTabs> {
  final PrefsController controller = getIt<PrefsController>();

  @override
  void initState() {
    controller.getSavedEventList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _content();
  }

  Widget _content() {
    return Scaffold(
      body: Observer(builder: ((_) {
        return controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : controller.savedEventList.isEmpty
                ? const SavedEventEmptyListTab()
                : _listViewBuilder();
      })),
    );
  }

  Widget _listViewBuilder() {
    return ListView.builder(
      itemCount: controller.savedEventList.length,
      itemBuilder: ((context, index) {
        final event = controller.savedEventList[index];

        return EventCard(
          weekDay: AppParses.weekDay(
            DateTime.parse(event.startTime),
          ),
          dayAndMonth: AppParses.dayMonth(
            DateTime.parse(event.startTime),
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
        );
      }),
    );
  }
}
