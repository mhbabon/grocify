import '../../constants/colors.dart';
import '../extension/custom_color_extension.dart';

class TCustomColor {
  TCustomColor._();

  static CustomColorExtension lightCustomColorExtension = CustomColorExtension(
      darkGreyColor: TColors.grey,
      tabBarColor: TColors.white,
  );

  static CustomColorExtension darkCustomColorExtension = CustomColorExtension(
      darkGreyColor: TColors.darkerGrey,
      tabBarColor: TColors.black,
  );
}
