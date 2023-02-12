import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:login_logout_simple_ui/src/constants/animation_constants.dart';
import 'package:login_logout_simple_ui/src/constants/base_values.dart';
import 'package:login_logout_simple_ui/src/constants/color_constants.dart';
import 'package:login_logout_simple_ui/src/constants/list_constants.dart';
import 'package:login_logout_simple_ui/src/features/task_components/task.dart';
import 'package:login_logout_simple_ui/src/features/task_components/create_new_task_button.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../constants/padding_constants.dart';
import '../../constants/sizes_constants.dart';
import '../../constants/string_constants.dart';
import '../../logic/logic_provider.dart';
import 'create_a_new_task_page_appbar.dart';
import 'create_a_new_task_percentage_bar.dart';
import '../universal_components/shadow_box_container.dart';

class CreateANewTaskPage extends StatefulWidget {
  final controller = TextEditingController();

  CreateANewTaskPage({super.key});

  @override
  State<CreateANewTaskPage> createState() => _CreateANewTaskPageState();
}

class _CreateANewTaskPageState extends State<CreateANewTaskPage> {
  // ignore: avoid_init_to_null
  var dropDownDifficultyValue = null;
  // ignore: avoid_init_to_null
  var dropDownDurationValue = null;
  double expGainedValue = BaseValues.kBaseExpValue;
  double percentageValue = 0.0;

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

    Provider.of<LogicProvider>(context, listen: false).addTask(_addedTask);
    Navigator.of(context).pop();
    Provider.of<LogicProvider>(context, listen: false).updateDataBase();
  }

  void dropDownCallBack(Object? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        dropDownDifficultyValue = selectedValue;
      });
    }
  }

  void dropDownCallBackDuration(Object? selectedDurationValue) {
    if (selectedDurationValue is String) {
      setState(() {
        dropDownDurationValue = selectedDurationValue;
        getExpGained();
      });
    }
  }

  void getExpGained() {
    double difficultyFactor;
    switch (dropDownDifficultyValue) {
      case 'Easy':
        difficultyFactor = BaseValues.kEasyDifficultyValue;
        break;
      case 'Medium':
        difficultyFactor = BaseValues.kMediumDifficultyValue;
        break;
      case 'Hard':
        difficultyFactor = BaseValues.kHardDifficultyValue;
        break;
      default:
        difficultyFactor = 1.0;
        break;
    }

    expGainedValue = double.parse(dropDownDurationValue) *
        difficultyFactor *
        BaseValues.kBaseExpValueGiven;

    getPercentageValue();
  }

  void getPercentageValue() {
    setState(() {
      percentageValue = expGainedValue / 300;
    });
  }

  void _saveNewTask(BuildContext ctx) async {
    if (dropDownDifficultyValue == null ||
        dropDownDurationValue == null ||
        widget.controller.text == '') {
      _playAnimation(ctx, AnimationConstants.kWrong);
    } else {
      await _playAnimation(ctx, AnimationConstants.kFinished);
      _saveTask();
    }
  }

  Future<dynamic> _playAnimation(BuildContext ctx, String animation) async {
    await Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.black54,
        pageBuilder: (BuildContext context, _, __) {
          return Lottie.asset(
            animation,
            repeat: false,
            width: 100,
            height: 100,
            onLoaded: (composition) {
              Future.delayed(composition.duration, () {
                Navigator.pop(context);
              });
            },
          );
        },
      ),
    );
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
        child: AnimationLimiter(
          child: Column(
              children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 300),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: MediaQuery.of(context).size.width / 2,
              child: FadeInAnimation(child: widget),
            ),
            children: [
              const CreateAnewTaskPageAppBar(),
              SizesConstants.kSizedBox45height,
              ShadowBoxContainer(
                color: ColorConstatns.kBackGroundGrey,
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
                color: ColorConstatns.kBackGroundGrey,
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
                color: ColorConstatns.kBackGroundGrey,
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
              SizesConstants.kSizedBox45height,
              PercentageBarExpValueIndicator(
                percentageValue: percentageValue,
                expGainedValue: expGainedValue,
              ),
              SizesConstants.kSizedBox45height,
              GestureDetector(
                onTap: () {
                  _saveNewTask(context);
                },
                child: const ShadowBoxBlack(
                  title: StringConstants.kCreateButtonText,
                ),
              ),
              SizesConstants.kSizedBox45height,
            ],
          )),
        ),
      ),
    );
  }
}
