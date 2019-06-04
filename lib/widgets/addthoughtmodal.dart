import 'package:flutter/material.dart';
import 'modals.dart';

class AddThoughtModal {
  mainBottomSheet(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    AppModals.showAppModal(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            minimum: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.035),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: TextField(),
            ),
          );
        });
  }
}
