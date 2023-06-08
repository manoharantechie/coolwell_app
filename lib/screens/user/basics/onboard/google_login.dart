import 'dart:convert';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'login.dart';

void main() async {
  if (kIsWeb || defaultTargetPlatform == TargetPlatform.macOS) {
    // initialiaze the facebook javascript SDK
    await FacebookAuth.instance.webAndDesktopInitialize(
      appId: "1296087784613102",
      cookie: true,
      xfbml: true,
      version: "v15.0",
    );
  }
  runApp(SignUp_Screen());
}

String prettyPrint(Map json) {
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String pretty = encoder.convert(json);
  return pretty;
}