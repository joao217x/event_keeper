import 'package:event_keeper/features/home/model/event_model.dart';
import 'package:event_keeper/shared/components/appbar_widget.dart';
import 'package:event_keeper/shared/theme/app_color.dart';
import 'package:event_keeper/shared/util/app_parses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SoftEventInfoTab extends StatelessWidget {
  const SoftEventInfoTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarNavigatorWidget(
        title: 'Detalhes do evento',
        onPressed: () {
          // Navigator.popAndPushNamed(context, '/tabs');
          Navigator.popUntil(context, ModalRoute.withName('/tabs'));
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
            _eventHeader(),
            _eventName(context),
            _eventDescription(context),
            _eventDateAndTime(context),
            _eventAddress(context),
          ],
        ),
      ),
    );
  }

  Widget _eventHeader() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Center(
        child:
            // NetworkImage(),
            SvgPicture.asset('assets/event_header.svg'),
      ),
    );
  }

  Widget _eventName(context) {
    final item = ModalRoute.of(context)!.settings.arguments as EventModel;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        item.eventName,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _eventDescription(context) {
    final item = ModalRoute.of(context)!.settings.arguments as EventModel;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        item.eventDescription,
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
    final item = ModalRoute.of(context)!.settings.arguments as EventModel;

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
                DateTime.parse(item.startTime),
              )} - ${AppParses.dayMonthYear(
                DateTime.parse(item.startTime),
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
    final item = ModalRoute.of(context)!.settings.arguments as EventModel;

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
                DateTime.parse(item.startTime),
              )} - ${AppParses.hour(
                DateTime.parse(item.endTime),
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
    final item = ModalRoute.of(context)!.settings.arguments as EventModel;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(
          Icons.room,
          color: AppColor.grey,
        ),
        const SizedBox(width: 5),
        Text(
          '${item.address?.street}, ${item.address?.number},\n${item.address?.neighborhood}, ${item.address?.city}',
          style: const TextStyle(
            fontSize: 14,
            color: AppColor.grey,
          ),
        )
      ],
    );
  }
}
