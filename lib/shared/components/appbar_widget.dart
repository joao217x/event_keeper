import 'package:event_keeper/shared/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? logout;

  const CustomAppBar({Key? key, this.logout}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Eventos',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
      centerTitle: true,
      backgroundColor: AppColor.purple,
      toolbarHeight: 60,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      actions: [
        Visibility(
          visible: logout != null ? true : false,
          child: InkWell(
            onTap: logout,
            child: const Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.logout_rounded),
            ),
          ),
        )
      ],
    );
  }
}

class CustomAppBarNavigator extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final Function() onPressed;

  const CustomAppBarNavigator({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.navigate_before),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
      centerTitle: true,
      backgroundColor: AppColor.purple,
      toolbarHeight: 60,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
    );
  }
}
