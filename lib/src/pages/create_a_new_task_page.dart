import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/src/constants/base_values.dart';
import 'package:login_logout_simple_ui/src/constants/color_constants.dart';
import 'package:login_logout_simple_ui/src/constants/list_constants.dart';
import 'package:login_logout_simple_ui/src/data/task.dart';
import 'package:login_logout_simple_ui/src/data/database_provider.dart';
import 'package:login_logout_simple_ui/src/widgets/create_new_task_button.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
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

  var dropDownDifficultyValue = null;

  var _addedTask = Task(
    title: '',
    difficulty: '',
    duration: 0.0,
    exp: 0.0,
  );

  void _saveTask() {
    setState(() {
      getExpGained();
      _addedTask = Task(
        title: widget.controller.text,
        difficulty: dropDownDifficultyValue,
        duration: double.parse(dropDownDurationValue),
        exp: expGainedValue,
      );
    });

    Provider.of<DataBaseProvider>(context, listen: false).addTask(_addedTask);
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
        getExpGained();
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
    getPercentageValue();
  }

  double percentageValue = 0.0;
  void getPercentageValue() {
    setState(() {
      percentageValue = expGainedValue / 300;
    });
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
            ShadowBoxContainer(
              height: SizesConstants.kTaskDurationTextFieldHeight,
              width: SizesConstants.kTaskDurationTextFieldWidth,
              child: Padding(
                padding: PaddingConstants.kLeftPadding25,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    dropdownWidth: SizesConstants.kTaskDurationDropDownMaxWidth,
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
            const Expanded(child: SizedBox()),
            SizesConstants.kSizedBox45height,
            CircularPercentIndicator(
              percent: percentageValue,
              backgroundColor: Colors.transparent,
              circularStrokeCap: CircularStrokeCap.round,
              lineWidth: SizesConstants.kProgressBarLineHeight,
              radius: 100,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
              ),
              linearGradient: LinearGradient(
                colors: [
                  ColorConstatns.kShadow1,
                  ColorConstatns.kShadow2,
                  ColorConstatns.kShadow3,
                  ColorConstatns.kShadow4,
                  ColorConstatns.kShadow5,
                  ColorConstatns.kShadow6,
                ],
              ),
            ),
            SizesConstants.kSizedBox45height,
            const Expanded(child: SizedBox()),
            GestureDetector(
              onTap: () {
                _saveTask();
                Provider.of<DataBaseProvider>(context, listen: false)
                    .updateDataBase();
              },
              child: const CreateNewTaskButton(
                title: StringConstants.kCreateButtonText,
              ),
            ),
            SizesConstants.kSizedBox45height,
          ],
        ),
      ),
    );
  }
}
