import 'package:event_keeper/features/home/model/event_model.dart';
import 'package:event_keeper/shared/components/appbar_widget.dart';
import 'package:event_keeper/shared/theme/app_color.dart';
import 'package:event_keeper/shared/util/app_parses.dart';
import 'package:flutter/material.dart';

class SoftEventInfoTab extends StatelessWidget {
  const SoftEventInfoTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarNavigatorWidget(
        title: 'Detalhes do evento',
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        },
      ),
      body: _body(context),
    );
  }

  Widget _body(context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 25, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _eventHeader(context),
            _eventName(context),
            _eventDescription(context),
            _eventDateAndTime(context),
            _eventAddress(context),
          ],
        ),
      ),
    );
  }

  Widget _eventHeader(context) {
    final event = ModalRoute.of(context)?.settings.arguments as EventModel;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(minHeight: 150, minWidth: 300),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(event.thumbnail),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget _eventName(context) {
    final event = ModalRoute.of(context)?.settings.arguments as EventModel;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        event.eventName,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _eventDescription(context) {
    final event = ModalRoute.of(context)?.settings.arguments as EventModel;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        event.eventDescription,
        style: const TextStyle(
          fontSize: 14,
          color: AppColor.grey,
        ),
      ),
    );
  }

  Widget _eventDateAndTime(context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _eventDate(context),
          _eventTime(context),
        ],
      ),
    );
  }

  Widget _eventDate(context) {
    final event = ModalRoute.of(context)?.settings.arguments as EventModel;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Data',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Text(
              '${AppParses.weekDay(
                DateTime.parse(event.startTime),
              )} - ${AppParses.dayMonthYear(
                DateTime.parse(event.startTime),
              )}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColor.orange,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _eventTime(context) {
    final event = ModalRoute.of(context)?.settings.arguments as EventModel;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Horário',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Text(
              '${AppParses.hour(
                DateTime.parse(event.startTime),
              )} - ${AppParses.hour(
                DateTime.parse(event.endTime),
              )}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColor.orange,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _eventAddress(context) {
    final event = ModalRoute.of(context)?.settings.arguments as EventModel;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(
          Icons.room,
          color: AppColor.grey,
        ),
        const SizedBox(width: 5),
        Text(
          '${event.address?.street}, ${event.address?.number},\n${event.address?.neighborhood}, ${event.address?.city}',
          style: const TextStyle(
            fontSize: 14,
            color: AppColor.grey,
          ),
        )
      ],
    );
  }
}
