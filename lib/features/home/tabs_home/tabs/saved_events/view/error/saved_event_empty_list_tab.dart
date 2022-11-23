import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SavedEventEmptyListTab extends StatefulWidget {
  const SavedEventEmptyListTab({Key? key}) : super(key: key);

  @override
  State<SavedEventEmptyListTab> createState() => _SavedEventEmptyListTabState();
}

class _SavedEventEmptyListTabState extends State<SavedEventEmptyListTab> {
  @override
  Widget build(BuildContext context) {
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
              'Você ainda não criou nenhum evento',
            ),
          ),
        ],
      ),
    );
  }
}