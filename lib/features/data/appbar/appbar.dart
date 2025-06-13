import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/device_utils/device_utilities.dart';
import '../../../utils/helpers_function/helper_functions.dart';


class ZohAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ZohAppBar({super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunctions.isDarkMode(context);
    return AppBar(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)),
      ),
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: showBackArrow
          ? IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(Iconsax.arrow_left_2),
        color: Colors.black,
      )
          : leadingIcon != null
          ? IconButton(
          onPressed: leadingOnPressed, icon: Icon(leadingIcon)) : null,
      title: title,
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(ZohDeviceUtils.getAppBarHeight());
}
