import 'package:event_keeper/features/home/model/address_model.dart';

class EventModel {
  final int id;
  final String eventName;
  final String eventDescription;
  final String startTime;
  final String endTime;
  final String thumbnail;
  final AddressModel? address;

  EventModel({
    required this.id,
    required this.eventName,
    required this.eventDescription,
    required this.startTime,
    required this.endTime,
    required this.thumbnail,
    required this.address,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      eventName: json['event_name'],
      eventDescription: json['event_description'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      thumbnail: json['thumbnail'],
      address: json['address'] != null
          ? AddressModel.fromJson(json['address'])
          : null,
    );
  }
  // address: AddressModel.fromJson(json['address']),

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['id'] = id;
    data['event_name'] = eventName;
    data['event_description'] = eventDescription;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['thumbnail'] = thumbnail;
    if (address != null) {
      data['address'] = address;
    }

    return data;
  }
}
