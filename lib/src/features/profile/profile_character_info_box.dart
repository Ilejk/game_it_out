import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/src/features/profile/profile_character_box.dart';
import '../../constants/color_constants.dart';
import '../../constants/list_constants.dart';
import '../../constants/padding_constants.dart';
import '../../constants/sizes_constants.dart';
import '../../constants/string_constants.dart';
import '../../constants/textstyle_constants.dart';
import '../../logic/logic_provider.dart';

class CharacterBoxInfo extends StatelessWidget {
  const CharacterBoxInfo({
    Key? key,
    required this.namingData,
  }) : super(key: key);

  final LogicProvider namingData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingConstants.kBasePadding10,
      child: Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: SizesConstants.kBorderRadius12,
          gradient: LinearGradient(
            colors: ListConstants.kGradientColorList,
          ),
          boxShadow: [
            BoxShadow(
              color: ColorConstatns.kMediumGrey,
              blurRadius: 12,
              offset: const Offset(5, 5),
            ),
            const BoxShadow(
              color: ColorConstatns.kWhite,
              blurRadius: 12,
              offset: Offset(-5, -5),
            ),
          ],
        ),
        child: Padding(
          padding: PaddingConstants.kBasePadding10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ProfileCharacterBox(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    StringConstants.kCharacterName,
                    style: TextStyleConstants.kCharacterBoxBoldTextStyle,
                  ),
                  SizesConstants.kSizedBox20height,
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          StringConstants.kName,
                          style: TextStyleConstants.kCharacterBoxBoldTextStyle,
                        ),
                        Text(
                          namingData.name,
                          style: TextStyleConstants.kCharacterBoxThinTextStyle,
                        ),
                      ]),
                  SizesConstants.kSizedBox15height,
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          StringConstants.kSurname,
                          style: TextStyleConstants.kCharacterBoxBoldTextStyle,
                        ),
                        Text(
                          namingData.surname,
                          style: TextStyleConstants.kCharacterBoxThinTextStyle,
                        ),
                      ]),
                ],
              ),
              SizesConstants.kSizedBox20width,
            ],
          ),
        ),
      ),
    );
  }
}
