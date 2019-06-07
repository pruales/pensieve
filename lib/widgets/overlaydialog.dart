import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OverlayDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OverlayDialogState();
  }
}

class OverlayDialogState extends State<OverlayDialog>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _scaleAnimation;
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.show');
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    _scaleAnimation = CurvedAnimation(
        parent: _animationController, curve: Curves.elasticInOut);

    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.forward();

    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                autofocus: true,
                autocorrect: false,
                textInputAction: TextInputAction.done,
                focusNode: _focusNode,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//
//AlertDialog
//(
//shape: RoundedRectangleBorder
//(
//borderRadius: BorderRadius.circular(20.0
//)
//)
//,
//title: Text
//('TEST
//'
//)
//,
//actions: <
//Widget>[
//FlatButton
//(
//child: Text
//('ok
//'
//)
//,
//onPressed: () {
//Navigator.of(context).pop();
//},
//)
//]
//,
//content: TextField
//(
//autocorrect: false
//,
//textInputAction: TextInputAction.done,onEditingComplete: () {
//SystemChannels.textInput
//    .invokeMethod('TextInput.show');
//},
//onSubmitted: (
//value) {
//value += ' ';
//thoughtController.text += value;
//thoughtController.selection =
//TextSelection.collapsed(
//offset:
//thoughtController.text.length);
//Navigator.of(context).pop();
//},
//)
//,
//);
//}
//)
//.
//then
//((value) {
//FocusScope.of(context).requestFocus(_focusNode);
//});
