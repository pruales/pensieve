import 'package:flutter/material.dart';

class AppModals {
  static Future<T> showAppModal<T>(
      {@required BuildContext context,
      @required WidgetBuilder builder,
      Color color,
      double radius = 20.0,
      Color bgColor,
      int animationDurationMs = 225}) {
    assert(context != null);
    assert(builder != null);
    assert(radius != null && radius > 0.0);

    if (color == null) {
      color = Colors.white;
    }
    if (bgColor == null) {
      bgColor = Colors.black54;
    }

    return Navigator.push<T>(
        context,
        _AppModalRoute<T>(
            builder: builder,
            color: color,
            radius: radius,
            barrierLabel:
                MaterialLocalizations.of(context).modalBarrierDismissLabel,
            bgColor: bgColor,
            animationDurationMs: animationDurationMs));
  }
}

class _AppModalLayout extends SingleChildLayoutDelegate {
  _AppModalLayout(this.progress, this.bottomInset);

  final double progress;
  final double bottomInset;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints(
        minWidth: constraints.maxWidth,
        maxWidth: constraints.maxWidth,
        minHeight: 0.0,
        maxHeight: constraints.maxHeight * 0.2);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(0.0, size.height - bottomInset - childSize.height * progress);
  }

  @override
  bool shouldRelayout(_AppModalLayout oldDelegate) {
    return progress != oldDelegate.progress || bottomInset != oldDelegate.bottomInset;
  }
}

class _AppModalRoute<T> extends PopupRoute<T> {
  _AppModalRoute(
      {this.builder,
      this.barrierLabel,
      this.color,
      this.radius,
      RouteSettings settings,
      this.bgColor,
      this.animationDurationMs})
      : super(settings: settings);

  final WidgetBuilder builder;
  final double radius;
  final Color color;
  final Color bgColor;
  final int animationDurationMs;

  @override
  Color get barrierColor => bgColor;

  @override
  bool get barrierDismissible => true;

  @override
  String barrierLabel;

  AnimationController _animationController;
  CurvedAnimation appModalAnimation;

  @override
  AnimationController createAnimationController() {
    assert(_animationController == null);
    _animationController =
        BottomSheet.createAnimationController(navigator.overlay);
    _animationController.duration = Duration(milliseconds: animationDurationMs);

    this.appModalAnimation = CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
        reverseCurve: Curves.linear)
      ..addStatusListener((animationStatus) {
        if (animationStatus == AnimationStatus.completed) {
          appModalAnimation.curve = Curves.linear;
        }
      });
    return _animationController;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
        child: AnimatedBuilder(
          animation: appModalAnimation,
          builder: (context, child) => CustomSingleChildLayout(
                delegate: _AppModalLayout(appModalAnimation.value, MediaQuery.of(context).viewInsets.bottom),
                child: BottomSheet(
                  animationController: _animationController,
                  onClosing: () => Navigator.pop(context),
                  builder: (context) => Container(
                        decoration: BoxDecoration(
                          color: this.color,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(this.radius),
                            topRight: Radius.circular(this.radius),
                          ),
                        ),
                        child: Builder(builder: this.builder),
                      ),
                ),
              ),
        ),
      ),
    );
  }

  @override
  bool get maintainState => false;

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration =>
      Duration(milliseconds: animationDurationMs);
}
