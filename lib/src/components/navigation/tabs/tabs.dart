import 'package:shadcn_flutter/shadcn_flutter.dart';

class Tabs extends StatelessWidget {
  final int index;
  final ValueChanged<int> onChanged;
  final List<TabChild> children;
  final EdgeInsetsGeometry? padding;

  const Tabs({
    super.key,
    required this.index,
    required this.onChanged,
    required this.children,
    this.padding,
  });

  Widget _childBuilder(BuildContext context, TabContainerData data,
      Widget child) {
    final theme = Theme.of(context);
    final scaling = theme.scaling;
    final i = data.index;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        onChanged(i);
      },
      child: MouseRegion(
        hitTestBehavior: HitTestBehavior.translucent,
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(
              milliseconds: 50),
          // slightly faster than kDefaultDuration
          alignment: Alignment.center,
          padding: padding ??
              const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 4,
              ) *
                  scaling,
          decoration: BoxDecoration(
            color: i == index ? theme.colorScheme.background : null,
            borderRadius: BorderRadius.circular(
              theme.radiusMd,
            ),
            boxShadow: i == index
                ? [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                spreadRadius: 0,
                blurRadius: 2,
                offset: const Offset(0, 1),
              )
            ]
                : null,
          ),
          child: (i == index ? child.foreground() : child.muted())
              .small()
              .medium(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scaling = theme.scaling;
    return TabContainer(
      selected: index,
      onSelect: onChanged,
      builder: (context, children) {
        return Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.muted,
            borderRadius: BorderRadius.circular(theme.radiusLg),
          ),
          padding: const EdgeInsets.all(4) * scaling,
          child: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: children,
            ).muted(),
          ),
        );
      },
      childBuilder: _childBuilder,
      children: children,
    );
  }
}
