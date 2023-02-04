import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:login_logout_simple_ui/src/constants/base_values.dart';
import 'package:login_logout_simple_ui/src/constants/color_constants.dart';
import 'package:login_logout_simple_ui/src/constants/list_constants.dart';
import 'package:login_logout_simple_ui/src/providers/task.dart';
import 'package:login_logout_simple_ui/src/providers/task_provider.dart';
import 'package:provider/provider.dart';
import '../constants/padding_constants.dart';
import '../constants/sizes_constants.dart';
import '../constants/string_constants.dart';
import '../constants/textstyle_constants.dart';
import '../widgets/appbars/create_a_new_task_page_appbar.dart';
import '../widgets/shadow_box_container.dart';

class CreateANewTaskPage extends StatefulWidget {
  final controller = TextEditingController();

  CreateANewTaskPage({super.key});

  @override
  State<CreateANewTaskPage> createState() => _CreateANewTaskPageState();
}

class _CreateANewTaskPageState extends State<CreateANewTaskPage> {
  // ignore: avoid_init_to_null
  final _storageBox = Hive.box('tBox');
  var dropDownDifficultyValue = null;
  var _addedTask = Task(
    title: '',
    difficulty: '',
    duration: 0.0,
    exp: 0.0,
  );

  void _saveTask() {
    setState(() {
      _addedTask = Task(
        title: widget.controller.text,
        difficulty: dropDownDifficultyValue,
        duration: double.parse(dropDownDurationValue),
        exp: expGainedValue,
      );
    });

    Provider.of<TaskProvider>(context, listen: false).addTask(_addedTask);
    Navigator.of(context).pop();
  }

  void dropDownCallBack(Object? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        dropDownDifficultyValue = selectedValue;
      });
    }
  }

  // ignore: avoid_init_to_null
  var dropDownDurationValue = null;
  void dropDownCallBackDuration(Object? selectedDurationValue) {
    if (selectedDurationValue is String) {
      setState(() {
        dropDownDurationValue = selectedDurationValue;
      });
    }
  }

  double expGainedValue = BaseValues.kBaseExpValue;
  void getExpGained() {
    if (dropDownDifficultyValue == 'Easy') {
      setState(() {
        expGainedValue = double.parse(dropDownDurationValue) *
            BaseValues.kEasyDifficultyValue *
            BaseValues.kBaseExpValueGiven;
      });
    } else if (dropDownDifficultyValue == 'Medium') {
      setState(() {
        expGainedValue = double.parse(dropDownDurationValue) *
            BaseValues.kMediumDifficultyValue *
            BaseValues.kBaseExpValueGiven;
      });
    } else if (dropDownDifficultyValue == 'Hard') {
      setState(() {
        expGainedValue = double.parse(dropDownDurationValue) *
            BaseValues.kHardDifficultyValue *
            BaseValues.kBaseExpValueGiven;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(5.0),
        child: AppBar(
          elevation: 0.0,
          backgroundColor: ColorConstatns.kDarkGrey,
        ),
      ),
      backgroundColor: ColorConstatns.kBackGroundGrey,
      body: SafeArea(
        child: Column(
          children: [
            const CreateAnewTaskPageAppBar(),
            SizesConstants.kSizedBox45height,
            ShadowBoxContainer(
              height: SizesConstants.kTaskNameTextFieldHeight,
              width: SizesConstants.kTaskNameTextFieldWidth,
              child: Padding(
                padding: PaddingConstants.kLeftPadding25,
                child: TextField(
                  controller: widget.controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: StringConstants.kTaskNameHintText,
                  ),
                ),
              ),
            ),
            SizesConstants.kSizedBox45height,
            ShadowBoxContainer(
              height: SizesConstants.kTaskDifficultyTextFieldHeight,
              width: SizesConstants.kTaskDifficultyTextFieldWidth,
              child: Padding(
                padding: PaddingConstants.kLeftPadding25,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    dropdownMaxHeight:
                        SizesConstants.kTaskDifficultyDropDownMaxHeight,
                    dropdownWidth:
                        SizesConstants.kTaskDifficultyDropDownMaxWidth,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: SizesConstants.kBorderRadius12,
                      color: ColorConstatns.kBackGroundGrey,
                    ),
                    iconSize: 0.0,
                    onChanged: dropDownCallBack,
                    value: dropDownDifficultyValue,
                    hint: const Text(StringConstants.kDifficultyHintText),
                    items: ListConstants.kDifficultyList,
                  ),
                ),
              ),
            ),
            SizesConstants.kSizedBox45height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShadowBoxContainer(
                  height: SizesConstants.kTaskDurationTextFieldHeight,
                  width: SizesConstants.kTaskDurationTextFieldWidth,
                  child: Padding(
                    padding: PaddingConstants.kLeftPadding25,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        dropdownWidth:
                            SizesConstants.kTaskDurationDropDownMaxWidth,
                        dropdownMaxHeight:
                            SizesConstants.kTaskDurationDropDownMaxHeight,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: SizesConstants.kBorderRadius12,
                          color: ColorConstatns.kBackGroundGrey,
                        ),
                        iconSize: 0.0,
                        onChanged: dropDownCallBackDuration,
                        value: dropDownDurationValue,
                        hint: const Text(StringConstants.kDurationHintText),
                        items: ListConstants.kDurationsList,
                      ),
                    ),
                  ),
                ),
                SizesConstants.kSizedBox55width,
                Column(
                  children: [
                    Text(
                      StringConstants.kExp,
                      style: TextStyleConstants.kTaskSubTitleTextStyle,
                    ),
                    SizesConstants.kSizedBox10height,
                    Text(
                      expGainedValue.toStringAsFixed(2),
                      style: TextStyleConstants.kTaskSubTitleTextStyle,
                    ),
                  ],
                )
              ],
            ),
            const Expanded(child: SizedBox()),
            SizesConstants.kSizedBox45height,
            GestureDetector(
              onTap: getExpGained,
              child: ShadowBoxContainer(
                height: SizesConstants.kTaskCalculateButtonHeight,
                width: SizesConstants.kTaskCalculateButtonWidth,
                child: Center(
                  child: Text(
                    StringConstants.kCalculateButtonText,
                    style: TextStyleConstants.kTaskSubTitleTextStyle,
                  ),
                ),
              ),
            ),
            SizesConstants.kSizedBox45height,
            GestureDetector(
              onTap: () {
                _saveTask();
                Provider.of<TaskProvider>(context, listen: false)
                    .updateDataBase();
              },
              child: ShadowBoxContainer(
                height: SizesConstants.kTaskCreateButtonHeight,
                width: SizesConstants.kTaskCreateteButtonWidth,
                child: Center(
                  child: Text(
                    StringConstants.kCreateButtonText,
                    style: TextStyleConstants.kTaskSubTitleTextStyle,
                  ),
                ),
              ),
            ),
            SizesConstants.kSizedBox45height,
          ],
        ),
      ),
    );
  }
}
