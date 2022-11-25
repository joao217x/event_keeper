import 'package:event_keeper/shared/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      indicatorColor: AppColor.purple,
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      tabs: [
        TabWidget(text: 'Eventos soft'),
        TabWidget(text: 'Eventos salvos')
      ],
    );
  }
}

class TabWidget extends StatelessWidget {
  final String text;

  const TabWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10, bottom: 0),
      child: Tab(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
