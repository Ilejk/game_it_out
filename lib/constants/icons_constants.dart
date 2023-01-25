import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/constants/color_constants.dart';
import 'package:login_logout_simple_ui/constants/sizes_constants.dart';

class IconsConstants {
  static final kAddIcon = Icon(
    Icons.add_box_outlined,
    size: SizesConstants.kBottomNavigatiorBarIconSize,
    color: ColorConstatns.kDarkGrey,
  );
  static const kProfileIcon = Icons.person;
  static const kMainHomeGamePageIcon = Icons.home_filled;
  static const kTaskMenuIcon = Icons.menu_book;
  static const kSettingsIcon = Icons.settings;
  static const kProfileLogOutIcon = Icons.exit_to_app;
  static const kGoBackIcon = Icons.arrow_back_ios_new;
  static const kGoForwardIcon = Icons.arrow_forward_ios;
}
