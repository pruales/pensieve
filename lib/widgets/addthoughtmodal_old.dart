import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

typedef void _onThoughtAdded(String thought);
typedef void _onFormatChanged(ModalFormat format);

enum ModalFormat { hidden, normal, expanded, keyboardVisible }

class AddThoughtModal extends StatefulWidget {
  final TextEditingController thoughtEntryController;
  final _onThoughtAdded onAdd;
  final _onFormatChanged onFormatChanged;
  final bool showError;

  const AddThoughtModal(
      {Key key,
      @required this.thoughtEntryController,
      @required this.onAdd,
      this.showError,
      this.onFormatChanged})
      : assert(thoughtEntryController != null),
        assert(onAdd != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AddThoughtModalState();
  }
}

class _AddThoughtModalState extends State<AddThoughtModal> {
  final double _hiddenHeight = 0.0;
  final double _normalHeight = 99.0;
  final double _expandedHeight = 450.0;
  final int _expansionMillis = 250;
  final int _switchFocusMillis = 0;

  int _millis;
  double _height;
  FocusNode _focusNode;
  KeyboardVisibilityNotification _keyboardNotification;
  int _keyboardSubscriptionId;

  @override
  void initState() {
    super.initState();
    _height = _normalHeight;
    _millis = _expansionMillis;
    _focusNode = FocusNode();

    _keyboardNotification = KeyboardVisibilityNotification();
    _keyboardSubscriptionId = _keyboardNotification.addNewListener(
      onShow: () {
        print('keyboard show');
      },
      onHide: () {
        print('keyboard hide');
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _keyboardNotification.removeListener(_keyboardSubscriptionId);
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final children = [
      const SizedBox(
        height: 4.0,
      ),
      _buildHeader(),
      _buildBody(),
      const SizedBox(
        height: 6.0,
      ),
      Container(
        color: Colors.black,
        height: 1.0,
      )
    ];

    return WillPopScope(
      onWillPop: () {},
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 10.0)],
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Center(
        child: Icon(
      Icons.linear_scale,
      color: Colors.black,
    ));
  }

  Widget _buildBody() {
    return SizedBox(
      height: 64,
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(left:10.0),
          child: TextField(
            focusNode: _focusNode,
            controller: widget.thoughtEntryController,
            textInputAction: TextInputAction.done,
            textCapitalization: TextCapitalization.sentences,
            style: TextStyle().copyWith(
              color: Color(0xFF000000).withOpacity(0.77),
              fontSize: 17,
              letterSpacing: 0.25,
              fontFamily: "Rubik",
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}
