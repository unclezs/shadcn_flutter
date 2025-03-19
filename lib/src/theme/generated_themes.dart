import '../../shadcn_flutter.dart';
import 'dart:ui';

void _assertNotThemeModeSystem(ThemeMode mode, String label) {
  if (mode == ThemeMode.system) {
    final List<DiagnosticsNode> diagnosticList = [];
    diagnosticList.add(ErrorSummary(
        'ColorSchemes.${label.toLowerCase()}(ThemeMode mode) can only be used with ThemeMode.light or ThemeMode.dark.'));
    diagnosticList.add(ErrorDescription(
        'This method is only intended as a helper method to get either ColorSchemes.light$label() or ColorSchemes.dark$label().'));
    diagnosticList.add(ErrorHint('To use system theme mode, do this:\n'
        'ShadcnApp(\n'
        '  theme: ThemeData(colorScheme: ColorSchemes.${label.toLowerCase()}(ThemeMode.light)),\n'
        '  darkTheme: ThemeData(colorScheme: ColorSchemes.${label.toLowerCase()}(ThemeMode.dark)),\n'
        '  themeMode: ThemeMode.system, // optional, default is ThemeMode.system\n'
        ')\n'
        'or:\n'
        'ShadcnApp(\n'
        '  theme: ThemeData(colorScheme: ColorSchemes.light$label()),\n'
        '  darkTheme: ThemeData(colorScheme: ColorScheme.dark$label()),\n'
        ')\n'
        'instead of:\n'
        'ShadcnApp(\n'
        '  theme: ThemeData(colorScheme: ColorSchemes.${label.toLowerCase()}(ThemeMode.system)),\n'
        ')'));
    throw FlutterError.fromParts(diagnosticList);
  }
}

class ColorSchemes {
  static ColorScheme lightZinc() {
    return ColorScheme(
      brightness: Brightness.light,
      background: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      foreground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.039).toColor(),
      card: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.039).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      popoverForeground:
          const HSLColor.fromAHSL(1, 240.0, 0.1, 0.039).toColor(),
      primary: const HSLColor.fromAHSL(1, 240.0, 0.059, 0.1).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      secondary: const HSLColor.fromAHSL(1, 240.0, 0.048, 0.959).toColor(),
      secondaryForeground:
          const HSLColor.fromAHSL(1, 240.0, 0.059, 0.1).toColor(),
      muted: const HSLColor.fromAHSL(1, 240.0, 0.048, 0.959).toColor(),
      // muted: const HSLColor.fromAHSL(1, 240.0, 0.059, 0.9).toColor(),
      mutedForeground:
          const HSLColor.fromAHSL(1, 240.0, 0.038, 0.461).toColor(),
      accent: const HSLColor.fromAHSL(1, 240.0, 0.048, 0.959).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 240.0, 0.059, 0.1).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.842, 0.602).toColor(),
      destructiveForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 240.0, 0.059, 0.9).toColor(),
      input: const HSLColor.fromAHSL(1, 240.0, 0.059, 0.9).toColor(),
      ring: const HSLColor.fromAHSL(1, 240.0, 0.059, 0.1).toColor(),
      chart1: const HSLColor.fromAHSL(1, 12.0, 0.76, 0.61).toColor(),
      chart2: const HSLColor.fromAHSL(1, 173.0, 0.58, 0.39).toColor(),
      chart3: const HSLColor.fromAHSL(1, 197.0, 0.37, 0.24).toColor(),
      chart4: const HSLColor.fromAHSL(1, 43.0, 0.74, 0.66).toColor(),
      chart5: const HSLColor.fromAHSL(1, 27.0, 0.87, 0.67).toColor(),
      sidebarBackground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarForeground: const HSLColor.fromAHSL(1, 240.0, 0.053, 0.261).toColor(),
      sidebarPrimary: const HSLColor.fromAHSL(1, 240.0, 0.059, 0.1).toColor(),
      sidebarPrimaryForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarAccent: const HSLColor.fromAHSL(1, 240.0, 0.048, 0.959).toColor(),
      sidebarAccentForeground: const HSLColor.fromAHSL(1, 240.0, 0.059, 0.1).toColor(),
      sidebarBorder: const HSLColor.fromAHSL(1, 220.0, 0.13, 0.91).toColor(),
      sidebarRing: const HSLColor.fromAHSL(1, 217.2, 0.912, 0.598).toColor(),
    );
  }

  static ColorScheme darkZinc() {
    return ColorScheme(
      brightness: Brightness.dark,
      background: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.039).toColor(),
      foreground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      card: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.039).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      popover: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.039).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      primary: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      primaryForeground:
          const HSLColor.fromAHSL(1, 240.0, 0.059, 0.1).toColor(),
      secondary: const HSLColor.fromAHSL(1, 240.0, 0.037, 0.159).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      muted: const HSLColor.fromAHSL(1, 240.0, 0.037, 0.159).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 240.0, 0.05, 0.649).toColor(),
      accent: const HSLColor.fromAHSL(1, 240.0, 0.037, 0.159).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.628, 0.306).toColor(),
      destructiveForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 240.0, 0.037, 0.159).toColor(),
      input: const HSLColor.fromAHSL(1, 240.0, 0.037, 0.159).toColor(),
      ring: const HSLColor.fromAHSL(1, 240.0, 0.049, 0.839).toColor(),
      chart1: const HSLColor.fromAHSL(1, 220.0, 0.7, 0.5).toColor(),
      chart2: const HSLColor.fromAHSL(1, 160.0, 0.6, 0.45).toColor(),
      chart3: const HSLColor.fromAHSL(1, 30.0, 0.8, 0.55).toColor(),
      chart4: const HSLColor.fromAHSL(1, 280.0, 0.65, 0.6).toColor(),
      chart5: const HSLColor.fromAHSL(1, 340.0, 0.75, 0.55).toColor(),
      sidebarBackground: const HSLColor.fromAHSL(1, 240.0, 0.059, 0.1).toColor(),
      sidebarForeground: const HSLColor.fromAHSL(1, 240.0, 0.048, 0.959).toColor(),
      sidebarPrimary: const HSLColor.fromAHSL(1, 224.3, 0.763, 0.48).toColor(),
      sidebarPrimaryForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      sidebarAccent: const HSLColor.fromAHSL(1, 240.0, 0.037, 0.159).toColor(),
      sidebarAccentForeground: const HSLColor.fromAHSL(1, 240.0, 0.048, 0.959).toColor(),
      sidebarBorder: const HSLColor.fromAHSL(1, 240.0, 0.037, 0.159).toColor(),
      sidebarRing: const HSLColor.fromAHSL(1, 217.2, 0.912, 0.598).toColor(),
    );
  }

  static ColorScheme zinc(ThemeMode mode) {
    assert(() {
      _assertNotThemeModeSystem(mode, 'Zinc');
      return true;
    }());
    return mode == ThemeMode.light ? lightZinc() : darkZinc();
  }

  static ColorScheme lightSlate() {
    return ColorScheme(
      brightness: Brightness.light,
      background: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      foreground: const HSLColor.fromAHSL(1, 222.2, 0.84, 0.05).toColor(),
      card: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 222.2, 0.84, 0.05).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      popoverForeground:
          const HSLColor.fromAHSL(1, 222.2, 0.84, 0.05).toColor(),
      primary: const HSLColor.fromAHSL(1, 222.2, 0.47, 0.11).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      secondary: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.96).toColor(),
      secondaryForeground:
          const HSLColor.fromAHSL(1, 222.2, 0.47, 0.11).toColor(),
      muted: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.96).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 215.4, 0.16, 0.47).toColor(),
      accent: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.96).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 222.2, 0.47, 0.11).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.84, 0.6).toColor(),
      destructiveForeground:
          const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 214.3, 0.32, 0.91).toColor(),
      input: const HSLColor.fromAHSL(1, 214.3, 0.32, 0.91).toColor(),
      ring: const HSLColor.fromAHSL(1, 222.2, 0.84, 0.05).toColor(),
      chart1: const HSLColor.fromAHSL(1, 12.0, 0.76, 0.61).toColor(),
      chart2: const HSLColor.fromAHSL(1, 173.0, 0.58, 0.39).toColor(),
      chart3: const HSLColor.fromAHSL(1, 197.0, 0.37, 0.24).toColor(),
      chart4: const HSLColor.fromAHSL(1, 43.0, 0.74, 0.66).toColor(),
      chart5: const HSLColor.fromAHSL(1, 27.0, 0.87, 0.67).toColor(),
      sidebarBackground: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      sidebarPrimary: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarPrimaryForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarAccent: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarAccentForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarBorder: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarRing: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
    );
  }

  static ColorScheme darkSlate() {
    return ColorScheme(
      brightness: Brightness.dark,
      background: const HSLColor.fromAHSL(1, 222.2, 0.84, 0.05).toColor(),
      foreground: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      card: const HSLColor.fromAHSL(1, 222.2, 0.84, 0.05).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      popover: const HSLColor.fromAHSL(1, 222.2, 0.84, 0.05).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      primary: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      primaryForeground:
          const HSLColor.fromAHSL(1, 222.2, 0.47, 0.11).toColor(),
      secondary: const HSLColor.fromAHSL(1, 217.2, 0.33, 0.18).toColor(),
      secondaryForeground:
          const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      muted: const HSLColor.fromAHSL(1, 217.2, 0.33, 0.18).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 215.0, 0.2, 0.65).toColor(),
      accent: const HSLColor.fromAHSL(1, 217.2, 0.33, 0.18).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.63, 0.31).toColor(),
      destructiveForeground:
          const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 217.2, 0.33, 0.18).toColor(),
      input: const HSLColor.fromAHSL(1, 217.2, 0.33, 0.18).toColor(),
      ring: const HSLColor.fromAHSL(1, 212.7, 0.27, 0.84).toColor(),
      chart1: const HSLColor.fromAHSL(1, 220.0, 0.7, 0.5).toColor(),
      chart2: const HSLColor.fromAHSL(1, 160.0, 0.6, 0.45).toColor(),
      chart3: const HSLColor.fromAHSL(1, 30.0, 0.8, 0.55).toColor(),
      chart4: const HSLColor.fromAHSL(1, 280.0, 0.65, 0.6).toColor(),
      chart5: const HSLColor.fromAHSL(1, 340.0, 0.75, 0.55).toColor(),
      sidebarBackground: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      sidebarPrimary: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarPrimaryForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarAccent: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarAccentForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarBorder: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarRing: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
    );
  }

  static ColorScheme slate(ThemeMode mode) {
    assert(() {
      _assertNotThemeModeSystem(mode, 'Slate');
      return true;
    }());
    return mode == ThemeMode.light ? lightSlate() : darkSlate();
  }

  static ColorScheme lightStone() {
    return ColorScheme(
      brightness: Brightness.light,
      background: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      foreground: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      card: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      primary: const HSLColor.fromAHSL(1, 24.0, 0.1, 0.1).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      secondary: const HSLColor.fromAHSL(1, 60.0, 0.05, 0.96).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 24.0, 0.1, 0.1).toColor(),
      muted: const HSLColor.fromAHSL(1, 60.0, 0.05, 0.96).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 25.0, 0.05, 0.45).toColor(),
      accent: const HSLColor.fromAHSL(1, 60.0, 0.05, 0.96).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 24.0, 0.1, 0.1).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.84, 0.6).toColor(),
      destructiveForeground:
          const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 20.0, 0.06, 0.9).toColor(),
      input: const HSLColor.fromAHSL(1, 20.0, 0.06, 0.9).toColor(),
      ring: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      chart1: const HSLColor.fromAHSL(1, 12.0, 0.76, 0.61).toColor(),
      chart2: const HSLColor.fromAHSL(1, 173.0, 0.58, 0.39).toColor(),
      chart3: const HSLColor.fromAHSL(1, 197.0, 0.37, 0.24).toColor(),
      chart4: const HSLColor.fromAHSL(1, 43.0, 0.74, 0.66).toColor(),
      chart5: const HSLColor.fromAHSL(1, 27.0, 0.87, 0.67).toColor(),
      sidebarBackground: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      sidebarPrimary: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarPrimaryForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarAccent: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarAccentForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarBorder: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarRing: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
    );
  }

  static ColorScheme darkStone() {
    return ColorScheme(
      brightness: Brightness.dark,
      background: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      foreground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      card: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      popover: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      primary: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 24.0, 0.1, 0.1).toColor(),
      secondary: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      secondaryForeground:
          const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      muted: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 24.0, 0.05, 0.64).toColor(),
      accent: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.63, 0.31).toColor(),
      destructiveForeground:
          const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      input: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      ring: const HSLColor.fromAHSL(1, 24.0, 0.06, 0.83).toColor(),
      chart1: const HSLColor.fromAHSL(1, 220.0, 0.7, 0.5).toColor(),
      chart2: const HSLColor.fromAHSL(1, 160.0, 0.6, 0.45).toColor(),
      chart3: const HSLColor.fromAHSL(1, 30.0, 0.8, 0.55).toColor(),
      chart4: const HSLColor.fromAHSL(1, 280.0, 0.65, 0.6).toColor(),
      chart5: const HSLColor.fromAHSL(1, 340.0, 0.75, 0.55).toColor(),
      sidebarBackground: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      sidebarPrimary: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarPrimaryForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarAccent: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarAccentForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarBorder: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarRing: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
    );
  }

  static ColorScheme stone(ThemeMode mode) {
    assert(() {
      _assertNotThemeModeSystem(mode, 'Stone');
      return true;
    }());
    return mode == ThemeMode.light ? lightStone() : darkStone();
  }

  static ColorScheme lightGray() {
    return ColorScheme(
      brightness: Brightness.light,
      background: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      foreground: const HSLColor.fromAHSL(1, 224.0, 0.71, 0.04).toColor(),
      card: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 224.0, 0.71, 0.04).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      popoverForeground:
          const HSLColor.fromAHSL(1, 224.0, 0.71, 0.04).toColor(),
      primary: const HSLColor.fromAHSL(1, 220.9, 0.39, 0.11).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      secondary: const HSLColor.fromAHSL(1, 220.0, 0.14, 0.96).toColor(),
      secondaryForeground:
          const HSLColor.fromAHSL(1, 220.9, 0.39, 0.11).toColor(),
      muted: const HSLColor.fromAHSL(1, 220.0, 0.14, 0.96).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 220.0, 0.09, 0.46).toColor(),
      accent: const HSLColor.fromAHSL(1, 220.0, 0.14, 0.96).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 220.9, 0.39, 0.11).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.84, 0.6).toColor(),
      destructiveForeground:
          const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 220.0, 0.13, 0.91).toColor(),
      input: const HSLColor.fromAHSL(1, 220.0, 0.13, 0.91).toColor(),
      ring: const HSLColor.fromAHSL(1, 224.0, 0.71, 0.04).toColor(),
      chart1: const HSLColor.fromAHSL(1, 12.0, 0.76, 0.61).toColor(),
      chart2: const HSLColor.fromAHSL(1, 173.0, 0.58, 0.39).toColor(),
      chart3: const HSLColor.fromAHSL(1, 197.0, 0.37, 0.24).toColor(),
      chart4: const HSLColor.fromAHSL(1, 43.0, 0.74, 0.66).toColor(),
      chart5: const HSLColor.fromAHSL(1, 27.0, 0.87, 0.67).toColor(),
      sidebarBackground: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      sidebarPrimary: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarPrimaryForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarAccent: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarAccentForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarBorder: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarRing: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
    );
  }

  static ColorScheme darkGray() {
    return ColorScheme(
      brightness: Brightness.dark,
      background: const HSLColor.fromAHSL(1, 224.0, 0.71, 0.04).toColor(),
      foreground: const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      card: const HSLColor.fromAHSL(1, 224.0, 0.71, 0.04).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      popover: const HSLColor.fromAHSL(1, 224.0, 0.71, 0.04).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      primary: const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      primaryForeground:
          const HSLColor.fromAHSL(1, 220.9, 0.39, 0.11).toColor(),
      secondary: const HSLColor.fromAHSL(1, 215.0, 0.28, 0.17).toColor(),
      secondaryForeground:
          const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      muted: const HSLColor.fromAHSL(1, 215.0, 0.28, 0.17).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 217.9, 0.11, 0.65).toColor(),
      accent: const HSLColor.fromAHSL(1, 215.0, 0.28, 0.17).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.63, 0.31).toColor(),
      destructiveForeground:
          const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 215.0, 0.28, 0.17).toColor(),
      input: const HSLColor.fromAHSL(1, 215.0, 0.28, 0.17).toColor(),
      ring: const HSLColor.fromAHSL(1, 216.0, 0.12, 0.84).toColor(),
      chart1: const HSLColor.fromAHSL(1, 220.0, 0.7, 0.5).toColor(),
      chart2: const HSLColor.fromAHSL(1, 160.0, 0.6, 0.45).toColor(),
      chart3: const HSLColor.fromAHSL(1, 30.0, 0.8, 0.55).toColor(),
      chart4: const HSLColor.fromAHSL(1, 280.0, 0.65, 0.6).toColor(),
      chart5: const HSLColor.fromAHSL(1, 340.0, 0.75, 0.55).toColor(),
      sidebarBackground: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      sidebarPrimary: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarPrimaryForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarAccent: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarAccentForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarBorder: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarRing: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
    );
  }

  static ColorScheme gray(ThemeMode mode) {
    assert(() {
      _assertNotThemeModeSystem(mode, 'Gray');
      return true;
    }());
    return mode == ThemeMode.light ? lightGray() : darkGray();
  }

  static ColorScheme lightNeutral() {
    return ColorScheme(
      brightness: Brightness.light,
      background: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      foreground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.04).toColor(),
      card: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.04).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.04).toColor(),
      primary: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.09).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      secondary: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.96).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.09).toColor(),
      muted: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.96).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.45).toColor(),
      accent: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.96).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.09).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.84, 0.6).toColor(),
      destructiveForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.9).toColor(),
      input: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.9).toColor(),
      ring: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.04).toColor(),
      chart1: const HSLColor.fromAHSL(1, 12.0, 0.76, 0.61).toColor(),
      chart2: const HSLColor.fromAHSL(1, 173.0, 0.58, 0.39).toColor(),
      chart3: const HSLColor.fromAHSL(1, 197.0, 0.37, 0.24).toColor(),
      chart4: const HSLColor.fromAHSL(1, 43.0, 0.74, 0.66).toColor(),
      chart5: const HSLColor.fromAHSL(1, 27.0, 0.87, 0.67).toColor(),
      sidebarBackground: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      sidebarPrimary: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarPrimaryForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarAccent: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarAccentForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarBorder: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarRing: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
    );
  }

  static ColorScheme darkNeutral() {
    return ColorScheme(
      brightness: Brightness.dark,
      background: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.04).toColor(),
      foreground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      card: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.04).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.04).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      primary: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.09).toColor(),
      secondary: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.15).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      muted: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.15).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.64).toColor(),
      accent: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.15).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.63, 0.31).toColor(),
      destructiveForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.15).toColor(),
      input: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.15).toColor(),
      ring: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.83).toColor(),
      chart1: const HSLColor.fromAHSL(1, 220.0, 0.7, 0.5).toColor(),
      chart2: const HSLColor.fromAHSL(1, 160.0, 0.6, 0.45).toColor(),
      chart3: const HSLColor.fromAHSL(1, 30.0, 0.8, 0.55).toColor(),
      chart4: const HSLColor.fromAHSL(1, 280.0, 0.65, 0.6).toColor(),
      chart5: const HSLColor.fromAHSL(1, 340.0, 0.75, 0.55).toColor(),
      sidebarBackground: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      sidebarPrimary: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarPrimaryForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarAccent: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarAccentForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarBorder: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarRing: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
    );
  }

  static ColorScheme neutral(ThemeMode mode) {
    assert(() {
      _assertNotThemeModeSystem(mode, 'Neutral');
      return true;
    }());
    return mode == ThemeMode.light ? lightNeutral() : darkNeutral();
  }

  static ColorScheme lightRed() {
    return ColorScheme(
      brightness: Brightness.light,
      background: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      foreground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.04).toColor(),
      card: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.04).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.04).toColor(),
      primary: const HSLColor.fromAHSL(1, 0.0, 0.72, 0.51).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 0.0, 0.86, 0.97).toColor(),
      secondary: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.96).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.09).toColor(),
      muted: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.96).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.45).toColor(),
      accent: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.96).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.09).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.84, 0.6).toColor(),
      destructiveForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.9).toColor(),
      input: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.9).toColor(),
      ring: const HSLColor.fromAHSL(1, 0.0, 0.72, 0.51).toColor(),
      chart1: const HSLColor.fromAHSL(1, 12.0, 0.76, 0.61).toColor(),
      chart2: const HSLColor.fromAHSL(1, 173.0, 0.58, 0.39).toColor(),
      chart3: const HSLColor.fromAHSL(1, 197.0, 0.37, 0.24).toColor(),
      chart4: const HSLColor.fromAHSL(1, 43.0, 0.74, 0.66).toColor(),
      chart5: const HSLColor.fromAHSL(1, 27.0, 0.87, 0.67).toColor(),
      sidebarBackground: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      sidebarPrimary: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarPrimaryForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarAccent: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarAccentForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarBorder: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarRing: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
    );
  }

  static ColorScheme darkRed() {
    return ColorScheme(
      brightness: Brightness.dark,
      background: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.04).toColor(),
      foreground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      card: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.04).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.04).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      primary: const HSLColor.fromAHSL(1, 0.0, 0.72, 0.51).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 0.0, 0.86, 0.97).toColor(),
      secondary: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.15).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      muted: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.15).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.64).toColor(),
      accent: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.15).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.63, 0.31).toColor(),
      destructiveForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.15).toColor(),
      input: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.15).toColor(),
      ring: const HSLColor.fromAHSL(1, 0.0, 0.72, 0.51).toColor(),
      chart1: const HSLColor.fromAHSL(1, 220.0, 0.7, 0.5).toColor(),
      chart2: const HSLColor.fromAHSL(1, 160.0, 0.6, 0.45).toColor(),
      chart3: const HSLColor.fromAHSL(1, 30.0, 0.8, 0.55).toColor(),
      chart4: const HSLColor.fromAHSL(1, 280.0, 0.65, 0.6).toColor(),
      chart5: const HSLColor.fromAHSL(1, 340.0, 0.75, 0.55).toColor(),
      sidebarBackground: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      sidebarPrimary: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarPrimaryForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarAccent: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarAccentForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarBorder: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarRing: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
    );
  }

  static ColorScheme red(ThemeMode mode) {
    assert(() {
      _assertNotThemeModeSystem(mode, 'Red');
      return true;
    }());
    return mode == ThemeMode.light ? lightRed() : darkRed();
  }

  static ColorScheme lightRose() {
    return ColorScheme(
      brightness: Brightness.light,
      background: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      foreground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      card: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      primary: const HSLColor.fromAHSL(1, 346.8, 0.77, 0.5).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 355.7, 1.0, 0.97).toColor(),
      secondary: const HSLColor.fromAHSL(1, 240.0, 0.05, 0.96).toColor(),
      secondaryForeground:
          const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      muted: const HSLColor.fromAHSL(1, 240.0, 0.05, 0.96).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 240.0, 0.04, 0.46).toColor(),
      accent: const HSLColor.fromAHSL(1, 240.0, 0.05, 0.96).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.84, 0.6).toColor(),
      destructiveForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      input: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      ring: const HSLColor.fromAHSL(1, 346.8, 0.77, 0.5).toColor(),
      chart1: const HSLColor.fromAHSL(1, 12.0, 0.76, 0.61).toColor(),
      chart2: const HSLColor.fromAHSL(1, 173.0, 0.58, 0.39).toColor(),
      chart3: const HSLColor.fromAHSL(1, 197.0, 0.37, 0.24).toColor(),
      chart4: const HSLColor.fromAHSL(1, 43.0, 0.74, 0.66).toColor(),
      chart5: const HSLColor.fromAHSL(1, 27.0, 0.87, 0.67).toColor(),
      sidebarBackground: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      sidebarPrimary: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarPrimaryForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarAccent: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarAccentForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarBorder: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarRing: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
    );
  }

  static ColorScheme darkRose() {
    return ColorScheme(
      brightness: Brightness.dark,
      background: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      foreground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.95).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.09).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.95).toColor(),
      card: const HSLColor.fromAHSL(1, 24.0, 0.1, 0.1).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.95).toColor(),
      primary: const HSLColor.fromAHSL(1, 346.8, 0.77, 0.5).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 355.7, 1.0, 0.97).toColor(),
      secondary: const HSLColor.fromAHSL(1, 240.0, 0.04, 0.16).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      muted: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.15).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 240.0, 0.05, 0.65).toColor(),
      accent: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.63, 0.31).toColor(),
      destructiveForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.86, 0.97).toColor(),
      border: const HSLColor.fromAHSL(1, 240.0, 0.04, 0.16).toColor(),
      input: const HSLColor.fromAHSL(1, 240.0, 0.04, 0.16).toColor(),
      ring: const HSLColor.fromAHSL(1, 346.8, 0.77, 0.5).toColor(),
      chart1: const HSLColor.fromAHSL(1, 220.0, 0.7, 0.5).toColor(),
      chart2: const HSLColor.fromAHSL(1, 160.0, 0.6, 0.45).toColor(),
      chart3: const HSLColor.fromAHSL(1, 30.0, 0.8, 0.55).toColor(),
      chart4: const HSLColor.fromAHSL(1, 280.0, 0.65, 0.6).toColor(),
      chart5: const HSLColor.fromAHSL(1, 340.0, 0.75, 0.55).toColor(),
      sidebarBackground: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      sidebarPrimary: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarPrimaryForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarAccent: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarAccentForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarBorder: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarRing: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
    );
  }

  static ColorScheme rose(ThemeMode mode) {
    assert(() {
      _assertNotThemeModeSystem(mode, 'Rose');
      return true;
    }());
    return mode == ThemeMode.light ? lightRose() : darkRose();
  }

  static ColorScheme lightOrange() {
    return ColorScheme(
      brightness: Brightness.light,
      background: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      foreground: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      card: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      primary: const HSLColor.fromAHSL(1, 24.6, 0.95, 0.53).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      secondary: const HSLColor.fromAHSL(1, 60.0, 0.05, 0.96).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 24.0, 0.1, 0.1).toColor(),
      muted: const HSLColor.fromAHSL(1, 60.0, 0.05, 0.96).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 25.0, 0.05, 0.45).toColor(),
      accent: const HSLColor.fromAHSL(1, 60.0, 0.05, 0.96).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 24.0, 0.1, 0.1).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.84, 0.6).toColor(),
      destructiveForeground:
          const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 20.0, 0.06, 0.9).toColor(),
      input: const HSLColor.fromAHSL(1, 20.0, 0.06, 0.9).toColor(),
      ring: const HSLColor.fromAHSL(1, 24.6, 0.95, 0.53).toColor(),
      chart1: const HSLColor.fromAHSL(1, 12.0, 0.76, 0.61).toColor(),
      chart2: const HSLColor.fromAHSL(1, 173.0, 0.58, 0.39).toColor(),
      chart3: const HSLColor.fromAHSL(1, 197.0, 0.37, 0.24).toColor(),
      chart4: const HSLColor.fromAHSL(1, 43.0, 0.74, 0.66).toColor(),
      chart5: const HSLColor.fromAHSL(1, 27.0, 0.87, 0.67).toColor(),
      sidebarBackground: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      sidebarPrimary: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarPrimaryForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarAccent: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarAccentForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarBorder: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarRing: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
    );
  }

  static ColorScheme darkOrange() {
    return ColorScheme(
      brightness: Brightness.dark,
      background: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      foreground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      card: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      popover: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      primary: const HSLColor.fromAHSL(1, 20.5, 0.9, 0.48).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      secondary: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      secondaryForeground:
          const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      muted: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 24.0, 0.05, 0.64).toColor(),
      accent: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.72, 0.51).toColor(),
      destructiveForeground:
          const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      input: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      ring: const HSLColor.fromAHSL(1, 20.5, 0.9, 0.48).toColor(),
      chart1: const HSLColor.fromAHSL(1, 220.0, 0.7, 0.5).toColor(),
      chart2: const HSLColor.fromAHSL(1, 160.0, 0.6, 0.45).toColor(),
      chart3: const HSLColor.fromAHSL(1, 30.0, 0.8, 0.55).toColor(),
      chart4: const HSLColor.fromAHSL(1, 280.0, 0.65, 0.6).toColor(),
      chart5: const HSLColor.fromAHSL(1, 340.0, 0.75, 0.55).toColor(),
      sidebarBackground: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      sidebarPrimary: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarPrimaryForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarAccent: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarAccentForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarBorder: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarRing: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
    );
  }

  static ColorScheme orange(ThemeMode mode) {
    assert(() {
      _assertNotThemeModeSystem(mode, 'Orange');
      return true;
    }());
    return mode == ThemeMode.light ? lightOrange() : darkOrange();
  }

  static ColorScheme lightGreen() {
    return ColorScheme(
      brightness: Brightness.light,
      background: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      foreground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      card: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      primary: const HSLColor.fromAHSL(1, 142.1, 0.76, 0.36).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 355.7, 1.0, 0.97).toColor(),
      secondary: const HSLColor.fromAHSL(1, 240.0, 0.05, 0.96).toColor(),
      secondaryForeground:
          const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      muted: const HSLColor.fromAHSL(1, 240.0, 0.05, 0.96).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 240.0, 0.04, 0.46).toColor(),
      accent: const HSLColor.fromAHSL(1, 240.0, 0.05, 0.96).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.84, 0.6).toColor(),
      destructiveForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      input: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      ring: const HSLColor.fromAHSL(1, 142.1, 0.76, 0.36).toColor(),
      chart1: const HSLColor.fromAHSL(1, 12.0, 0.76, 0.61).toColor(),
      chart2: const HSLColor.fromAHSL(1, 173.0, 0.58, 0.39).toColor(),
      chart3: const HSLColor.fromAHSL(1, 197.0, 0.37, 0.24).toColor(),
      chart4: const HSLColor.fromAHSL(1, 43.0, 0.74, 0.66).toColor(),
      chart5: const HSLColor.fromAHSL(1, 27.0, 0.87, 0.67).toColor(),
      sidebarBackground: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      sidebarPrimary: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarPrimaryForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarAccent: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarAccentForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarBorder: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarRing: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
    );
  }

  static ColorScheme darkGreen() {
    return ColorScheme(
      brightness: Brightness.dark,
      background: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      foreground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.95).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.09).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.95).toColor(),
      card: const HSLColor.fromAHSL(1, 24.0, 0.1, 0.1).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.95).toColor(),
      primary: const HSLColor.fromAHSL(1, 142.1, 0.71, 0.45).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 144.9, 0.8, 0.1).toColor(),
      secondary: const HSLColor.fromAHSL(1, 240.0, 0.04, 0.16).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      muted: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.15).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 240.0, 0.05, 0.65).toColor(),
      accent: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.63, 0.31).toColor(),
      destructiveForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.86, 0.97).toColor(),
      border: const HSLColor.fromAHSL(1, 240.0, 0.04, 0.16).toColor(),
      input: const HSLColor.fromAHSL(1, 240.0, 0.04, 0.16).toColor(),
      ring: const HSLColor.fromAHSL(1, 142.4, 0.72, 0.29).toColor(),
      chart1: const HSLColor.fromAHSL(1, 220.0, 0.7, 0.5).toColor(),
      chart2: const HSLColor.fromAHSL(1, 160.0, 0.6, 0.45).toColor(),
      chart3: const HSLColor.fromAHSL(1, 30.0, 0.8, 0.55).toColor(),
      chart4: const HSLColor.fromAHSL(1, 280.0, 0.65, 0.6).toColor(),
      chart5: const HSLColor.fromAHSL(1, 340.0, 0.75, 0.55).toColor(),
      sidebarBackground: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      sidebarPrimary: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarPrimaryForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarAccent: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarAccentForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarBorder: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarRing: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
    );
  }

  static ColorScheme green(ThemeMode mode) {
    assert(() {
      _assertNotThemeModeSystem(mode, 'Green');
      return true;
    }());
    return mode == ThemeMode.light ? lightGreen() : darkGreen();
  }

  static ColorScheme lightBlue() {
    return ColorScheme(
      brightness: Brightness.light,
      background: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      foreground: const HSLColor.fromAHSL(1, 222.2, 0.84, 0.05).toColor(),
      card: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 222.2, 0.84, 0.05).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      popoverForeground:
          const HSLColor.fromAHSL(1, 222.2, 0.84, 0.05).toColor(),
      primary: const HSLColor.fromAHSL(1, 221.2, 0.83, 0.53).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      secondary: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.96).toColor(),
      secondaryForeground:
          const HSLColor.fromAHSL(1, 222.2, 0.47, 0.11).toColor(),
      muted: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.96).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 215.4, 0.16, 0.47).toColor(),
      accent: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.96).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 222.2, 0.47, 0.11).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.84, 0.6).toColor(),
      destructiveForeground:
          const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 214.3, 0.32, 0.91).toColor(),
      input: const HSLColor.fromAHSL(1, 214.3, 0.32, 0.91).toColor(),
      ring: const HSLColor.fromAHSL(1, 221.2, 0.83, 0.53).toColor(),
      chart1: const HSLColor.fromAHSL(1, 12.0, 0.76, 0.61).toColor(),
      chart2: const HSLColor.fromAHSL(1, 173.0, 0.58, 0.39).toColor(),
      chart3: const HSLColor.fromAHSL(1, 197.0, 0.37, 0.24).toColor(),
      chart4: const HSLColor.fromAHSL(1, 43.0, 0.74, 0.66).toColor(),
      chart5: const HSLColor.fromAHSL(1, 27.0, 0.87, 0.67).toColor(),
      sidebarBackground: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      sidebarPrimary: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarPrimaryForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarAccent: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarAccentForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarBorder: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarRing: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
    );
  }

  static ColorScheme darkBlue() {
    return ColorScheme(
      brightness: Brightness.dark,
      background: const HSLColor.fromAHSL(1, 222.2, 0.84, 0.05).toColor(),
      foreground: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      card: const HSLColor.fromAHSL(1, 222.2, 0.84, 0.05).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      popover: const HSLColor.fromAHSL(1, 222.2, 0.84, 0.05).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      primary: const HSLColor.fromAHSL(1, 217.2, 0.91, 0.6).toColor(),
      primaryForeground:
          const HSLColor.fromAHSL(1, 222.2, 0.47, 0.11).toColor(),
      secondary: const HSLColor.fromAHSL(1, 217.2, 0.33, 0.18).toColor(),
      secondaryForeground:
          const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      muted: const HSLColor.fromAHSL(1, 217.2, 0.33, 0.18).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 215.0, 0.2, 0.65).toColor(),
      accent: const HSLColor.fromAHSL(1, 217.2, 0.33, 0.18).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.63, 0.31).toColor(),
      destructiveForeground:
          const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 217.2, 0.33, 0.18).toColor(),
      input: const HSLColor.fromAHSL(1, 217.2, 0.33, 0.18).toColor(),
      ring: const HSLColor.fromAHSL(1, 224.3, 0.76, 0.48).toColor(),
      chart1: const HSLColor.fromAHSL(1, 220.0, 0.7, 0.5).toColor(),
      chart2: const HSLColor.fromAHSL(1, 160.0, 0.6, 0.45).toColor(),
      chart3: const HSLColor.fromAHSL(1, 30.0, 0.8, 0.55).toColor(),
      chart4: const HSLColor.fromAHSL(1, 280.0, 0.65, 0.6).toColor(),
      chart5: const HSLColor.fromAHSL(1, 340.0, 0.75, 0.55).toColor(),
      sidebarBackground: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      sidebarPrimary: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarPrimaryForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarAccent: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarAccentForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarBorder: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarRing: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
    );
  }

  static ColorScheme blue(ThemeMode mode) {
    assert(() {
      _assertNotThemeModeSystem(mode, 'Blue');
      return true;
    }());
    return mode == ThemeMode.light ? lightBlue() : darkBlue();
  }

  static ColorScheme lightYellow() {
    return ColorScheme(
      brightness: Brightness.light,
      background: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      foreground: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      card: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      primary: const HSLColor.fromAHSL(1, 47.9, 0.96, 0.53).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 26.0, 0.83, 0.14).toColor(),
      secondary: const HSLColor.fromAHSL(1, 60.0, 0.05, 0.96).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 24.0, 0.1, 0.1).toColor(),
      muted: const HSLColor.fromAHSL(1, 60.0, 0.05, 0.96).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 25.0, 0.05, 0.45).toColor(),
      accent: const HSLColor.fromAHSL(1, 60.0, 0.05, 0.96).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 24.0, 0.1, 0.1).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.84, 0.6).toColor(),
      destructiveForeground:
          const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 20.0, 0.06, 0.9).toColor(),
      input: const HSLColor.fromAHSL(1, 20.0, 0.06, 0.9).toColor(),
      ring: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      chart1: const HSLColor.fromAHSL(1, 12.0, 0.76, 0.61).toColor(),
      chart2: const HSLColor.fromAHSL(1, 173.0, 0.58, 0.39).toColor(),
      chart3: const HSLColor.fromAHSL(1, 197.0, 0.37, 0.24).toColor(),
      chart4: const HSLColor.fromAHSL(1, 43.0, 0.74, 0.66).toColor(),
      chart5: const HSLColor.fromAHSL(1, 27.0, 0.87, 0.67).toColor(),
      sidebarBackground: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      sidebarPrimary: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarPrimaryForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarAccent: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarAccentForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarBorder: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarRing: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
    );
  }

  static ColorScheme darkYellow() {
    return ColorScheme(
      brightness: Brightness.dark,
      background: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      foreground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      card: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      popover: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      primary: const HSLColor.fromAHSL(1, 47.9, 0.96, 0.53).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 26.0, 0.83, 0.14).toColor(),
      secondary: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      secondaryForeground:
          const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      muted: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 24.0, 0.05, 0.64).toColor(),
      accent: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.63, 0.31).toColor(),
      destructiveForeground:
          const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      input: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      ring: const HSLColor.fromAHSL(1, 35.5, 0.92, 0.33).toColor(),
      chart1: const HSLColor.fromAHSL(1, 220.0, 0.7, 0.5).toColor(),
      chart2: const HSLColor.fromAHSL(1, 160.0, 0.6, 0.45).toColor(),
      chart3: const HSLColor.fromAHSL(1, 30.0, 0.8, 0.55).toColor(),
      chart4: const HSLColor.fromAHSL(1, 280.0, 0.65, 0.6).toColor(),
      chart5: const HSLColor.fromAHSL(1, 340.0, 0.75, 0.55).toColor(),
      sidebarBackground: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      sidebarPrimary: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarPrimaryForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarAccent: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarAccentForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarBorder: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarRing: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
    );
  }

  static ColorScheme yellow(ThemeMode mode) {
    assert(() {
      _assertNotThemeModeSystem(mode, 'Yellow');
      return true;
    }());
    return mode == ThemeMode.light ? lightYellow() : darkYellow();
  }

  static ColorScheme lightViolet() {
    return ColorScheme(
      brightness: Brightness.light,
      background: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      foreground: const HSLColor.fromAHSL(1, 224.0, 0.71, 0.04).toColor(),
      card: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 224.0, 0.71, 0.04).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      popoverForeground:
          const HSLColor.fromAHSL(1, 224.0, 0.71, 0.04).toColor(),
      primary: const HSLColor.fromAHSL(1, 262.1, 0.83, 0.58).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      secondary: const HSLColor.fromAHSL(1, 220.0, 0.14, 0.96).toColor(),
      secondaryForeground:
          const HSLColor.fromAHSL(1, 220.9, 0.39, 0.11).toColor(),
      muted: const HSLColor.fromAHSL(1, 220.0, 0.14, 0.96).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 220.0, 0.09, 0.46).toColor(),
      accent: const HSLColor.fromAHSL(1, 220.0, 0.14, 0.96).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 220.9, 0.39, 0.11).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.84, 0.6).toColor(),
      destructiveForeground:
          const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 220.0, 0.13, 0.91).toColor(),
      input: const HSLColor.fromAHSL(1, 220.0, 0.13, 0.91).toColor(),
      ring: const HSLColor.fromAHSL(1, 262.1, 0.83, 0.58).toColor(),
      chart1: const HSLColor.fromAHSL(1, 12.0, 0.76, 0.61).toColor(),
      chart2: const HSLColor.fromAHSL(1, 173.0, 0.58, 0.39).toColor(),
      chart3: const HSLColor.fromAHSL(1, 197.0, 0.37, 0.24).toColor(),
      chart4: const HSLColor.fromAHSL(1, 43.0, 0.74, 0.66).toColor(),
      chart5: const HSLColor.fromAHSL(1, 27.0, 0.87, 0.67).toColor(),
      sidebarBackground: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      sidebarPrimary: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarPrimaryForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarAccent: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarAccentForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarBorder: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarRing: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
    );
  }

  static ColorScheme darkViolet() {
    return ColorScheme(
      brightness: Brightness.dark,
      background: const HSLColor.fromAHSL(1, 224.0, 0.71, 0.04).toColor(),
      foreground: const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      card: const HSLColor.fromAHSL(1, 224.0, 0.71, 0.04).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      popover: const HSLColor.fromAHSL(1, 224.0, 0.71, 0.04).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      primary: const HSLColor.fromAHSL(1, 263.4, 0.7, 0.5).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      secondary: const HSLColor.fromAHSL(1, 215.0, 0.28, 0.17).toColor(),
      secondaryForeground:
          const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      muted: const HSLColor.fromAHSL(1, 215.0, 0.28, 0.17).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 217.9, 0.11, 0.65).toColor(),
      accent: const HSLColor.fromAHSL(1, 215.0, 0.28, 0.17).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.63, 0.31).toColor(),
      destructiveForeground:
          const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 215.0, 0.28, 0.17).toColor(),
      input: const HSLColor.fromAHSL(1, 215.0, 0.28, 0.17).toColor(),
      ring: const HSLColor.fromAHSL(1, 263.4, 0.7, 0.5).toColor(),
      chart1: const HSLColor.fromAHSL(1, 220.0, 0.7, 0.5).toColor(),
      chart2: const HSLColor.fromAHSL(1, 160.0, 0.6, 0.45).toColor(),
      chart3: const HSLColor.fromAHSL(1, 30.0, 0.8, 0.55).toColor(),
      chart4: const HSLColor.fromAHSL(1, 280.0, 0.65, 0.6).toColor(),
      chart5: const HSLColor.fromAHSL(1, 340.0, 0.75, 0.55).toColor(),
      sidebarBackground: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      sidebarPrimary: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarPrimaryForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarAccent: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      sidebarAccentForeground:
          const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      sidebarBorder: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      sidebarRing: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
    );
  }

  static ColorScheme violet(ThemeMode mode) {
    assert(() {
      _assertNotThemeModeSystem(mode, 'Violet');
      return true;
    }());
    return mode == ThemeMode.light ? lightViolet() : darkViolet();
  }
}
