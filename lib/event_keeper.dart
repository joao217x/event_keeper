import 'package:event_keeper/shared/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventKeeper extends StatelessWidget {
  const EventKeeper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
      ),
      initialRoute: '/splash',
      routes: AppRoutes.routes(context),
    );
  }
}
