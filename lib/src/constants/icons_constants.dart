import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/src/constants/color_constants.dart';
import 'package:login_logout_simple_ui/src/constants/sizes_constants.dart';

class IconsConstants {
  static const kAddIcon = Icon(
    Icons.add,
    size: SizesConstants.kBottomNavigatiorBarIconSize,
    color: ColorConstatns.kBackGroundGrey,
  );
  static const kProfileIcon = Icons.person;
  static const kMainHomeGamePageIcon = Icons.home_filled;
  static const kTaskMenuIcon = Icons.menu_book;
  static const kSettingsIcon = Icons.settings;
  static const kProfileLogOutIcon = Icons.logout;
  static const kGoBackIcon = Icons.arrow_back_ios_new;
  static const kGoForwardIcon = Icons.arrow_forward_ios;
  static final kHelpIcon = Icon(
    Icons.question_mark,
    size: SizesConstants.kBottomNavigatiorBarIconSize,
    color: ColorConstatns.kDarkGrey,
  );
  static final kDoneTaskIcon = Icon(
    Icons.done,
    size: SizesConstants.kTopNavigationBarIconSize,
    color: ColorConstatns.kDarkGrey,
  );
  static const kDelete = Icons.delete;
  static const kChooseYourChracterIcon =
      Icons.photo_size_select_actual_outlined;
  static const kTaskFinished = Icons.done_all;
  static const kTheme = Icons.invert_colors;
  static const kAchievement = Icons.workspace_premium_sharp;
  static final kHolder = Icon(
    size: SizesConstants.kBottomNavigatiorBarIconSize,
    Icons.dangerous,
    color: ColorConstatns.kDarkGrey,
  );
  static const kToDo = Icons.today_rounded;
}
