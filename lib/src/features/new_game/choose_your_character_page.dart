import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/src/constants/padding_constants.dart';
import 'package:login_logout_simple_ui/src/constants/string_constants.dart';
import 'package:login_logout_simple_ui/src/data/database_provider.dart';
import 'package:login_logout_simple_ui/src/features/main/home_page.dart';
import 'package:login_logout_simple_ui/src/features/new_game/choose_ur_character_appbar.dart';
import 'package:login_logout_simple_ui/src/features/task_components/create_new_task_button.dart';
import 'package:login_logout_simple_ui/src/features/universal_components/input_textfield.dart';
import 'package:provider/provider.dart';
import '../../constants/color_constants.dart';
import '../../constants/images_constants.dart';
import '../../constants/sizes_constants.dart';
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
        _pickedCharacter = ImagesConstants.kWomanCharacterPNG;
      } else if (selectedBox == 0) {
        _pickedCharacter = ImagesConstants.kManCharacterPNG;
      }
    });
    Provider.of<DataBaseProvider>(context, listen: false)
        .addName(_eneteredName);
    Provider.of<DataBaseProvider>(context, listen: false)
        .addSurname(_eneteredSurname);
    Provider.of<DataBaseProvider>(context, listen: false)
        .pickedCharacter(_pickedCharacter);
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
                        child: Image.asset(
                          ImagesConstants.kManCharacterPNG,
                        ),
                      ),
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
                        child: Image.asset(
                          ImagesConstants.kWomanCharacterPNG,
                        ),
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
                  //TODO: CHECK IF CHARACTER HAS BEEN PICKED AND NAME AND SUERNAME HAVE BEEN ENETERED
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const HomePage(),
                    ),
                  );
                  _saveData();
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
