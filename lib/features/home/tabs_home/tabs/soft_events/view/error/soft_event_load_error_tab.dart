import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SoftEventLoadErrorTab extends StatelessWidget {
  const SoftEventLoadErrorTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _content();
  }

  Widget _content() {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(
              'assets/event_load_error.svg',
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              'Ocorreu um erro ao carregar os eventos',
            ),
          ),
        ],
      ),
    );
  }
}
