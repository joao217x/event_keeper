// import 'package:desafio_flutter/model/event/event_model.dart';
// import 'package:desafio_flutter/shared/theme/app_color.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class SoftEventListTab extends StatelessWidget {
//   final EventModel event;

//   const SoftEventListTab({Key? key, required this.event}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return IntrinsicHeight(
//       child: Row(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(right: 6),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text(
//                   'SEX',
//                   style: TextStyle(color: AppColor.grey),
//                 ),
//                 Text('03/06'),
//               ],
//             ),
//           ),
//           const VerticalDivider(
//             thickness: 2,
//             width: 2,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SvgPicture.asset(
//                   'assets/event_header.svg',
//                   fit: BoxFit.fitWidth,
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   event.name,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 SizedBox(
//                   height: 32,
//                   width: 300,
//                   child: Text(
//                     event.description,
//                     style: const TextStyle(
//                       fontSize: 14,
//                       color: AppColor.grey,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   children: const [
//                     Text(
//                       '17:00',
//                       style: TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w600,
//                         color: AppColor.orange,
//                       ),
//                     ),
//                     Text(
//                       '  -  ',
//                       style: TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     Text(
//                       '20:00',
//                       style: TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w600,
//                         color: AppColor.orange,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 5),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     const Icon(
//                       Icons.room,
//                       color: AppColor.grey,
//                     ),
//                     Text(
//                       event.address.rua,
//                       style: const TextStyle(
//                         fontSize: 12,
//                         color: AppColor.grey,
//                       ),
//                     )
//                   ],
//                 ),
//                 const SizedBox(height: 4),
//                 const Text(
//                   'Ver no mapa',
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: AppColor.purple,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
