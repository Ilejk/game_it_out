import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/constants/color_constants.dart';
import 'package:login_logout_simple_ui/constants/icons_constants.dart';
import 'package:login_logout_simple_ui/constants/padding_constants.dart';
import 'package:login_logout_simple_ui/constants/sizes_constants.dart';
import 'package:login_logout_simple_ui/constants/string_constants.dart';
import 'package:login_logout_simple_ui/widgets/shadow_box_container.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: PaddingConstants.kBasePadding10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: PaddingConstants.kBasePadding10,
                child: ShadowBoxContainer(
                  height: SizesConstants.kTopBarTitleHeight,
                  width: SizesConstants.kTopBarTitleWidth,
                  child: Center(
                    child: Text(
                      StringConstants.kTaskPageTitle,
                      style: TextStyle(
                        color: ColorConstatns.kDarkGreyIcon,
                        fontSize: SizesConstants.kTopBarTitlePageSize,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: PaddingConstants.kBasePadding10,
                child: ShadowBoxContainer(
                  height: SizesConstants.kBottomNavigatiorHeight,
                  width: SizesConstants.kBottomNavigatiorWidth,
                  child: IconButton(
                    onPressed: () {
                      //TODO:  GO TO CREATE A NEW TASK PAGE
                    },
                    icon: IconsConstants.kAddIcon,
                  ),
                ),
              )
            ],
          ),
        ),
        //TODO: SCROLLABLE LIST OF TASKS
        //TODO: LIKE 10 TASKS HARDCODED
        //TODO: A TASK SHOULD HAVE AN OPTION TO BE DELETED ON SLIDE TO THE LEFT
        //TODO: OR MARKED AS DONE AND THAT SHOULD ADD APPRIOPRIATE VALUE TO THE PROGRESS BAR
        //TODO: AT THE TOP THERE SHOULD BE A PLUS ICON ALLOWING TO ADD A NEW TASK => CREATE A NEW TAST PAGE
      ],
    );
  }
}
