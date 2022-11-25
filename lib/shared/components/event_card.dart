import 'package:event_keeper/shared/theme/app_color.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String weekDay;
  final String dayAndMonth;
  final IconButton? iconButton;
  final String thumbnail;
  final String eventName;
  final String eventDescription;
  final String eventStartTime;
  final String eventEndTime;
  final String eventAddress;

  const EventCard({
    Key? key,
    required this.weekDay,
    required this.dayAndMonth,
    this.iconButton,
    required this.thumbnail,
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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _leftBar(),
              _eventContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _leftBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _eventDate(),
              iconButton ?? Container(),
            ],
          ),
        ),
        const VerticalDivider(
          thickness: 2,
          width: 2,
        ),
      ],
    );
  }

  Widget _eventDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          weekDay,
          style: const TextStyle(color: AppColor.grey, fontSize: 12),
        ),
        const SizedBox(height: 3),
        Text(
          dayAndMonth,
          style: const TextStyle(fontWeight: FontWeight.w600),
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
          // _saveEventButton(),
        ],
      ),
    );
  }

  Widget _eventHeader() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Container(
        constraints: const BoxConstraints(minHeight: 150, minWidth: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: NetworkImage(thumbnail),
            fit: BoxFit.cover,
          ),
        ),
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
            '$eventStartTime - $eventEndTime',
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
