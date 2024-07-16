import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    required this.prefixAction,
    required this.suffixAction,
  });
  final VoidCallback prefixAction;
  final VoidCallback suffixAction;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: prefixAction,
        icon: Icon(
          Get.isDarkMode ? Iconsax.moon5 : Iconsax.moon5,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
