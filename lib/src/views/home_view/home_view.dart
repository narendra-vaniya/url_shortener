import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_shortener/src/assets/bg.dart';
import 'package:url_shortener/src/helpers/ui_helper.dart';
import 'package:url_shortener/src/helpers/utils_helper.dart';
import 'package:url_shortener/src/themes/app_theme.dart';
import 'package:url_shortener/src/views/home_view/events/home_view_events.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var _urlInputController = TextEditingController();
  @override
  void dispose() {
    _urlInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgColor,
      body: CustomPaint(
        painter: RPSCustomPainter(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UIHelper.text(
                'Create alternate links \nwith one click',
                txtColor: Colors.white,
                fontSize: UtilsHelper.headingFontSize(context),
              ),
              SizedBox(height: 35),
              Container(
                child: UIHelper.inputFelid(
                  context,
                  _urlInputController,
                  hintText: 'Add url',
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: UtilsHelper.paddingSize(context),
                ),
              ),
              SizedBox(height: 16),
              UIHelper.button(
                context,
                onClick: _generateBtnEvent,
                txt: 'Generate',
              ),
              SizedBox(height: 16)
            ],
          ),
        ),
      ),
    );
  }

  /// [ Methods ]
  void _generateBtnEvent() async {
    FocusScope.of(context).requestFocus(new FocusNode());
    String _res = await generateShortenLink(_urlInputController.text, context);
    if (_res.isNotEmpty) {
      showDialog(
        context: context,
        builder: (_) {
          return SimpleDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            children: [
              ListTile(
                title: UIHelper.text(
                  '$_res',
                  txtColor: AppTheme.primaryColor,
                  fontSize: UtilsHelper.bodyFontSize(context),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.copy),
                  onPressed: () async {
                    await Clipboard.setData(ClipboardData(text: '$_res'));
                    UIHelper.snackBar(context, msg: '$_res copied');
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          );
        },
      );
    }
  }
}
