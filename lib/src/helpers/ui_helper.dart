import 'package:flutter/material.dart';
import 'package:url_shortener/src/helpers/utils_helper.dart';
import 'package:url_shortener/src/themes/app_theme.dart';

class UIHelper {
  /// [ Text Widget ]
  static Widget text(
    String txt, {
    double fontSize = 50,
    Color txtColor = Colors.black,
  }) {
    return Text(
      txt,
      style: AppTheme.txtStyle(
        fontSize: fontSize,
        color: txtColor,
      ),
      textAlign: TextAlign.center,
    );
  }

  /// [ Button Widget ]
  static Widget button(
    BuildContext context, {
    required Function() onClick,
    required String txt,
  }) {
    return ElevatedButton(
      onPressed: onClick,
      child: UIHelper.text(txt,
          fontSize: UtilsHelper.bodyFontSize(context), txtColor: Colors.white),
      style: ButtonStyle(
        padding: _MSProperty<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        ),
        shape: _MSProperty<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        ),
        backgroundColor: _MSProperty<Color>(AppTheme.primaryColor),
      ),
    );
  }

  /// [ Input Widget ]
  static Widget inputFelid(
    BuildContext context,
    TextEditingController controller, {
    String hintText = '',
    Widget suffix = const SizedBox(),
  }) {
    return TextFormField(
      controller: controller,
      style: AppTheme.txtStyle(
          fontSize: UtilsHelper.bodyFontSize(context), color: AppTheme.bgColor),
      decoration:
          AppTheme.inputStyle(context, hintText: hintText, suffix: suffix),
    );
  }

  static _MSProperty<T>(value) {
    return MaterialStateProperty.all<T>(value);
  }

  ///[ SnackBar]
  static snackBar(BuildContext context, {required msg}) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          elevation: 3,
          backgroundColor: AppTheme.bgColor.withOpacity(0.5),
          content: UIHelper.text(
            '$msg',
            txtColor: Colors.white,
            fontSize: UtilsHelper.bodyFontSize(context) + 3,
          ),
        ),
      );

  /// [ Loading indicator ]
  static loadingIndicator(BuildContext context) => showDialog(
        context: context,
        builder: (_) {
          return Center(
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsetsDirectional.all(15),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(AppTheme.bgColor),
              ),
            ),
          );
        },
      );
}
