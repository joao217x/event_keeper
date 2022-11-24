import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SoftEventNonRegisteredTab extends StatelessWidget {
  const SoftEventNonRegisteredTab({Key? key}) : super(key: key);

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
              'assets/two_clipboards.svg',
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              'Não há nenhum evento cadastrado',
            ),
          ),
        ],
      ),
    );
  }
}
