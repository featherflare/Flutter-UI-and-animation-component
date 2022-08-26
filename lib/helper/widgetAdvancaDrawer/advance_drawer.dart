import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practice_ui/helper/widgetAdvancaDrawer/advance_drawer_controller.dart';
import 'package:practice_ui/helper/widgetAdvancaDrawer/filp_card_controller.dart';

enum FlipDirection {
  VERTICAL,
  HORIZONTAL,
}

enum Fill { none, fillFront, fillBack }

typedef void BoolCallback(bool isFront);

class AnimationCard extends StatelessWidget {
  AnimationCard({
    this.child,
    this.animation,
    this.direction,
  });

  final Widget? child;
  final Animation<double>? animation;
  final FlipDirection? direction;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation!,
      builder: (BuildContext context, Widget? child) {
        var transform = Matrix4.identity();
        transform.setEntry(3, 2, 0.001);
        if (direction == FlipDirection.VERTICAL) {
          transform.rotateX(animation!.value);
        } else {
          transform.rotateY(animation!.value);
        }
        return Transform(
          transform: transform,
          alignment: Alignment.center,
          child: child,
        );
      },
      child: child,
    );
  }
}

class AdvanceDrawer extends StatefulWidget {
  AdvanceDrawer({
    Key? key,
    required this.child,
    required this.drawer,
    required this.back,
    this.controller,
    this.backdropColor,
    this.openRatio = 0.75,
    this.openScale = 0.85,
    this.animationDuration = const Duration(milliseconds: 250),
    this.animationCurve,
    this.childDecoration,
    this.animateChildDecoration = true,
    this.rtlOpening = false,
    this.disabledGestures = false,
    this.animationController,
    this.flipping = true,
    this.fill = Fill.none,
    this.alignment = Alignment.center,
    this.direction = FlipDirection.HORIZONTAL,
    this.speed = 500,
    this.onFlip,
    this.onFlipDone,
    this.flipCardController,
    this.flipOnTouch = false,
  }) : super(key: key);

  /// Child widget. (Usually widget that represent a screen)
  final Widget child;

  /// Drawer widget. (Widget behind the [child]).
  final Widget drawer;

  /// Controller that controls widget state.
  final AdvanceDrawerController? controller;

  /// Backdrop color.
  final Color? backdropColor;

  /// Opening ratio.
  final double openRatio;

  /// Opening ratio.
  final double openScale;

  /// Animation duration.
  final Duration animationDuration;

  /// Animation curve.
  final Curve? animationCurve;

  /// Child container decoration in open widget state.
  final BoxDecoration? childDecoration;

  /// Indicates that [childDecoration] might be animated or not.
  /// NOTICE: It may cause animation jerks.
  final bool animateChildDecoration;

  /// Opening from Right-to-left.
  final bool rtlOpening;

  /// Disable gestures.
  final bool disabledGestures;

  /// Controller that controls widget animation.
  final AnimationController? animationController;

  //FlipCard
  final Widget back;
  //Disable flipcard
  final bool flipping;

  //flip side
  final Fill fill;

  final Alignment alignment;

  final FlipDirection direction;

  final int speed;

  final VoidCallback? onFlip;

  final BoolCallback? onFlipDone;

  final AnimationController? flipCardController;

  final bool flipOnTouch;

  @override
  State<AdvanceDrawer> createState() => _AdvanceDrawerState();
}

class _AdvanceDrawerState extends State<AdvanceDrawer>
    with TickerProviderStateMixin {
  late final AdvanceDrawerController _controller;
  late final AnimationController _animationController;
  late final Animation<double> _drawerScaleAnimation;
  late final Animation<Offset> _childSlideAnimation;
  late final Animation<double> _childScaleAnimation;
  late final Animation<Decoration> _childDecorationAnimation;

  bool _captured = false;
  late double _offsetValue;
  Offset? _startPosition;
  late Offset _freshPosition;

  //FlipCard
  late final AnimationController flipController;
  Animation<double>? _frontRotation;
  Animation<double>? _backRotation;

  bool isFront = true;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? AdvanceDrawerController();
    _controller.addListener(_handleControllerChanged);

    _animationController = widget.animationController ??
        AnimationController(
          vsync: this,
          value: _controller.value.visible ? 1 : 0,
        );

    _animationController.duration = widget.animationDuration;

    final parentAnimation = widget.animationCurve == null
        ? _animationController
        : CurvedAnimation(
            parent: _animationController,
            curve: widget.animationCurve!,
          );

    _drawerScaleAnimation = Tween<double>(
      begin: 0.75,
      end: 1.0,
    ).animate(parentAnimation);

    _childSlideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(widget.openRatio, 0),
    ).animate(parentAnimation);

    _childScaleAnimation = Tween<double>(
      begin: 1.0,
      end: widget.openScale, // add Const On top
    ).animate(parentAnimation);

    _childDecorationAnimation = DecorationTween(
      begin: const BoxDecoration(),
      end: widget.childDecoration,
    ).animate(parentAnimation);

    //flip the child
    flipController = widget.flipCardController ??
        AnimationController(
          vsync: this,
        );

    flipController.duration = Duration(milliseconds: widget.speed);

    _frontRotation = TweenSequence([
      TweenSequenceItem<double>(
        tween: Tween(begin: 0.0, end: pi / 2)
            .chain(CurveTween(curve: Curves.easeIn)),
        weight: 50.0,
      ),
      TweenSequenceItem<double>(
        tween: ConstantTween<double>(pi / 2),
        weight: 50.0,
      ),
    ]).animate(flipController);

    _backRotation = TweenSequence([
      TweenSequenceItem<double>(
        tween: ConstantTween<double>(pi / 2),
        weight: 50.0,
      ),
      TweenSequenceItem<double>(
        tween: Tween(begin: -pi / 2, end: 0.0)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 50.0,
      ),
    ]).animate(flipController);

    flipController.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        if (widget.onFlipDone != null) widget.onFlipDone!(isFront);
        setState(() {
          isFront = !isFront;
        });
      }
    });
  }

  void toggleCard() {
    if (widget.onFlip != null) {
      widget.onFlip!();
    }

    flipController.duration = Duration(milliseconds: widget.speed);
    if (isFront) {
      flipController.forward();
    } else {
      flipController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.backdropColor,
      child: GestureDetector(
        onHorizontalDragStart:
            widget.disabledGestures ? null : _handleDragStart,
        onHorizontalDragUpdate:
            widget.disabledGestures ? null : _handleDragUpdate,
        onHorizontalDragEnd: widget.disabledGestures ? null : _handleDragEnd,
        onHorizontalDragCancel:
            widget.disabledGestures ? null : _handleDragCancel,
        child: Container(
          color: Colors.transparent,
          child: Stack(
            children: [
              Align(
                alignment: widget.rtlOpening
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: FractionallySizedBox(
                  widthFactor: widget.openRatio,
                  child: ScaleTransition(
                      scale: _drawerScaleAnimation,
                      alignment: widget.rtlOpening
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: widget.drawer),
                ),
              ),
              SlideTransition(
                position: _childSlideAnimation,
                textDirection: TextDirection.ltr,
                child: ScaleTransition(
                  scale: _childScaleAnimation,
                  child: Builder(
                    builder: (_) {
                      final frontPositioning =
                          widget.fill == Fill.fillFront ? _fill : _noop;
                      final backPositioning =
                          widget.fill == Fill.fillBack ? _fill : _noop;
                      final childFlip = (widget.flipping)
                          ? Stack(
                              alignment: widget.alignment,
                              fit: StackFit.passthrough,
                              children: [
                                frontPositioning(_buildContent(front: true)),
                                backPositioning(_buildContent(front: false)),
                              ],
                            )
                          : widget.child;

                      if (widget.flipping && widget.flipOnTouch) {
                        return GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: toggleCard,
                          child: childFlip,
                        );
                      }

                      final childStack = Stack(
                        children: [
                          childFlip,
                          ValueListenableBuilder<AdvancedDrawerValue>(
                            valueListenable: _controller,
                            builder: (_, value, __) {
                              if (!value.visible) {
                                return const SizedBox();
                              }

                              return Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: _controller.hideDrawer,
                                  highlightColor: Colors.transparent,
                                  child: Container(),
                                ),
                              );
                            },
                          ),
                        ],
                      );

                      if (widget.animateChildDecoration &&
                          widget.childDecoration != null) {
                        return AnimatedBuilder(
                          animation: _childDecorationAnimation,
                          builder: (_, child) {
                            return Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: _childDecorationAnimation.value,
                              child: child,
                            );
                          },
                          child: childStack,
                        );
                      }

                      return Container(
                        clipBehavior: widget.childDecoration != null
                            ? Clip.antiAlias
                            : Clip.none,
                        decoration: widget.childDecoration,
                        child: childStack,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent({required bool front}) {
    return IgnorePointer(
      ignoring: front ? !isFront : isFront,
      child: AnimationCard(
        animation: front ? _frontRotation : _backRotation,
        child: front ? widget.child : widget.back,
        direction: widget.direction,
      ),
    );
  }

  void _handleControllerChanged() {
    _controller.value.visible
        ? _animationController.forward()
        : _animationController.reverse();
    toggleCard();
  }

  void _handleDragStart(DragStartDetails details) {
    _captured = true;
    _startPosition = details.globalPosition;
    _offsetValue = _animationController.value;
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (!_captured) return;
    final screenSize = MediaQuery.of(context).size;

    _freshPosition = details.globalPosition;

    final diff = (_freshPosition - _startPosition!).dx;

    _animationController.value = _offsetValue +
        (diff / (screenSize.width * 0.75)) * (1 /* Add Condition */);
  }

  void _handleDragEnd(DragEndDetails details) {
    if (!_captured) return;

    _captured = true;

    if (_animationController.value >= 0.5) {
      if (_controller.value.visible) {
        _animationController.forward();
      } else {
        _controller.showDrawer();
      }
    } else {
      if (!_controller.value.visible) {
        _animationController.reverse();
      } else {
        _controller.hideDrawer();
      }
    }
  }

  void _handleDragCancel() {
    _captured = false;
  }

  @override
  void dispose() {
    _controller.removeListener(_handleControllerChanged);

/* Add Condition */
    _controller.dispose();

/* Add Condition */
    _animationController.dispose();

    flipController.dispose();

    super.dispose();
  }
}

Widget _fill(Widget child) => Positioned.fill(child: child);
Widget _noop(Widget child) => child;
