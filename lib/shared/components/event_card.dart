import 'package:event_keeper/shared/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventCard extends StatelessWidget {
  final String weekDay;
  final String day;
  final String eventName;
  final String eventDescription;
  final String eventStartTime;
  final String eventEndTime;
  final String eventAddress;

  const EventCard({
    Key? key,
    required this.weekDay,
    required this.day,
    required this.eventName,
    required this.eventDescription,
    required this.eventStartTime,
    required this.eventEndTime,
    required this.eventAddress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _content();
  }

  Widget _content() {
    return IntrinsicHeight(
      child: Row(
        children: [
          _eventDate(),
          _eventContent(),
        ],
      ),
    );
  }

  Widget _eventDate() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                weekDay,
                style: const TextStyle(color: AppColor.grey),
              ),
              Text(day),
              const VerticalDivider(
                thickness: 2,
                width: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _eventContent() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _eventHeader(),
          _eventName(),
          _eventDescription(),
          _eventTime(),
          _eventAddress(),
        ],
      ),
    );
  }

  Widget _eventHeader() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: SvgPicture.asset(
        'assets/event_header.svg',
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _eventName() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        eventName,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _eventDescription() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: SizedBox(
        height: 32,
        width: 300,
        child: Text(
          eventDescription,
          style: const TextStyle(fontSize: 14, color: AppColor.grey),
        ),
      ),
    );
  }

  Widget _eventTime() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Text(
            eventStartTime,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColor.orange,
            ),
          ),
          const Text(
            '  -  ',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          Text(
            eventEndTime,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColor.orange,
            ),
          ),
        ],
      ),
    );
  }

  Widget _eventAddress() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            Icons.room,
            color: AppColor.grey,
          ),
          Text(
            eventAddress,
            style: const TextStyle(
              fontSize: 12,
              color: AppColor.grey,
            ),
          )
        ],
      ),
    );
  }
}