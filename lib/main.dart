import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';

import 'package:pensieve/screens/sign_in_widget.dart';

void main() {

  //debugPaintSizeEnabled = true;

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(canvasColor: Colors.transparent),
      home: SignInWidget(),
    );
  }
}
