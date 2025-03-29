
import '../../../shadcn_flutter.dart';

class DatePickerController extends ValueNotifier<DateTime?>
    with ComponentController<DateTime?> {
  DatePickerController(super.value);
}

class ControlledDatePicker extends StatelessWidget
    with ControlledComponent<DateTime?> {
  @override
  final DateTime? initialValue;
  @override
  final ValueChanged<DateTime?>? onChanged;
  @override
  final bool enabled;
  @override
  final DatePickerController? controller;

  final Widget? placeholder;
  final PromptMode mode;
  final CalendarView? initialView;
  final AlignmentGeometry? popoverAlignment;
  final AlignmentGeometry? popoverAnchorAlignment;
  final EdgeInsetsGeometry? popoverPadding;
  final Widget? dialogTitle;
  final CalendarViewType? initialViewType;
  final DateStateBuilder? stateBuilder;

  const ControlledDatePicker({
    super.key,
    this.controller,
    this.initialValue,
    this.onChanged,
    this.enabled = true,
    this.placeholder,
    this.mode = PromptMode.dialog,
    this.initialView,
    this.popoverAlignment,
    this.popoverAnchorAlignment,
    this.popoverPadding,
    this.dialogTitle,
    this.initialViewType,
    this.stateBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return ControlledComponentAdapter(
      controller: controller,
      initialValue: initialValue,
      onChanged: onChanged,
      enabled: enabled,
      builder: (context, data) {
        return DatePicker(
          enabled: data.enabled,
          value: data.value,
          onChanged: data.onChanged,
          placeholder: placeholder,
          mode: mode,
          initialView: initialView,
          popoverAlignment: popoverAlignment,
          popoverAnchorAlignment: popoverAnchorAlignment,
          popoverPadding: popoverPadding,
          dialogTitle: dialogTitle,
          initialViewType: initialViewType,
          stateBuilder: stateBuilder,
        );
      },
    );
  }
}

class DatePicker extends StatelessWidget {
  final DateTime? value;
  final ValueChanged<DateTime?>? onChanged;
  final Widget? placeholder;
  final PromptMode mode;
  final CalendarView? initialView;
  final AlignmentGeometry? popoverAlignment;
  final AlignmentGeometry? popoverAnchorAlignment;
  final EdgeInsetsGeometry? popoverPadding;
  final Widget? dialogTitle;
  final CalendarViewType? initialViewType;
  final DateStateBuilder? stateBuilder;
  final bool? enabled;

  const DatePicker({
    super.key,
    required this.value,
    this.onChanged,
    this.placeholder,
    this.mode = PromptMode.dialog,
    this.initialView,
    this.popoverAlignment,
    this.popoverAnchorAlignment,
    this.popoverPadding,
    this.dialogTitle,
    this.initialViewType,
    this.stateBuilder,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    ShadcnLocalizations localizations = ShadcnLocalizations.of(context);
    return ObjectFormField(
      dialogTitle: dialogTitle,
      enabled: enabled,
      popoverAlignment: popoverAlignment,
      popoverAnchorAlignment: popoverAnchorAlignment,
      popoverPadding: popoverPadding,
      value: value,
      onChanged: onChanged,
      placeholder: placeholder ?? Text(localizations.placeholderDatePicker),
      trailing: const Icon(LucideIcons.calendarDays),
      builder: (context, value) {
        return Text(localizations.formatDateTime(value, showTime: false));
      },
      mode: mode,
      editorBuilder: (context, handler) {
        return DatePickerDialog(
          initialView: initialView ?? CalendarView.now(),
          initialViewType: initialViewType ?? CalendarViewType.date,
          selectionMode: CalendarSelectionMode.single,
          initialValue: handler.value == null
              ? null
              : CalendarValue.single(handler.value!),
          onChanged: (value) {
            handler.value =
                value == null ? null : (value as SingleCalendarValue).date;
          },
          stateBuilder: stateBuilder,
        );
      },
    );
  }
}

class DateTimeRange {
  final DateTime start;
  final DateTime end;

  const DateTimeRange(this.start, this.end);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DateTimeRange && other.start == start && other.end == end;
  }

  @override
  int get hashCode => start.hashCode ^ end.hashCode;

  @override
  String toString() {
    return 'DateTimeRange{start: $start, end: $end}';
  }

  DateTimeRange copyWith({
    DateTime? start,
    DateTime? end,
  }) {
    return DateTimeRange(
      start ?? this.start,
      end ?? this.end,
    );
  }
}

class DateRangePicker extends StatelessWidget {
  final DateTimeRange? value;
  final ValueChanged<DateTimeRange?>? onChanged;
  final Widget? placeholder;
  final PromptMode mode;
  final CalendarView? initialView;
  final CalendarViewType? initialViewType;
  final AlignmentGeometry? popoverAlignment;
  final AlignmentGeometry? popoverAnchorAlignment;
  final EdgeInsetsGeometry? popoverPadding;
  final Widget? dialogTitle;
  final DateStateBuilder? stateBuilder;

  const DateRangePicker({
    super.key,
    required this.value,
    this.onChanged,
    this.placeholder,
    this.mode = PromptMode.dialog,
    this.initialView,
    this.popoverAlignment,
    this.popoverAnchorAlignment,
    this.popoverPadding,
    this.dialogTitle,
    this.initialViewType,
    this.stateBuilder,
  });

  @override
  Widget build(BuildContext context) {
    ShadcnLocalizations localizations = ShadcnLocalizations.of(context);
    return ObjectFormField(
      popoverAlignment: popoverAlignment,
      popoverAnchorAlignment: popoverAnchorAlignment,
      popoverPadding: popoverPadding,
      value: value,
      mode: mode,
      onChanged: onChanged,
      dialogTitle: dialogTitle,
      placeholder: placeholder ?? Text(localizations.placeholderDatePicker),
      trailing: const Icon(LucideIcons.calendarRange),
      builder: (context, value) {
        return Text(
            '${localizations.formatDateTime(value.start, showTime: false)} - ${localizations.formatDateTime(value.end, showTime: false)}');
      },
      editorBuilder: (context, handler) {
        DateTimeRange? value = handler.value;
        return LayoutBuilder(builder: (context, constraints) {
          return DatePickerDialog(
            initialView: initialView,
            initialViewType: initialViewType ?? CalendarViewType.date,
            selectionMode: CalendarSelectionMode.range,
            viewMode: constraints.biggest.width < 500
                ? CalendarSelectionMode.single
                : CalendarSelectionMode.range,
            initialValue: value == null
                ? null
                : CalendarValue.range(value.start, value.end),
            onChanged: (value) {
              if (value == null) {
                handler.value = null;
              } else {
                final range = value.toRange();
                handler.value = DateTimeRange(range.start, range.end);
              }
            },
            stateBuilder: stateBuilder,
          );
        });
      },
    );
  }
}
