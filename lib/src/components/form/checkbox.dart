import '../../../shadcn_flutter.dart';

class CheckboxController extends ValueNotifier<CheckboxState>
    with ComponentController<CheckboxState> {
  CheckboxController(CheckboxState value) : super(value);

  void check() {
    value = CheckboxState.checked;
  }

  void uncheck() {
    value = CheckboxState.unchecked;
  }

  void indeterminate() {
    value = CheckboxState.indeterminate;
  }

  void toggle() {
    value = value == CheckboxState.checked
        ? CheckboxState.unchecked
        : CheckboxState.checked;
  }

  void toggleTristate() {
    value = value == CheckboxState.checked
        ? CheckboxState.unchecked
        : value == CheckboxState.unchecked
            ? CheckboxState.indeterminate
            : CheckboxState.checked;
  }

  bool get isChecked => value == CheckboxState.checked;
  bool get isUnchecked => value == CheckboxState.unchecked;
  bool get isIndeterminate => value == CheckboxState.indeterminate;
}

class ControlledCheckbox extends StatelessWidget
    with ControlledComponent<CheckboxState> {
  @override
  final CheckboxController? controller;
  @override
  final CheckboxState initialValue;
  @override
  final ValueChanged<CheckboxState>? onChanged;
  @override
  final bool enabled;
  final Widget? leading;
  final Widget? trailing;
  final bool tristate;

  const ControlledCheckbox({
    super.key,
    this.controller,
    this.initialValue = CheckboxState.unchecked,
    this.onChanged,
    this.enabled = true,
    this.leading,
    this.trailing,
    this.tristate = false,
  });

  @override
  Widget build(BuildContext context) {
    return ControlledComponentAdapter<CheckboxState>(
      controller: controller,
      initialValue: initialValue,
      onChanged: onChanged,
      enabled: enabled,
      builder: (context, data) {
        return Checkbox(
          state: data.value,
          onChanged: data.onChanged,
          leading: leading,
          trailing: trailing,
          enabled: data.enabled,
          tristate: tristate,
        );
      },
    );
  }
}

enum CheckboxState implements Comparable<CheckboxState> {
  checked,
  unchecked,
  indeterminate;

  @override
  int compareTo(CheckboxState other) {
    return index.compareTo(other.index);
  }
}

class Checkbox extends StatefulWidget {
  final CheckboxState state;
  final ValueChanged<CheckboxState>? onChanged;
  final Widget? leading;
  final Widget? trailing;
  final bool tristate;
  final bool? enabled;

  const Checkbox({
    super.key,
    required this.state,
    required this.onChanged,
    this.leading,
    this.trailing,
    this.tristate = false,
    this.enabled,
  });

  @override
  _CheckboxState createState() => _CheckboxState();
}

class _CheckboxState extends State<Checkbox>
    with FormValueSupplier<CheckboxState, Checkbox> {
  final bool _focusing = false;
  bool _shouldAnimate = false;

  @override
  void initState() {
    super.initState();
    formValue = widget.state;
  }

  void _changeTo(CheckboxState state) {
    if (widget.onChanged != null) {
      widget.onChanged!(state);
    }
  }

  void _tap() {
    if (widget.tristate) {
      switch (widget.state) {
        case CheckboxState.checked:
          _changeTo(CheckboxState.unchecked);
          break;
        case CheckboxState.unchecked:
          _changeTo(CheckboxState.indeterminate);
          break;
        case CheckboxState.indeterminate:
          _changeTo(CheckboxState.checked);
          break;
      }
    } else {
      _changeTo(
        widget.state == CheckboxState.checked
            ? CheckboxState.unchecked
            : CheckboxState.checked,
      );
    }
  }

  @override
  void didReplaceFormValue(CheckboxState value) {
    _changeTo(value);
  }

  @override
  void didUpdateWidget(covariant Checkbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.state != oldWidget.state) {
      formValue = widget.state;
      _shouldAnimate = true;
    }
  }

  bool get enabled => widget.enabled ?? widget.onChanged != null;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Clickable(
      enabled: widget.onChanged != null,
      mouseCursor: enabled
          ? const WidgetStatePropertyAll(SystemMouseCursors.click)
          : const WidgetStatePropertyAll(SystemMouseCursors.forbidden),
      onPressed: enabled ? _tap : null,
      enableFeedback: enabled,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.leading != null) ...[
            widget.leading!.small().medium(),
            SizedBox(width: theme.scaling * 8),
          ],
          AnimatedContainer(
            duration: kDefaultDuration,
            width: theme.scaling * 16,
            height: theme.scaling * 16,
            decoration: BoxDecoration(
              color: widget.state == CheckboxState.checked
                  ? theme.colorScheme.primary
                  : theme.colorScheme.primary.withValues(alpha: 0),
              borderRadius: BorderRadius.circular(theme.radiusSm),
              border: Border.all(
                color: !enabled
                    ? theme.colorScheme.muted
                    : _focusing
                        ? theme.colorScheme.ring
                        : widget.state == CheckboxState.checked
                            ? theme.colorScheme.primary
                            : theme.colorScheme.mutedForeground,
                width: (_focusing ? 2 : 1) * theme.scaling,
              ),
            ),
            child: widget.state == CheckboxState.checked
                ? Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      child: SizedBox(
                        width: theme.scaling * 9,
                        height: theme.scaling * 6.5,
                        child: AnimatedValueBuilder(
                          value: 1.0,
                          initialValue: _shouldAnimate ? 0.0 : null,
                          duration: const Duration(milliseconds: 300),
                          curve: const IntervalDuration(
                            start: Duration(milliseconds: 175),
                            duration: Duration(milliseconds: 300),
                          ),
                          builder: (context, value, child) {
                            return CustomPaint(
                              painter: AnimatedCheckPainter(
                                progress: value,
                                color: theme.colorScheme.primaryForeground,
                                strokeWidth: theme.scaling * 1,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      width: widget.state == CheckboxState.indeterminate
                          ? theme.scaling * 8
                          : 0,
                      height: widget.state == CheckboxState.indeterminate
                          ? theme.scaling * 8
                          : 0,
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(theme.radiusXs),
                      ),
                    ),
                  ),
          ),
          SizedBox(width: theme.scaling * 8),
          if (widget.trailing != null) widget.trailing!.small().medium(),
        ],
      ),
    );
  }
}

class AnimatedCheckPainter extends CustomPainter {
  final double progress;
  final Color color;
  final double strokeWidth;

  AnimatedCheckPainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final path = Path();
    Offset firstStrokeStart = Offset(0, size.height * 0.5);
    Offset firstStrokeEnd = Offset(size.width * 0.35, size.height);
    Offset secondStrokeStart = firstStrokeEnd;
    Offset secondStrokeEnd = Offset(size.width, 0);
    double firstStrokeLength =
        (firstStrokeEnd - firstStrokeStart).distanceSquared;
    double secondStrokeLength =
        (secondStrokeEnd - secondStrokeStart).distanceSquared;
    double totalLength = firstStrokeLength + secondStrokeLength;

    double normalizedFirstStrokeLength = firstStrokeLength / totalLength;
    double normalizedSecondStrokeLength = secondStrokeLength / totalLength;

    double firstStrokeProgress =
        progress.clamp(0.0, normalizedFirstStrokeLength) /
            normalizedFirstStrokeLength;
    double secondStrokeProgress = (progress - normalizedFirstStrokeLength)
            .clamp(0.0, normalizedSecondStrokeLength) /
        normalizedSecondStrokeLength;
    if (firstStrokeProgress <= 0) {
      return;
    }
    Offset currentPoint =
        Offset.lerp(firstStrokeStart, firstStrokeEnd, firstStrokeProgress)!;
    path.moveTo(firstStrokeStart.dx, firstStrokeStart.dy);
    path.lineTo(currentPoint.dx, currentPoint.dy);
    if (secondStrokeProgress <= 0) {
      canvas.drawPath(path, paint);
      return;
    }
    Offset secondPoint = Offset.lerp(
      secondStrokeStart,
      secondStrokeEnd,
      secondStrokeProgress,
    )!;
    path.lineTo(secondPoint.dx, secondPoint.dy);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant AnimatedCheckPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
