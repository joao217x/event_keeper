// import 'package:event_keeper/shared/components/appbar_widget.dart';
// import 'package:event_keeper/shared/theme/app_color.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class SoftEventInfoTab extends StatefulWidget {
//   const SoftEventInfoTab({Key? key}) : super(key: key);

//   @override
//   State<SoftEventInfoTab> createState() => _SoftEventInfoTabState();
// }

// class _SoftEventInfoTabState extends State<SoftEventInfoTab> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBarNavigatorWidget(
//         title: 'Detalhes do evento',
//         onPressed: () {
//           Navigator.popAndPushNamed(context, '/tabs');
//         },
//       ),
//       body: SingleChildScrollView(
//         child: Observer(builder: (_) {
//           return Padding(
//             padding:
//                 const EdgeInsets.only(top: 25, right: 16, left: 16, bottom: 60),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child: SvgPicture.asset('assets/event_header.svg'),
//                 ),
//                 const SizedBox(height: 16),
//                 const Text(
//                   'SoftTalk + Happy Soft Hour',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 const Text(
//                   'Vamos celebrar? Sim! Teve reforma da sede, gravação de vídeo, registro fotográfico e uma nova marca está por vir… Isso tudo merece um brinde do nosso jeito: o primeiro Happy Soft Hour de 2022! vamos bibibi',
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: AppColor.grey,
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Row(
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'Data',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                         const SizedBox(height: 5),
//                         Row(
//                           children: const [
//                             Text(
//                               'SEX',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w600,
//                                 color: AppColor.orange,
//                               ),
//                             ),
//                             Text(
//                               ' - ',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w600,
//                                 color: AppColor.grey,
//                               ),
//                             ),
//                             Text(
//                               '06/06/22',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w600,
//                                 color: AppColor.orange,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(width: 180),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'Horário',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                         const SizedBox(height: 5),
//                         Row(
//                           children: const [
//                             Text(
//                               '17:00',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w600,
//                                 color: AppColor.orange,
//                               ),
//                             ),
//                             Text(
//                               ' - ',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w600,
//                                 color: AppColor.grey,
//                               ),
//                             ),
//                             Text(
//                               '20:00',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w600,
//                                 color: AppColor.orange,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: const [
//                     Icon(
//                       Icons.room,
//                       color: AppColor.grey,
//                     ),
//                     Text(
//                       'Rua Manoel Pedro Bernardo, 115, Criciuma - SC',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: AppColor.grey,
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           );
//         }),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         elevation: 0,
//         backgroundColor: Colors.white10,
//         label: const Text(
//           'Ver no mapa',
//           style: TextStyle(fontSize: 16, color: AppColor.purple),
//         ),
//         onPressed: () {
//           Navigator.popAndPushNamed(context, '/softEventPlace');
//         },
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }
