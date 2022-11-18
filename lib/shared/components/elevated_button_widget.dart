import 'package:event_keeper/shared/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromHeight(38),
        backgroundColor: AppColor.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
