import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/src/constants/animation_constants.dart';
import 'package:login_logout_simple_ui/src/constants/padding_constants.dart';
import 'package:login_logout_simple_ui/src/constants/string_constants.dart';
import 'package:login_logout_simple_ui/src/features/main/home_page.dart';
import 'package:login_logout_simple_ui/src/features/new_game/choose_ur_character_appbar.dart';
import 'package:login_logout_simple_ui/src/features/task_components/create_new_task_button.dart';
import 'package:login_logout_simple_ui/src/features/universal_components/input_textfield.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../constants/color_constants.dart';
import '../../constants/sizes_constants.dart';
import '../../logic/logic_provider.dart';
import '../universal_components/shadow_box_container.dart';

class ChooseYourCharacterPage extends StatefulWidget {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();

  ChooseYourCharacterPage({super.key});
  @override
  State<ChooseYourCharacterPage> createState() =>
      _ChooseYourCharacterPageState();
}

class _ChooseYourCharacterPageState extends State<ChooseYourCharacterPage> {
  int selectedBox = -1;
  var _eneteredName = '';
  var _eneteredSurname = '';
  var _pickedCharacter = '';

  void _changeColor(int index) {
    setState(() {
      selectedBox = index;
    });
  }

  void _saveData() {
    setState(() {
      _eneteredName = widget.nameController.text;
      _eneteredSurname = widget.surnameController.text;
      if (selectedBox == 1) {
        _pickedCharacter = AnimationConstants.kWoman;
      } else if (selectedBox == 0) {
        _pickedCharacter = AnimationConstants.kMan;
      }
    });
    Provider.of<LogicProvider>(context, listen: false)
        .addName(_eneteredName, _eneteredSurname, _pickedCharacter);
  }

  void _validation(BuildContext ctx) async {
    _saveData();
    if (_eneteredName == '' ||
        _eneteredSurname == '' ||
        _pickedCharacter == '') {
      _playAnimation(ctx, AnimationConstants.kWrong);
    } else {
      await _playAnimation(ctx, AnimationConstants.kFinished);
      _saveData();
      // ignore: use_build_context_synchronously
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => const HomePage(),
        ),
      );
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
        child: Column(
          children: [
            const ChooseYourCharacterAppBar(),
            SizesConstants.kSizedBox45height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => _changeColor(0),
                  child: ShadowBoxContainer(
                    color: selectedBox == 0
                        ? ColorConstatns.kWhite
                        : ColorConstatns.kBackGroundGrey,
                    height: SizesConstants.kChooseYourCharacterBoxHeight,
                    width: SizesConstants.kChooseYourCharacterBoxWidth,
                    child: Padding(
                      padding: PaddingConstants.kBasePadding10,
                      child: ClipRRect(
                          borderRadius: SizesConstants.kBorderRadius12,
                          child: Lottie.asset(AnimationConstants.kMan)),
                    ),
                  ),
                ),
                SizesConstants.kSizedBox15width,
                InkWell(
                  onTap: () => _changeColor(1),
                  child: ShadowBoxContainer(
                    color: selectedBox == 1
                        ? ColorConstatns.kWhite
                        : ColorConstatns.kBackGroundGrey,
                    height: SizesConstants.kChooseYourCharacterBoxHeight,
                    width: SizesConstants.kChooseYourCharacterBoxWidth,
                    child: Padding(
                      padding: PaddingConstants.kBasePadding10,
                      child: ClipRRect(
                        borderRadius: SizesConstants.kBorderRadius12,
                        child: Lottie.asset(AnimationConstants.kWoman),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizesConstants.kSizedBox45height,
            Padding(
              padding: PaddingConstants.kBasePadding10,
              child: InputTextFieldWidget(
                controller: widget.nameController,
                hintText: StringConstants.kEnterName,
                obscureText: false,
              ),
            ),
            Padding(
              padding: PaddingConstants.kBasePadding10,
              child: InputTextFieldWidget(
                controller: widget.surnameController,
                hintText: StringConstants.kEnterSurname,
                obscureText: false,
              ),
            ),
            SizesConstants.kSizedBox45height,
            Padding(
              padding: PaddingConstants.kBasePadding10,
              child: GestureDetector(
                onTap: () {
                  _validation(context);
                },
                child: const ShadowBoxBlack(
                  title: StringConstants.kProcede,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
