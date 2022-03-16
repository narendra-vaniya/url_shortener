import 'package:flutter/material.dart';
import 'package:url_shortener/src/assets/config.dart';
import 'package:url_shortener/src/helpers/ui_helper.dart';
import 'package:dio/dio.dart';

Future<String> generateShortenLink(String url, BuildContext context) async {
  if (url.isEmpty) {
    UIHelper.snackBar(context, msg: 'Please enter url');
    return '';
  } else if (!isValidUrl(url)) {
    UIHelper.snackBar(context, msg: 'Please enter valid url');
    return '';
  } else {
    UIHelper.loadingIndicator(context);
    try {
      Map<String, String> headers = {
        'Authorization': 'Bearer ${AppConfig.key}',
        'Content-Type': 'application/json'
      };

      var dio = Dio();
      dio.options.headers = headers;

      var res = await dio.post('https://api-ssl.bitly.com/v4/shorten',
          data: {'long_url': url}).catchError((err) {
        print(err);
      });
      Navigator.pop(context);

      if (res.statusCode == 200) {
        print(res.data['link']);
        return res.data['link'];
      } else {
        UIHelper.snackBar(context,
            msg: 'Something went wrong.Please try again.');
        return '';
      }
    } catch (e) {
      if (Navigator.canPop(context)) Navigator.pop(context);
      print(e);
      return '';
    }
  }
}

bool isValidUrl(String url) {
  RegExp exp =
      new RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
  return exp.hasMatch(url);
}
