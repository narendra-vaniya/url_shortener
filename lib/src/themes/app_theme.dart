import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_shortener/src/helpers/utils_helper.dart';

class AppTheme {
  /// [ Colors ]
  static Color primaryColor = Color(0xFFf47c63);
  static Color bgColor = Color(0xFF021746);
  static Color fontColor = Colors.white;

  /// [ Light theme ]
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: bgColor,
  );

  /// [ TextStyle ]
  static TextStyle txtStyle({
    double fontSize = 50,
    Color color =  Colors.black,
  }) =>
      GoogleFonts.robotoSlab(
        color: color,
        fontSize: fontSize,
        
      );

  /// [ Input box style ]
  static InputDecoration inputStyle(BuildContext context,{
    String hintText='Search',
    Widget suffix = const SizedBox()
  }) {
    return InputDecoration(
      suffix: suffix,
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      hintText:hintText,
      
      hintStyle: txtStyle(fontSize: UtilsHelper.bodyFontSize(context),color: Colors.grey),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
