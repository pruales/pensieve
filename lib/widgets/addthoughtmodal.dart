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
                bottom: MediaQuery.of(context).size.height * 0.001),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 15.0, bottom: 5.0, left: 30.0, right: 30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    focusNode: _focusNode,
                    autofocus: true,
                    textInputAction: TextInputAction.done,
                    textCapitalization: TextCapitalization.sentences,
                    style: TextStyle(
                        color: Color(0xFF000000).withOpacity(0.77),
                        fontSize: 17,
                        letterSpacing: 0.25,
                        fontFamily: "Rubik",
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'New Thought',
                        hintStyle: TextStyle(
                            color: Color(0xFF000000).withOpacity(0.50),
                            fontSize: 17,
                            letterSpacing: 0.25,
                            fontFamily: "Rubik",
                            fontWeight: FontWeight.w500)),
                    onEditingComplete: () {
                      print('editing complete');
                    },
                    onSubmitted: (value) {
                      print('submitted: ' + value);
                      Navigator.of(context).pop();
                    },
                    controller: thoughtController,
                  ),
                  IconButton(
                      icon: Icon(Icons.check_box_outline_blank),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(0.0),
                      iconSize: 24,
                      onPressed: () {
                        thoughtController.text += '#';
                        thoughtController.selection = TextSelection.collapsed(
                            offset: thoughtController.text.length);
                      })
                ],
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
