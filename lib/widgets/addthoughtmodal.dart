import 'package:flutter/material.dart';
import 'modals.dart';

class AddThoughtModal {
  TextEditingController thoughtController = TextEditingController();

  mainBottomSheet(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    FocusNode _focusNode = FocusNode();
    Future<void> future = AppModals.showAppModal(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            minimum: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.035),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: TextField(
                focusNode: _focusNode,
                autofocus: true,
                onEditingComplete: () {
                  print('editing complete');
                },
                onSubmitted: (value) {
                  print('submitted: ' + value);
                  Navigator.of(context).pop();
                },
                controller: thoughtController,
              ),
            ),
          );
        });

    future.then((void value) {
      _focusNode.unfocus();
      thoughtController.text = '';
    });

    thoughtController.addListener(() {
      print(thoughtController.text);
    });
  }
}
