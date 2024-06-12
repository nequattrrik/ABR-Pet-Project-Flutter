import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum GtGestureState {
  idle,
  hover,
  disabled,
}

class SizeTapAnimation extends StatefulWidget {
  const SizeTapAnimation({
    this.onTap,
    this.onLongPress,
    this.onDoubleTap,
    this.behavior = HitTestBehavior.opaque,
    this.child,
    super.key,
    this.padding,
  });
  final EdgeInsetsGeometry? padding;

  final Widget? child;

  final VoidCallback? onTap;

  final VoidCallback? onLongPress;

  final VoidCallback? onDoubleTap;

  final HitTestBehavior behavior;

  @override
  State<SizeTapAnimation> createState() => _SizeTapAnimState();
}

class _SizeTapAnimState extends State<SizeTapAnimation> {
  final _stopwatch = Stopwatch();
  late GtGestureState _gestureState;

  bool get _hasTapCallbacks =>
      widget.onTap != null || widget.onDoubleTap != null;

  @override
  void initState() {
    super.initState();

    _gestureState =
        _hasTapCallbacks ? GtGestureState.idle : GtGestureState.disabled;
  }

  @override
  void dispose() {
    _stopwatch.stop();
    _stopwatch.reset();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant SizeTapAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.onTap != widget.onTap) {
      _onOnTapChanged();
    }
  }

  void _onOnTapChanged() {
    if (!_hasTapCallbacks) {
      _gestureState = GtGestureState.disabled;
    } else if (_gestureState == GtGestureState.disabled) {
      _gestureState = GtGestureState.idle;
    }
  }

  // void _onChildHoverEnter() {
  //   if (_gestureState == GtGestureState.disabled) return;

  //   setState(() {});
  // }

  // void _onChildHoverExit() {
  //   if (_gestureState == GtGestureState.disabled) return;

  //   setState(() {});
  // }

  void _onTapStart(BuildContext context) {
    HapticFeedback.lightImpact();
    setState(() => _gestureState = GtGestureState.hover);
    _stopwatch.start();
  }

  Future<void> _onTapEnd(BuildContext context) async {
    if (!mounted) return;

    const smallAnimationDuration = Duration(milliseconds: 160);
    _stopwatch.stop();

    final duration = _stopwatch.elapsed;
    final durationToWaitFor = smallAnimationDuration - duration;

    _stopwatch.reset();

    if (!durationToWaitFor.isNegative) {
      await Future.delayed(durationToWaitFor);
    }

    if (!mounted) return;
    setState(
      () => _gestureState =
          _hasTapCallbacks ? GtGestureState.idle : GtGestureState.disabled,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isInteractable = _hasTapCallbacks;
    Widget child = GestureDetector(
      onTap: widget.onTap,
      onTapDown: isInteractable ? (_) => _onTapStart(context) : null,
      onTapUp: isInteractable ? (_) => _onTapEnd(context) : null,
      onTapCancel: isInteractable ? () => _onTapEnd(context) : null,
      onDoubleTap: isInteractable ? widget.onDoubleTap : null,
      onLongPress: isInteractable ? widget.onLongPress : null,
      behavior: widget.behavior,
      child: _SizeTapSizeAnim(
        gestureState: _gestureState,
        child: widget.child,
      ),
    );
    if (widget.padding == null) {
      return child;
    }
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: widget.onTap,
        onTapDown: isInteractable ? (_) => _onTapStart(context) : null,
        onTapUp: isInteractable ? (_) => _onTapEnd(context) : null,
        onTapCancel: isInteractable ? () => _onTapEnd(context) : null,
        onDoubleTap: isInteractable ? widget.onDoubleTap : null,
        onLongPress: isInteractable ? widget.onLongPress : null,
        behavior: widget.behavior,
        child: child,
      ),
    );
  }
}

class _SizeTapSizeAnim extends StatefulWidget {
  final Widget? child;
  final GtGestureState gestureState;

  const _SizeTapSizeAnim({
    this.child,
    required this.gestureState,
  });

  @override
  State<_SizeTapSizeAnim> createState() => __SizeTapSizeAnimState();
}

class __SizeTapSizeAnimState extends State<_SizeTapSizeAnim>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 120,
      ),
      lowerBound: 0.97,
      upperBound: 1,
      value: 1,
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _animationController = null;
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant _SizeTapSizeAnim oldWidget) {
    if (oldWidget.gestureState != widget.gestureState) {
      switch (widget.gestureState) {
        case GtGestureState.idle:
          _animationController?.forward();
        // return 1.0;
        case GtGestureState.hover:
          _animationController?.reverse();
        // return 0.7;
        case GtGestureState.disabled:
          _animationController?.forward();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (_animationController == null) return const SizedBox();
    return ScaleTransition(
      scale: _animationController!,
      child: RepaintBoundary(child: widget.child),
    );
  }
}

