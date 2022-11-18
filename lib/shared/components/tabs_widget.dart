import 'package:event_keeper/shared/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTabWidget extends StatelessWidget {
  const CustomTabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      indicatorColor: AppColor.purple,
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      tabs: [
        Padding(
          padding: EdgeInsets.only(top: 25, bottom: 6),
          child: Tab(child: TabText(text: '   Eventos soft   ')),
        ),
        Padding(
          padding: EdgeInsets.only(top: 25, bottom: 6),
          child: Tab(child: TabText(text: '   Meus eventos   ')),
        ),
      ],
    );
  }
}

class TabText extends StatelessWidget {
  final String text;

  const TabText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w500),
    );
  }
}
