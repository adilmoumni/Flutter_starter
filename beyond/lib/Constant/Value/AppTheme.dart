import 'package:flutter/material.dart';

import 'Dimens.dart';

class AppTheme {
  AppTheme._();

  static const Color appColor = Color(0xFF6C2664);

  static const MaterialColor customColor =
      const MaterialColor(0xFF6C2664, const {
    50: Color.fromRGBO(108, 38, 100, .1),
    100: Color.fromRGBO(108, 38, 100, .2),
    200: Color.fromRGBO(108, 38, 100, .3),
    300: Color.fromRGBO(108, 38, 100, .4),
    400: Color.fromRGBO(108, 38, 100, .5),
    500: Color.fromRGBO(108, 38, 100, .6),
    600: Color.fromRGBO(108, 38, 100, .7),
    700: Color.fromRGBO(108, 38, 100, .8),
    800: Color.fromRGBO(108, 38, 100, .9),
    900: Color.fromRGBO(108, 38, 100, 1),
  });

  static const Color red_error = Color(0xFFEE0000);
  static const Color red = Color(0xFFD32F2F);
  static const Color walk_red = Color(0xFFB71C1C);
  static const Color gift_on = Color(0xFF4CCCAB);
  static const Color gift_off = Color(0xFFBFBFBF);
  static const Color disable_btn = Color.fromARGB(102, 69, 90, 100);

  static const Color gift_code_border = Color(0xD4F9F9F9);
  static const Color gift_code_bg = Color(0xFFDEDFDF);

  static const Color code_lock_bg = Color(0xFF4BAE50);

  static const Color dropdown_text = Color(0xFF3A3A3A);

  static const Color text_color = Color(0xFF3A3A3A);

  static const Color progress_bg = Color(0x4A9B9B9B);

  static const Color info_item_bg = Color(0xFFE5E5E5);

  static const Color nearlyBlack = Color(0xFF213333);
  static const Color dark_grey = Color(0xFF313A44);
  static const Color edittext_border = Color(0X1F000000);
  static const Color title_text = Color(0xFF333333);
  static const Color edit_text = Color(0xFF727272);
  static const Color text_gray = Color(0x6E333333);
  static const Color gray_text = Color(0xFF6C6C6C);
  static const Color chipBackground = Color(0xFFFBFBFB);
  static const Color edittext_black = Color(0xFF4A4A4A);

  static const Color divider_bg = Color(0xFFDCDCDC);

  static const Color notif_Title = Color(0xFF565757);

  static const Color bgCompleteItem = Color(0x114BAE50);
  static const Color borderCompleteItem = Color(0x4D4BAE50);
  static const Color avatarBgCompleteItem = Color(0xFF4BAE50);

  static const Color bgNonStartItem = Color(0x12FFFFFF);
  static const Color borderNonStartItem = Color(0xFFD8D8D8);
  static const Color avatarBgNonStartItem = Color(0xFFD8D8D8);

  static const Color bgBlockItem = Color(0xFFF5F5F5);
  static const Color borderBlockItem = Color(0xFFD8D8D8);
  static const Color avatarBgBlockItem = Color(0xFFD8D8D8);

  static const Color questionColor = Color(0xFF2D2D3A);

  static const Color buttonShadow = Color(0x61DD2626);
  static const Color lightDark = Color(0x804A4A4A);
  static const Color fb_btn = Color(0xFF3B5998);
  static const Color toolbar_text = Color(0xFF585858);

  static const String fontCircularStdBlack = 'Circularstd-Black';
  static const String fontCircularStdBlackItalic = 'Circularstd-Blackitalic';
  static const String fontCircularStdBold = 'Circularstd-Bold';
  static const String fontCircularStdBoldItalic = 'Circularstd-Bolditalic';
  static const String fontCircularStdBook = 'Circularstd-Book';
  static const String fontCircularStdBookItalic = 'Circularstd-Bookitalic';
  static const String fontCircularStdMedium = 'Circularstd-Medium';
  static const String fontCircularStdMediumItalic = 'Circularstd-Mediumitalic';

  static const TextTheme textTheme = TextTheme(
    headline4: display1,
    headline5: headline,
    headline6: title,
    subtitle2: subtitle,
    bodyText2: body2,
    bodyText1: body1,
    caption: caption,
  );

  static const TextStyle display1 = TextStyle(
    // h4 -> display1
    fontFamily: fontCircularStdMedium,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: title_text,
  );

  static const TextStyle headline = TextStyle(
    // h5 -> headline
    fontFamily: fontCircularStdMedium,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: title_text,
  );

  static const TextStyle title = TextStyle(
    // h6 -> title
    fontFamily: fontCircularStdMedium,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: title_text,
  );

  static const TextStyle subtitle = TextStyle(
    // subtitle2 -> subtitle
    fontFamily: fontCircularStdMedium,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: title_text,
  );

  static const TextStyle body2 = TextStyle(
    // body1 -> body2
    fontFamily: fontCircularStdMedium,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: title_text,
  );

  static const TextStyle body1 = TextStyle(
    // body2 -> body1
    fontFamily: fontCircularStdMedium,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: title_text,
  );

  static const TextStyle caption = TextStyle(
    // Caption -> caption
    fontFamily: fontCircularStdMedium,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: title_text, // was lightText
  );

  static const TextStyle headerEditText = TextStyle(
      color: text_gray,
      fontSize: Dimens.text_size_medium,
      fontFamily: fontCircularStdMedium);

  static const TextStyle walk_title = TextStyle(
      color: appColor,
      fontSize: Dimens.text_size_large,
      fontFamily: fontCircularStdMedium);

  static const TextStyle walk_desc = TextStyle(
      color: Colors.black45,
      fontSize: Dimens.text_size_medium,
      fontFamily: fontCircularStdMedium);

  static const TextStyle walk_btn = TextStyle(
      fontSize: Dimens.text_size_xmedium,
      color: Colors.white,
      fontFamily: fontCircularStdMedium);

  static const TextStyle info_general_text = TextStyle(
      color: dropdown_text,
      fontFamily: fontCircularStdMedium,
      fontSize: Dimens.text_size_mediumx);

  static const TextStyle dropdown_area_avaible = TextStyle(
      color: dropdown_text,
      fontFamily: fontCircularStdMedium,
      fontSize: Dimens.text_size_mediumx);

  static const TextStyle title_lable = TextStyle(
      color: Color(0xFF3A3A3A),
      fontFamily: fontCircularStdMedium,
      fontSize: Dimens.text_size_mediumx);

  static const TextStyle userInfoTitle = TextStyle(
      color: Color(0xFF333A4F),
      fontFamily: fontCircularStdBold,
      fontSize: Dimens.text_size_mediumx);

  static const TextStyle userInfoSubtitle = TextStyle(
      color: Color(0xFF333A4F),
      fontFamily: fontCircularStdBook,
      fontSize: Dimens.text_size_mediumx);
}
