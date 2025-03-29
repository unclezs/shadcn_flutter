import 'dart:async';
import 'dart:math';

import 'package:shadcn_flutter/shadcn_flutter.dart';

typedef DrawerBuilder = Widget Function(BuildContext context, Size extraSize,
    Size size, EdgeInsets padding, int stackIndex);

DrawerOverlayCompleter<T?> openDrawerOverlay<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  required OverlayPosition position,
  bool expands = false,
  bool draggable = true,
  bool barrierDismissible = true,
  WidgetBuilder? backdropBuilder,
  bool useSafeArea = true,
  bool showDragHandle = true,
  BorderRadiusGeometry? borderRadius,
  Size? dragHandleSize,
  bool transformBackdrop = true,
  double? surfaceOpacity,
  double? surfaceBlur,
  Color? barrierColor,
  AnimationController? animationController,
  bool autoOpen = true,
  BoxConstraints? constraints,
  AlignmentGeometry? alignment,
}) {
  return openRawDrawer<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    backdropBuilder: backdropBuilder,
    useSafeArea: useSafeArea,
    transformBackdrop: transformBackdrop,
    animationController: animationController,
    autoOpen: autoOpen,
    constraints: constraints,
    alignment: alignment,
    builder: (context, extraSize, size, padding, stackIndex) {
      return DrawerWrapper(
        position: position,
        expands: expands,
        draggable: draggable,
        extraSize: extraSize,
        size: size,
        showDragHandle: showDragHandle,
        dragHandleSize: dragHandleSize,
        padding: padding,
        borderRadius: borderRadius,
        surfaceOpacity: surfaceOpacity,
        surfaceBlur: surfaceBlur,
        barrierColor: barrierColor,
        stackIndex: stackIndex,
        child: Builder(builder: (context) {
          return builder(context);
        }),
      );
    },
    position: position,
  );
}

DrawerOverlayCompleter<T?> openSheetOverlay<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  required OverlayPosition position,
  bool barrierDismissible = true,
  bool transformBackdrop = false,
  WidgetBuilder? backdropBuilder,
  Color? barrierColor,
  bool draggable = false,
  AnimationController? animationController,
  bool autoOpen = true,
  BoxConstraints? constraints,
  AlignmentGeometry? alignment,
}) {
  return openRawDrawer<T>(
    context: context,
    transformBackdrop: transformBackdrop,
    barrierDismissible: barrierDismissible,
    useSafeArea: false, // handled by the sheet itself
    animationController: animationController,
    backdropBuilder: backdropBuilder,
    autoOpen: autoOpen,
    constraints: constraints,
    alignment: alignment,
    builder: (context, extraSize, size, padding, stackIndex) {
      return SheetWrapper(
        position: position,
        expands: true,
        draggable: draggable,
        extraSize: extraSize,
        size: size,
        padding: padding,
        barrierColor: barrierColor,
        stackIndex: stackIndex,
        child: Builder(builder: (context) {
          return builder(context);
        }),
      );
    },
    position: position,
  );
}

Future<T?> openDrawer<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  required OverlayPosition position,
  bool expands = false,
  bool draggable = true,
  bool barrierDismissible = true,
  WidgetBuilder? backdropBuilder,
  bool useSafeArea = true,
  bool showDragHandle = true,
  BorderRadiusGeometry? borderRadius,
  Size? dragHandleSize,
  bool transformBackdrop = false,
  double? surfaceOpacity,
  double? surfaceBlur,
  Color? barrierColor,
  AnimationController? animationController,
  BoxConstraints? constraints,
  AlignmentGeometry? alignment,
}) {
  return openDrawerOverlay<T>(
    context: context,
    builder: builder,
    position: position,
    expands: expands,
    draggable: draggable,
    barrierDismissible: barrierDismissible,
    backdropBuilder: backdropBuilder,
    useSafeArea: useSafeArea,
    showDragHandle: showDragHandle,
    borderRadius: borderRadius,
    dragHandleSize: dragHandleSize,
    transformBackdrop: transformBackdrop,
    surfaceOpacity: surfaceOpacity,
    surfaceBlur: surfaceBlur,
    barrierColor: barrierColor,
    animationController: animationController,
    constraints: constraints,
    alignment: alignment,
  ).future;
}

Future<T?> openSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  required OverlayPosition position,
  bool barrierDismissible = true,
  bool transformBackdrop = false,
  Color? barrierColor,
  bool draggable = false,
  AnimationController? animationController,
  WidgetBuilder? backdropBuilder,
  BoxConstraints? constraints,
  AlignmentGeometry? alignment,
}) {
  return openSheetOverlay<T>(
    context: context,
    builder: builder,
    position: position,
    barrierDismissible: barrierDismissible,
    transformBackdrop: transformBackdrop,
    barrierColor: barrierColor,
    draggable: draggable,
    animationController: animationController,
    backdropBuilder: backdropBuilder,
    constraints: constraints,
    alignment: alignment,
  ).future;
}

class DrawerWrapper extends StatefulWidget {
  final OverlayPosition position;
  final Widget child;
  final bool expands;
  final bool draggable;
  final Size extraSize;
  final Size size;
  final bool showDragHandle;
  final BorderRadiusGeometry? borderRadius;
  final Size? dragHandleSize;
  final EdgeInsets padding;
  final double? surfaceOpacity;
  final double? surfaceBlur;
  final Color? barrierColor;
  final int stackIndex;
  final double? gapBeforeDragger;
  final double? gapAfterDragger;
  final AnimationController? animationController;
  final BoxConstraints? constraints;
  final AlignmentGeometry? alignment;

  const DrawerWrapper({
    super.key,
    required this.position,
    required this.child,
    this.expands = false,
    this.draggable = true,
    this.extraSize = Size.zero,
    required this.size,
    this.showDragHandle = true,
    this.borderRadius,
    this.dragHandleSize,
    this.padding = EdgeInsets.zero,
    this.surfaceOpacity,
    this.surfaceBlur,
    this.barrierColor,
    this.gapBeforeDragger,
    this.gapAfterDragger,
    required this.stackIndex,
    this.animationController,
    this.constraints,
    this.alignment,
  });

  @override
  State<DrawerWrapper> createState() => _DrawerWrapperState();
}

class _DrawerWrapperState extends State<DrawerWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late ControlledAnimation _extraOffset;

  OverlayPosition get resolvedPosition {
    if (widget.position == OverlayPosition.start) {
      return Directionality.of(context) == TextDirection.ltr
          ? OverlayPosition.left
          : OverlayPosition.right;
    }
    if (widget.position == OverlayPosition.end) {
      return Directionality.of(context) == TextDirection.ltr
          ? OverlayPosition.right
          : OverlayPosition.left;
    }
    return widget.position;
  }

  @override
  void initState() {
    super.initState();
    _controller = widget.animationController ??
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 350),
        );
    _extraOffset = ControlledAnimation(_controller);
  }

  double? get expandingHeight {
    switch (resolvedPosition) {
      case OverlayPosition.left:
      case OverlayPosition.right:
        return double.infinity;
      default:
        return null;
    }
  }

  double? get expandingWidth {
    switch (resolvedPosition) {
      case OverlayPosition.top:
      case OverlayPosition.bottom:
        return double.infinity;
      default:
        return null;
    }
  }

  Widget buildDraggableBar(ThemeData theme) {
    switch (resolvedPosition) {
      case OverlayPosition.left:
      case OverlayPosition.right:
        return Container(
          width: widget.dragHandleSize?.width ?? 6 * theme.scaling,
          height: widget.dragHandleSize?.height ?? 100 * theme.scaling,
          decoration: BoxDecoration(
            color: theme.colorScheme.muted,
            borderRadius: theme.borderRadiusXxl,
          ),
        );
      case OverlayPosition.top:
      case OverlayPosition.bottom:
        return Container(
          width: widget.dragHandleSize?.width ?? 100 * theme.scaling,
          height: widget.dragHandleSize?.height ?? 6 * theme.scaling,
          decoration: BoxDecoration(
            color: theme.colorScheme.muted,
            borderRadius: theme.borderRadiusXxl,
          ),
        );
      default:
        throw UnimplementedError('Unknown position');
    }
  }

  Size getSize(BuildContext context) {
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    return renderBox?.hasSize ?? false
        ? renderBox?.size ?? widget.size
        : widget.size;
  }

  Widget buildDraggable(BuildContext context, ControlledAnimation? controlled,
      Widget child, ThemeData theme) {
    switch (resolvedPosition) {
      case OverlayPosition.left:
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onHorizontalDragUpdate: (details) {
            if (controlled == null) {
              return;
            }
            final size = getSize(context);
            final increment = details.primaryDelta! / size.width;
            double newValue = controlled.value + increment;
            if (newValue < 0) {
              newValue = 0;
            }
            if (newValue > 1) {
              _extraOffset.value +=
                  details.primaryDelta! / max(_extraOffset.value, 1);
              newValue = 1;
            }
            controlled.value = newValue;
          },
          onHorizontalDragEnd: (details) {
            if (controlled == null) {
              return;
            }
            _extraOffset.forward(0, Curves.easeOut);
            if (controlled.value + _extraOffset.value < 0.5) {
              controlled.forward(0, Curves.easeOut).then((value) {
                closeDrawer(context);
              });
            } else {
              controlled.forward(1, Curves.easeOut);
            }
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedBuilder(
                  animation: _extraOffset,
                  builder: (context, child) {
                    return Gap(
                        widget.extraSize.width + _extraOffset.value.max(0));
                  }),
              Flexible(
                child: AnimatedBuilder(
                  builder: (context, child) {
                    return Transform.scale(
                        scaleX:
                            1 + _extraOffset.value / getSize(context).width / 4,
                        alignment: AlignmentDirectional.centerEnd,
                        child: child);
                  },
                  animation: _extraOffset,
                  child: child,
                ),
              ),
              if (widget.showDragHandle) ...[
                Gap(widget.gapAfterDragger ?? 16 * theme.scaling),
                buildDraggableBar(theme),
                Gap(widget.gapBeforeDragger ?? 12 * theme.scaling),
              ],
            ],
          ),
        );
      case OverlayPosition.right:
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onHorizontalDragUpdate: (details) {
            if (controlled == null) {
              return;
            }
            final size = getSize(context);
            final increment = details.primaryDelta! / size.width;
            double newValue = controlled.value - increment;
            if (newValue < 0) {
              newValue = 0;
            }
            if (newValue > 1) {
              _extraOffset.value +=
                  -details.primaryDelta! / max(_extraOffset.value, 1);
              newValue = 1;
            }
            controlled.value = newValue;
          },
          onHorizontalDragEnd: (details) {
            if (controlled == null) {
              return;
            }
            _extraOffset.forward(0, Curves.easeOut);
            if (controlled.value + _extraOffset.value < 0.5) {
              controlled.forward(0, Curves.easeOut).then((value) {
                closeDrawer(context);
              });
            } else {
              controlled.forward(1, Curves.easeOut);
            }
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.showDragHandle) ...[
                Gap(widget.gapBeforeDragger ?? 12 * theme.scaling),
                buildDraggableBar(theme),
                Gap(widget.gapAfterDragger ?? 16 * theme.scaling),
              ],
              Flexible(
                child: AnimatedBuilder(
                  builder: (context, child) {
                    return Transform.scale(
                        scaleX:
                            1 + _extraOffset.value / getSize(context).width / 4,
                        alignment: AlignmentDirectional.centerStart,
                        child: child);
                  },
                  animation: _extraOffset,
                  child: child,
                ),
              ),
              AnimatedBuilder(
                  animation: _extraOffset,
                  builder: (context, child) {
                    return Gap(
                        widget.extraSize.width + _extraOffset.value.max(0));
                  }),
            ],
          ),
        );
      case OverlayPosition.top:
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onVerticalDragUpdate: (details) {
            if (controlled == null) {
              return;
            }
            final size = getSize(context);
            final increment = details.primaryDelta! / size.height;
            double newValue = controlled.value + increment;
            if (newValue < 0) {
              newValue = 0;
            }
            if (newValue > 1) {
              _extraOffset.value +=
                  details.primaryDelta! / max(_extraOffset.value, 1);
              newValue = 1;
            }
            controlled.value = newValue;
          },
          onVerticalDragEnd: (details) {
            if (controlled == null) {
              return;
            }
            _extraOffset.forward(0, Curves.easeOut);
            if (controlled.value + _extraOffset.value < 0.5) {
              controlled.forward(0, Curves.easeOut).then((value) {
                closeDrawer(context);
              });
            } else {
              controlled.forward(1, Curves.easeOut);
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedBuilder(
                  animation: _extraOffset,
                  builder: (context, child) {
                    return Gap(
                        widget.extraSize.height + _extraOffset.value.max(0));
                  }),
              Flexible(
                child: AnimatedBuilder(
                  builder: (context, child) {
                    return Transform.scale(
                        scaleY: 1 +
                            _extraOffset.value / getSize(context).height / 4,
                        alignment: Alignment.bottomCenter,
                        child: child);
                  },
                  animation: _extraOffset,
                  child: child,
                ),
              ),
              if (widget.showDragHandle) ...[
                Gap(widget.gapAfterDragger ?? 16 * theme.scaling),
                buildDraggableBar(theme),
                Gap(widget.gapBeforeDragger ?? 12 * theme.scaling),
              ],
            ],
          ),
        );
      case OverlayPosition.bottom:
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onVerticalDragUpdate: (details) {
            if (controlled == null) {
              return;
            }
            final size = getSize(context);
            final increment = details.primaryDelta! / size.height;
            double newValue = controlled.value - increment;
            if (newValue < 0) {
              newValue = 0;
            }
            if (newValue > 1) {
              _extraOffset.value +=
                  -details.primaryDelta! / max(_extraOffset.value, 1);
              newValue = 1;
            }
            controlled.value = newValue;
          },
          onVerticalDragEnd: (details) {
            if (controlled == null) {
              return;
            }
            _extraOffset.forward(0, Curves.easeOut);
            if (controlled.value + _extraOffset.value < 0.5) {
              controlled.forward(0, Curves.easeOut).then((value) {
                closeDrawer(context);
              });
            } else {
              controlled.forward(1, Curves.easeOut);
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.showDragHandle) ...[
                Gap(widget.gapBeforeDragger ?? 12 * theme.scaling),
                buildDraggableBar(theme),
                Gap(widget.gapAfterDragger ?? 0),
              ],
              Flexible(
                child: AnimatedBuilder(
                  builder: (context, child) {
                    return Transform.scale(
                        scaleY: 1 +
                            _extraOffset.value / getSize(context).height / 4,
                        alignment: Alignment.topCenter,
                        child: child);
                  },
                  animation: _extraOffset,
                  child: child,
                ),
              ),
              AnimatedBuilder(
                  animation: _extraOffset,
                  builder: (context, child) {
                    return Gap(
                        widget.extraSize.height + _extraOffset.value.max(0));
                  }),
            ],
          ),
        );
      default:
        throw UnimplementedError('Unknown position');
    }
  }

  @override
  void didUpdateWidget(covariant DrawerWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animationController != oldWidget.animationController) {
      if (oldWidget.animationController == null) {
        _controller.dispose();
      }
      _controller = widget.animationController ??
          AnimationController(
            vsync: this,
            duration: const Duration(milliseconds: 350),
          );
    }
  }

  @override
  void dispose() {
    if (widget.animationController == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  Border getBorder(ThemeData theme) {
    switch (resolvedPosition) {
      case OverlayPosition.left:
        // top, right, bottom
        return Border(
          right: BorderSide(color: theme.colorScheme.border),
          top: BorderSide(color: theme.colorScheme.border),
          bottom: BorderSide(color: theme.colorScheme.border),
        );
      case OverlayPosition.right:
        // top, left, bottom
        return Border(
          left: BorderSide(color: theme.colorScheme.border),
          top: BorderSide(color: theme.colorScheme.border),
          bottom: BorderSide(color: theme.colorScheme.border),
        );
      case OverlayPosition.top:
        // left, right, bottom
        return Border(
          left: BorderSide(color: theme.colorScheme.border),
          right: BorderSide(color: theme.colorScheme.border),
          bottom: BorderSide(color: theme.colorScheme.border),
        );
      case OverlayPosition.bottom:
        // left, right, top
        return Border(
          left: BorderSide(color: theme.colorScheme.border),
          right: BorderSide(color: theme.colorScheme.border),
          top: BorderSide(color: theme.colorScheme.border),
        );
      default:
        throw UnimplementedError('Unknown position');
    }
  }

  BorderRadiusGeometry getBorderRadius(double radius) {
    switch (resolvedPosition) {
      case OverlayPosition.left:
        return BorderRadius.only(
          topRight: Radius.circular(radius),
          bottomRight: Radius.circular(radius),
        );
      case OverlayPosition.right:
        return BorderRadius.only(
          topLeft: Radius.circular(radius),
          bottomLeft: Radius.circular(radius),
        );
      case OverlayPosition.top:
        return BorderRadius.only(
          bottomLeft: Radius.circular(radius),
          bottomRight: Radius.circular(radius),
        );
      case OverlayPosition.bottom:
        return BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: Radius.circular(radius),
        );
      default:
        throw UnimplementedError('Unknown position');
    }
  }

  BoxDecoration getDecoration(ThemeData theme) {
    var border = getBorder(theme);
    // according to the design, the border radius is 10
    // seems to be a fixed value
    var borderRadius = widget.borderRadius ?? getBorderRadius(theme.radiusXxl);
    var backgroundColor = theme.colorScheme.background;
    var surfaceOpacity = widget.surfaceOpacity ?? theme.surfaceOpacity;
    if (surfaceOpacity != null && surfaceOpacity < 1) {
      if (widget.stackIndex == 0) {
        // the top sheet should have a higher opacity to prevent
        // visual bleeding from the main content
        surfaceOpacity = surfaceOpacity * 1.25;
      }
      backgroundColor = backgroundColor.scaleAlpha(surfaceOpacity);
    }
    return BoxDecoration(
      borderRadius: borderRadius,
      color: backgroundColor,
      border: border,
    );
  }

  Widget buildChild(BuildContext context) {
    return widget.child;
  }

  EdgeInsets buildPadding(BuildContext context) {
    return widget.padding;
  }

  EdgeInsets buildMargin(BuildContext context) {
    return EdgeInsets.zero;
  }

  @override
  Widget build(BuildContext context) {
    final data = Data.maybeOf<_MountedOverlayEntryData>(context);
    final animation = data?.state._controlledAnimation;
    final theme = Theme.of(context);
    var surfaceBlur = widget.surfaceBlur ?? theme.surfaceBlur;
    var surfaceOpacity = widget.surfaceOpacity ?? theme.surfaceOpacity;
    var borderRadius = widget.borderRadius ?? getBorderRadius(theme.radiusXxl);
    Widget container = Container(
      width: widget.expands ? expandingWidth : null,
      height: widget.expands ? expandingHeight : null,
      decoration: getDecoration(theme),
      padding: buildPadding(context),
      margin: buildMargin(context),
      child: widget.draggable
          ? buildDraggable(context, animation, buildChild(context), theme)
          : buildChild(context),
    );

    if (widget.constraints != null) {
      container = ConstrainedBox(
        constraints: widget.constraints!,
        child: container,
      );
    }

    if (widget.alignment != null) {
      container = Align(
        alignment: widget.alignment!,
        child: container,
      );
    }

    if (surfaceBlur != null && surfaceBlur > 0) {
      container = SurfaceBlur(
        surfaceBlur: surfaceBlur,
        borderRadius: getBorderRadius(theme.radiusXxl),
        child: container,
      );
    }
    var barrierColor = widget.barrierColor ?? Colors.black.scaleAlpha(0.8);
    if (animation != null) {
      if (widget.stackIndex != 0) {
        // weaken the barrier color for the upper sheets
        barrierColor = barrierColor.scaleAlpha(0.75);
      }
      container = ModalBackdrop(
        surfaceClip: ModalBackdrop.shouldClipSurface(surfaceOpacity),
        borderRadius: borderRadius,
        barrierColor: barrierColor,
        fadeAnimation: animation,
        padding: buildMargin(context),
        child: container,
      );
    }
    return container;
  }
}

Future<void> closeSheet(BuildContext context) {
  // sheet is just a drawer with no backdrop transformation
  return closeDrawer(context);
}

class SheetWrapper extends DrawerWrapper {
  const SheetWrapper({
    super.key,
    required super.position,
    required super.child,
    required super.size,
    required super.stackIndex,
    super.draggable = false,
    super.expands = false,
    super.extraSize = Size.zero,
    super.padding,
    super.surfaceBlur,
    super.surfaceOpacity,
    super.barrierColor,
    super.gapBeforeDragger,
    super.gapAfterDragger,
    super.constraints,
    super.alignment,
  });

  @override
  State<DrawerWrapper> createState() => _SheetWrapperState();
}

class _SheetWrapperState extends _DrawerWrapperState {
  @override
  Border getBorder(ThemeData theme) {
    switch (resolvedPosition) {
      case OverlayPosition.left:
        return Border(right: BorderSide(color: theme.colorScheme.border));
      case OverlayPosition.right:
        return Border(left: BorderSide(color: theme.colorScheme.border));
      case OverlayPosition.top:
        return Border(bottom: BorderSide(color: theme.colorScheme.border));
      case OverlayPosition.bottom:
        return Border(top: BorderSide(color: theme.colorScheme.border));
      default:
        throw UnimplementedError('Unknown position');
    }
  }

  @override
  EdgeInsets buildMargin(BuildContext context) {
    var mediaPadding = MediaQuery.paddingOf(context);
    double marginTop = 0;
    double marginBottom = 0;
    double marginLeft = 0;
    double marginRight = 0;
    switch (resolvedPosition) {
      case OverlayPosition.left:
        marginRight = mediaPadding.right;
        break;
      case OverlayPosition.right:
        marginLeft = mediaPadding.left;
        break;
      case OverlayPosition.top:
        marginBottom = mediaPadding.bottom;
        break;
      case OverlayPosition.bottom:
        marginTop = mediaPadding.top;
        break;
      default:
        throw UnimplementedError('Unknown position');
    }
    return super.buildMargin(context) +
        EdgeInsets.only(
          top: marginTop,
          bottom: marginBottom,
          left: marginLeft,
          right: marginRight,
        );
  }

  @override
  Widget buildChild(BuildContext context) {
    var mediaPadding = MediaQuery.paddingOf(context);
    double paddingTop = 0;
    double paddingBottom = 0;
    double paddingLeft = 0;
    double paddingRight = 0;
    switch (resolvedPosition) {
      case OverlayPosition.left:
        paddingTop = mediaPadding.top;
        paddingBottom = mediaPadding.bottom;
        paddingLeft = mediaPadding.left;
        break;
      case OverlayPosition.right:
        paddingTop = mediaPadding.top;
        paddingBottom = mediaPadding.bottom;
        paddingRight = mediaPadding.right;
        break;
      case OverlayPosition.top:
        paddingLeft = mediaPadding.left;
        paddingRight = mediaPadding.right;
        paddingTop = mediaPadding.top;
        break;
      case OverlayPosition.bottom:
        paddingLeft = mediaPadding.left;
        paddingRight = mediaPadding.right;
        paddingBottom = mediaPadding.bottom;
        break;
      default:
        throw UnimplementedError('Unknown position');
    }
    return Padding(
      padding: EdgeInsets.only(
        top: paddingTop,
        bottom: paddingBottom,
        left: paddingLeft,
        right: paddingRight,
      ),
      child: super.buildChild(context),
    );
  }

  @override
  BorderRadiusGeometry getBorderRadius(double radius) {
    return BorderRadius.zero;
  }

  @override
  BoxDecoration getDecoration(ThemeData theme) {
    var backgroundColor = theme.colorScheme.background;
    var surfaceOpacity = widget.surfaceOpacity ?? theme.surfaceOpacity;
    if (surfaceOpacity != null && surfaceOpacity < 1) {
      if (widget.stackIndex == 0) {
        // the top sheet should have a higher opacity to prevent
        // visual bleeding from the main content
        surfaceOpacity = surfaceOpacity * 1.25;
      }
      backgroundColor = backgroundColor.scaleAlpha(surfaceOpacity);
    }
    return BoxDecoration(
      color: backgroundColor,
      border: getBorder(theme),
    );
  }
}

enum OverlayPosition {
  left,
  right,
  top,
  bottom,
  start,
  end,
}

const kBackdropScaleDown = 0.95;

class BackdropTransformData {
  final Size sizeDifference;

  BackdropTransformData(this.sizeDifference);
}

class _DrawerOverlayWrapper extends StatefulWidget {
  final Widget child;
  final Completer completer;
  const _DrawerOverlayWrapper({
    required this.child,
    required this.completer,
  });

  @override
  State<_DrawerOverlayWrapper> createState() => _DrawerOverlayWrapperState();
}

class _DrawerOverlayWrapperState extends State<_DrawerOverlayWrapper>
    with OverlayHandlerStateMixin {
  @override
  Widget build(BuildContext context) {
    return Data<OverlayHandlerStateMixin>.inherit(
      data: this,
      child: widget.child,
    );
  }

  @override
  Future<void> close([bool immediate = false]) {
    if (immediate) {
      widget.completer.complete();
      return widget.completer.future;
    }
    return closeDrawer(context);
  }

  @override
  void closeLater() {
    if (mounted) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (mounted) {
          closeDrawer(context);
        } else {
          widget.completer.complete();
        }
      });
    }
  }

  @override
  Future<void> closeWithResult<X>([X? value]) {
    return closeDrawer(context, value);
  }
}

DrawerOverlayCompleter<T?> openRawDrawer<T>({
  Key? key,
  required BuildContext context,
  required DrawerBuilder builder,
  required OverlayPosition position,
  bool transformBackdrop = true,
  bool useRootDrawerOverlay = true,
  bool modal = true,
  Color? barrierColor,
  bool barrierDismissible = true,
  WidgetBuilder? backdropBuilder,
  bool useSafeArea = true,
  AnimationController? animationController,
  bool autoOpen = true,
  BoxConstraints? constraints,
  AlignmentGeometry? alignment,
}) {
  DrawerLayerData? parentLayer =
      DrawerOverlay.maybeFind(context, useRootDrawerOverlay);
  CapturedThemes? themes;
  CapturedData? data;
  if (parentLayer != null) {
    themes =
        InheritedTheme.capture(from: context, to: parentLayer.overlay.context);
    data = Data.capture(from: context, to: parentLayer.overlay.context);
  } else {
    parentLayer =
        DrawerOverlay.maybeFindMessenger(context, useRootDrawerOverlay);
  }
  assert(parentLayer != null, 'No DrawerOverlay found in the widget tree');
  final completer = Completer<T?>();
  final entry = DrawerOverlayEntry(
    animationController: animationController,
    autoOpen: autoOpen,
    builder: (context, extraSize, size, padding, stackIndex) {
      return _DrawerOverlayWrapper(
        completer: completer,
        child: Builder(builder: (context) {
          return builder(context, extraSize, size, padding, stackIndex);
        }),
      );
    },
    modal: modal,
    data: data,
    barrierDismissible: barrierDismissible,
    useSafeArea: useSafeArea,
    constraints: constraints,
    alignment: alignment,
    backdropBuilder: transformBackdrop
        ? (context, child, animation, stackIndex) {
            final theme = Theme.of(context);
            final existingData = Data.maybeOf<BackdropTransformData>(context);
            return LayoutBuilder(builder: (context, constraints) {
              return stackIndex == 0
                  ? AnimatedBuilder(
                      animation: animation,
                      builder: (context, child) {
                        Size size = constraints.biggest;
                        double scale =
                            1 - (1 - kBackdropScaleDown) * animation.value;
                        Size sizeAfterScale = Size(
                          size.width * scale,
                          size.height * scale,
                        );
                        var extraSize = Size(
                          size.width -
                              sizeAfterScale.width / kBackdropScaleDown,
                          size.height -
                              sizeAfterScale.height / kBackdropScaleDown,
                        );
                        if (existingData != null) {
                          extraSize = Size(
                            extraSize.width +
                                existingData.sizeDifference.width /
                                    kBackdropScaleDown,
                            extraSize.height +
                                existingData.sizeDifference.height /
                                    kBackdropScaleDown,
                          );
                        }
                        return Data.inherit(
                          data: BackdropTransformData(extraSize),
                          child: Transform.scale(
                            scale: scale,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  theme.radiusXxl * animation.value),
                              child: child,
                            ),
                          ),
                        );
                      },
                      child: child,
                    )
                  : AnimatedBuilder(
                      animation: animation,
                      builder: (context, child) {
                        Size size = constraints.biggest;
                        double scale =
                            1 - (1 - kBackdropScaleDown) * animation.value;
                        Size sizeAfterScale = Size(
                          size.width * scale,
                          size.height * scale,
                        );
                        var extraSize = Size(
                          size.width - sizeAfterScale.width,
                          size.height - sizeAfterScale.height,
                        );
                        if (existingData != null) {
                          extraSize = Size(
                            extraSize.width +
                                existingData.sizeDifference.width /
                                    kBackdropScaleDown,
                            extraSize.height +
                                existingData.sizeDifference.height /
                                    kBackdropScaleDown,
                          );
                        }
                        return Data.inherit(
                          data: BackdropTransformData(extraSize),
                          child: Transform.scale(
                            scale: scale,
                            child: child,
                          ),
                        );
                      },
                      child: child,
                    );
            });
          }
        : (context, child, animation, stackIndex) => child,
    barrierBuilder: (context, child, animation, stackIndex) {
      if (stackIndex > 0) {
        if (!transformBackdrop) {
          return null;
        }
      }
      return Positioned(
        top: -9999,
        left: -9999,
        right: -9999,
        bottom: -9999,
        child: FadeTransition(
          opacity: animation,
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return IgnorePointer(
                ignoring: animation.status != AnimationStatus.completed,
                child: child!,
              );
            },
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: barrierDismissible ? () => closeDrawer(context) : null,
              child: Container(
                child: backdropBuilder?.call(context),
              ),
            ),
          ),
        ),
      );
    },
    themes: themes,
    completer: completer,
    position: position,
  );
  final overlay = parentLayer!.overlay;
  overlay.addEntry(entry);
  completer.future.whenComplete(() {
    overlay.removeEntry(entry);
  });
  return DrawerOverlayCompleter<T?>(entry);
}

class _MountedOverlayEntryData {
  final DrawerEntryWidgetState state;

  _MountedOverlayEntryData(this.state);
}

Future<void> closeDrawer<T>(BuildContext context, [T? result]) {
  final data = Data.maybeOf<_MountedOverlayEntryData>(context);
  assert(data != null, 'No DrawerEntryWidget found in the widget tree');
  return data!.state.close(result);
}

class DrawerLayerData {
  final DrawerOverlayState overlay;
  final DrawerLayerData? parent;

  const DrawerLayerData(this.overlay, this.parent);

  Size? computeSize() {
    return overlay.computeSize();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DrawerLayerData &&
        other.overlay == overlay &&
        other.parent == parent;
  }

  @override
  int get hashCode {
    return overlay.hashCode ^ parent.hashCode;
  }
}

class DrawerOverlay extends StatefulWidget {
  final Widget child;

  const DrawerOverlay({super.key, required this.child});

  @override
  State<DrawerOverlay> createState() => DrawerOverlayState();

  static DrawerLayerData? maybeFind(BuildContext context, [bool root = false]) {
    var data = Data.maybeFind<DrawerLayerData>(context);
    if (root) {
      while (data?.parent != null) {
        data = data!.parent;
      }
    }
    return data;
  }

  static DrawerLayerData? maybeFindMessenger(BuildContext context,
      [bool root = false]) {
    var data = Data.maybeFindMessenger<DrawerLayerData>(context);
    if (root) {
      while (data?.parent != null) {
        data = data!.parent;
      }
    }
    return data;
  }
}

class DrawerOverlayState extends State<DrawerOverlay> {
  final List<DrawerOverlayEntry> _entries = [];
  final GlobalKey backdropKey = GlobalKey();

  void addEntry(DrawerOverlayEntry entry) {
    setState(() {
      _entries.add(entry);
    });
  }

  Size computeSize() {
    Size? size = context.size;
    assert(size != null, 'DrawerOverlay is not ready');
    return size!;
  }

  void removeEntry(DrawerOverlayEntry entry) {
    setState(() {
      _entries.remove(entry);
    });
  }

  @override
  Widget build(BuildContext context) {
    final parentLayer = Data.maybeOf<DrawerLayerData>(context);
    Widget child = KeyedSubtree(
      key: backdropKey,
      child: widget.child,
    );
    int index = 0;
    for (final entry in _entries) {
      child = DrawerEntryWidget(
        key: entry.key, // to make the overlay state persistent
        builder: entry.builder,
        backdrop: child,
        barrierBuilder: entry.barrierBuilder,
        modal: entry.modal,
        themes: entry.themes,
        completer: entry.completer,
        position: entry.position,
        backdropBuilder: entry.backdropBuilder,
        animationController: entry.animationController,
        stackIndex: index++,
        totalStack: _entries.length,
        data: entry.data,
        useSafeArea: entry.useSafeArea,
        autoOpen: entry.autoOpen,
      );
    }
    return PopScope(
      // prevent from popping when there is an overlay
      // instead, the overlay should be closed first
      // once everything is closed, then this can be popped
      canPop: _entries.isEmpty,
      onPopInvokedWithResult: (didPop, result) {
        if (_entries.isNotEmpty) {
          var last = _entries.last;
          if (last.barrierDismissible) {
            var state = last.key.currentState;
            if (state != null) {
              state.close(result);
            } else {
              last.completer.complete(result);
            }
          }
        }
      },
      child: ForwardableData(
        data: DrawerLayerData(this, parentLayer),
        child: child,
      ),
    );
  }
}

class DrawerEntryWidget<T> extends StatefulWidget {
  final DrawerBuilder builder;
  final Widget backdrop;
  final BackdropBuilder backdropBuilder;
  final BarrierBuilder barrierBuilder;
  final bool modal;
  final CapturedThemes? themes;
  final CapturedData? data;
  final Completer<T> completer;
  final OverlayPosition position;
  final int stackIndex;
  final int totalStack;
  final bool useSafeArea;
  final AnimationController? animationController;
  final bool autoOpen;

  const DrawerEntryWidget({
    super.key,
    required this.builder,
    required this.backdrop,
    required this.backdropBuilder,
    required this.barrierBuilder,
    required this.modal,
    required this.themes,
    required this.completer,
    required this.position,
    required this.stackIndex,
    required this.totalStack,
    required this.data,
    required this.useSafeArea,
    required this.animationController,
    required this.autoOpen,
  });

  @override
  State<DrawerEntryWidget<T>> createState() => DrawerEntryWidgetState<T>();
}

class DrawerEntryWidgetState<T> extends State<DrawerEntryWidget<T>>
    with SingleTickerProviderStateMixin {
  late ValueNotifier<double> additionalOffset = ValueNotifier(0);
  late AnimationController _controller;
  late ControlledAnimation _controlledAnimation;
  final FocusScopeNode _focusScopeNode = FocusScopeNode();

  @override
  void initState() {
    super.initState();
    _controller = widget.animationController ??
        AnimationController(
            vsync: this, duration: const Duration(milliseconds: 350));

    _controlledAnimation = ControlledAnimation(_controller);
    if (widget.animationController == null && widget.autoOpen) {
      _controlledAnimation.forward(1, Curves.easeOut);
    }
    // discard any focus that was previously set
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  void dispose() {
    if (widget.animationController == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant DrawerEntryWidget<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animationController != oldWidget.animationController) {
      if (oldWidget.animationController == null) {
        _controller.dispose();
      }
      _controller = widget.animationController ??
          AnimationController(
            vsync: this,
            duration: const Duration(milliseconds: 350),
          );
    }
  }

  Future<void> close([T? result]) {
    return _controlledAnimation.forward(0, Curves.easeOutCubic).then((value) {
      widget.completer.complete(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    AlignmentGeometry alignment;
    Offset startFractionalOffset;
    bool padTop = widget.useSafeArea && widget.position != OverlayPosition.top;
    bool padBottom =
        widget.useSafeArea && widget.position != OverlayPosition.bottom;
    bool padLeft =
        widget.useSafeArea && widget.position != OverlayPosition.left;
    bool padRight =
        widget.useSafeArea && widget.position != OverlayPosition.right;
    switch (widget.position) {
      case OverlayPosition.left:
        alignment = AlignmentDirectional.centerStart;
        startFractionalOffset = const Offset(-1, 0);
        break;
      case OverlayPosition.right:
        alignment = AlignmentDirectional.centerEnd;
        startFractionalOffset = const Offset(1, 0);
        break;
      case OverlayPosition.top:
        alignment = Alignment.topCenter;
        startFractionalOffset = const Offset(0, -1);
        break;
      case OverlayPosition.bottom:
        alignment = Alignment.bottomCenter;
        startFractionalOffset = const Offset(0, 1);
        break;
      default:
        throw UnimplementedError('Unknown position');
    }
    return FocusScope(
      node: _focusScopeNode,
      child: CapturedWrapper(
        themes: widget.themes,
        data: widget.data,
        child: Data.inherit(
          data: _MountedOverlayEntryData(this),
          child: Builder(builder: (context) {
            Widget barrier = (widget.modal
                    ? widget.barrierBuilder(context, widget.backdrop,
                        _controlledAnimation, widget.stackIndex)
                    : null) ??
                Positioned(
                  top: -9999,
                  left: -9999,
                  right: -9999,
                  bottom: -9999,
                  child: GestureDetector(
                    onTap: () {
                      close();
                    },
                  ),
                );
            final extraSize =
                Data.maybeOf<BackdropTransformData>(context)?.sizeDifference;
            Size additionalSize;
            Offset additionalOffset;
            bool insetTop =
                widget.useSafeArea && widget.position == OverlayPosition.top;
            bool insetBottom =
                widget.useSafeArea && widget.position == OverlayPosition.bottom;
            bool insetLeft =
                widget.useSafeArea && widget.position == OverlayPosition.left;
            bool insetRight =
                widget.useSafeArea && widget.position == OverlayPosition.right;
            MediaQueryData mediaQueryData = MediaQuery.of(context);
            EdgeInsets padding =
                mediaQueryData.padding + mediaQueryData.viewInsets;
            if (extraSize == null) {
              additionalSize = Size.zero;
              additionalOffset = Offset.zero;
            } else {
              switch (widget.position) {
                case OverlayPosition.left:
                  additionalSize = Size(extraSize.width / 2, 0);
                  additionalOffset = Offset(-additionalSize.width, 0);
                  break;
                case OverlayPosition.right:
                  additionalSize = Size(extraSize.width / 2, 0);
                  additionalOffset = Offset(additionalSize.width, 0);
                  break;
                case OverlayPosition.top:
                  additionalSize = Size(0, extraSize.height / 2);
                  additionalOffset = Offset(0, -additionalSize.height);
                  break;
                case OverlayPosition.bottom:
                  additionalSize = Size(0, extraSize.height / 2);
                  additionalOffset = Offset(0, additionalSize.height);
                  break;
                default:
                  throw UnimplementedError('Unknown position');
              }
            }
            return Stack(
              clipBehavior: Clip.none,
              fit: StackFit.passthrough,
              children: [
                IgnorePointer(
                  child: widget.backdropBuilder(context, widget.backdrop,
                      _controlledAnimation, widget.stackIndex),
                ),
                barrier,
                Positioned.fill(
                  child: LayoutBuilder(builder: (context, constraints) {
                    return MediaQuery(
                      data: widget.useSafeArea
                          ? mediaQueryData.removePadding(
                              removeTop: true,
                              removeBottom: true,
                              removeLeft: true,
                              removeRight: true,
                            )
                          : mediaQueryData,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: padTop ? padding.top : 0,
                          bottom: padBottom ? padding.bottom : 0,
                          left: padLeft ? padding.left : 0,
                          right: padRight ? padding.right : 0,
                        ),
                        child: Align(
                          alignment: alignment,
                          child: AnimatedBuilder(
                            animation: _controlledAnimation,
                            builder: (context, child) {
                              return FractionalTranslation(
                                translation: startFractionalOffset *
                                    (1 - _controlledAnimation.value),
                                child: child,
                              );
                            },
                            child: Transform.translate(
                              offset: additionalOffset / kBackdropScaleDown,
                              child: widget.builder(
                                  context,
                                  additionalSize,
                                  constraints.biggest,
                                  EdgeInsets.only(
                                    top: insetTop ? padding.top : 0,
                                    bottom: insetBottom ? padding.bottom : 0,
                                    left: insetLeft ? padding.left : 0,
                                    right: insetRight ? padding.right : 0,
                                  ),
                                  widget.stackIndex),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

typedef BackdropBuilder = Widget Function(BuildContext context, Widget child,
    Animation<double> animation, int stackIndex);

typedef BarrierBuilder = Widget? Function(BuildContext context, Widget child,
    Animation<double> animation, int stackIndex);

class DrawerOverlayEntry<T> {
  final GlobalKey<DrawerEntryWidgetState<T>> key = GlobalKey();
  final BackdropBuilder backdropBuilder;
  final DrawerBuilder builder;
  final bool modal;
  final BarrierBuilder barrierBuilder;
  final CapturedThemes? themes;
  final CapturedData? data;
  final Completer<T> completer;
  final OverlayPosition position;
  final bool barrierDismissible;
  final bool useSafeArea;
  final AnimationController? animationController;
  final bool autoOpen;
  final BoxConstraints? constraints;
  final AlignmentGeometry? alignment;

  DrawerOverlayEntry({
    required this.builder,
    required this.backdropBuilder,
    required this.modal,
    required this.barrierBuilder,
    required this.themes,
    required this.completer,
    required this.position,
    required this.data,
    required this.barrierDismissible,
    required this.useSafeArea,
    required this.animationController,
    required this.autoOpen,
    required this.constraints,
    required this.alignment,
  });
}

class DrawerOverlayCompleter<T> extends OverlayCompleter<T> {
  final DrawerOverlayEntry<T> _entry;

  DrawerOverlayCompleter(this._entry);

  @override
  Future<void> get animationFuture => _entry.completer.future;

  @override
  void dispose() {
    _entry.completer.complete();
  }

  AnimationController? get animationController =>
      _entry.animationController ?? _entry.key.currentState?._controller;

  @override
  Future<T> get future => _entry.completer.future;

  @override
  bool get isAnimationCompleted => _entry.completer.isCompleted;

  @override
  bool get isCompleted => _entry.completer.isCompleted;

  @override
  void remove() {
    _entry.completer.complete();
  }
}

class SheetOverlayHandler extends OverlayHandler {
  static bool isSheetOverlay(BuildContext context) {
    return Model.maybeOf<bool>(context, #shadcn_flutter_sheet_overlay) == true;
  }

  final OverlayPosition position;
  final Color? barrierColor;

  const SheetOverlayHandler({
    this.position = OverlayPosition.bottom,
    this.barrierColor,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SheetOverlayHandler &&
        other.position == position &&
        other.barrierColor == barrierColor;
  }

  @override
  int get hashCode => Object.hash(position, barrierColor);

  @override
  OverlayCompleter<T?> show<T>({
    required BuildContext context,
    required AlignmentGeometry alignment,
    required WidgetBuilder builder,
    Offset? position,
    AlignmentGeometry? anchorAlignment,
    PopoverConstraint widthConstraint = PopoverConstraint.flexible,
    PopoverConstraint heightConstraint = PopoverConstraint.flexible,
    Key? key,
    bool rootOverlay = true,
    bool modal = true,
    bool barrierDismissable = true,
    Clip clipBehavior = Clip.none,
    Object? regionGroupId,
    Offset? offset,
    AlignmentGeometry? transitionAlignment,
    EdgeInsetsGeometry? margin,
    bool follow = true,
    bool consumeOutsideTaps = true,
    ValueChanged<PopoverOverlayWidgetState>? onTickFollow,
    bool allowInvertHorizontal = true,
    bool allowInvertVertical = true,
    bool dismissBackdropFocus = true,
    Duration? showDuration,
    Duration? dismissDuration,
    OverlayBarrier? overlayBarrier,
    LayerLink? layerLink,
  }) {
    return openRawDrawer<T>(
      context: context,
      transformBackdrop: false,
      useSafeArea: true,
      barrierDismissible: barrierDismissable,
      builder: (context, extraSize, size, padding, stackIndex) {
        final theme = Theme.of(context);
        return MultiModel(
          data: const [
            Model(#shadcn_flutter_sheet_overlay, true),
          ],
          child: SheetWrapper(
            position: this.position,
            gapAfterDragger: 8 * theme.scaling,
            expands: true,
            extraSize: extraSize,
            size: size,
            draggable: barrierDismissable,
            padding: padding,
            barrierColor: barrierColor,
            stackIndex: stackIndex,
            child: Builder(builder: (context) {
              return builder(context);
            }),
          ),
        );
      },
      position: this.position,
    );
  }
}
