import 'dart:collection';

import 'package:core/core.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatefulWidget {
  static const loadingContentKey = ValueKey('loading');
  static const errorContentKey = ValueKey('error');
  static const successContentKey = ValueKey('success');

  static const successContentAnimationDuration = Duration(milliseconds: 400);

  final LoadingStatus status;
  final Widget loadingContent;
  final Widget errorContent;
  final Widget successContent;

  const LoadingView(
      {Key key,
      @required this.status,
      @required this.loadingContent,
      @required this.errorContent,
      @required this.successContent})
      : super(key: key);

  _LoadingViewState createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView>
    with TickerProviderStateMixin {
  AnimationController loadingController;
  AnimationController errorController;
  AnimationController successController;

  bool get loadingContentVisible => loadingController.value == 1.0;
  bool get errorContentVisible => errorController.value == 1.0;
  bool get successContentVisible => successController.value == 1.0;

  Queue<ValueGetter<TickerFuture>> animationStack = Queue();

  @override
  void initState() {
    super.initState();

    loadingController = AnimationController(
        duration: const Duration(milliseconds: 350), vsync: this);

    errorController = AnimationController(
        duration: const Duration(milliseconds: 350), vsync: this);

    successController = AnimationController(
        duration: const Duration(milliseconds: 350), vsync: this);

    switch (widget.status) {
      case LoadingStatus.idle:
      case LoadingStatus.loading:
        animationStack.add(loadingController.forward);
        break;
      case LoadingStatus.error:
        animationStack.add(errorController.forward);
        break;
      case LoadingStatus.success:
        animationStack.add(successController.forward);
        break;
    }

    _playAnimation();
  }

  @override
  void dispose() {
    loadingController.dispose();
    errorController.dispose();
    successController.dispose();
    super.dispose();
  }

  _playAnimation() async {
    await animationStack.first();
    animationStack.removeFirst();

    if (animationStack.isNotEmpty) {
      _playAnimation();
    }
  }

  @override
  void didUpdateWidget(LoadingView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.status != widget.status) {
      ValueGetter<TickerFuture> reverseAnimation;

      switch (oldWidget.status) {
        case LoadingStatus.idle:
        case LoadingStatus.loading:
          reverseAnimation = loadingController.reverse;
          break;
        case LoadingStatus.error:
          reverseAnimation = errorController.reverse;
          break;
        case LoadingStatus.success:
          reverseAnimation = successController.reverse;
          break;
      }

      animationStack.add(reverseAnimation);

      switch(widget.status){
         case LoadingStatus.idle:
        case LoadingStatus.loading:
          animationStack.add(loadingController.forward);
          break;
        case LoadingStatus.error:
          animationStack.add(errorController.forward);
          break;
        case LoadingStatus.success:
          animationStack.add(successController.forward);
          break;
      }

      _playAnimation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        TransitionAnimation(
          key: LoadingView.loadingContentKey,
          controller: loadingController,
          child: widget.loadingContent,
          isVisible: widget.status == LoadingStatus.loading,
        ),
        TransitionAnimation(
          key: LoadingView.errorContentKey,
          controller: errorController,
          child: widget.errorContent,
          isVisible: widget.status == LoadingStatus.error,
        ),
        TransitionAnimation(
          key: LoadingView.successContentKey,
          controller: successController,
          child: widget.successContent,
          isVisible: widget.status == LoadingStatus.success,
        ),
      ],
    );
  }
}

class TransitionAnimation extends StatelessWidget {
  TransitionAnimation({
    @required this.key,
    @required this.controller,
    @required this.child,
    @required this.isVisible,
  })  : _opacity = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.000,
              0.650,
              curve: Curves.ease,
            ),
          ),
        ),
        _yTranslation = Tween(begin: 40.0, end: 0.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.000,
              0.650,
              curve: Curves.ease,
            ),
          ),
        );

  final Key key;
  final AnimationController controller;
  final Widget child;
  final bool isVisible;

  final Animation<double> _opacity;
  final Animation<double> _yTranslation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return _opacity.value == 0.0
            ? const SizedBox.shrink()
            : IgnorePointer(
                key: key,
                ignoring: !isVisible,
                child: Transform(
                  transform: Matrix4.translationValues(
                    0.0,
                    _yTranslation.value,
                    0.0,
                  ),
                  child: Opacity(
                    opacity: _opacity.value,
                    child: child,
                  ),
                ),
              );
      },
    );
  }
}

