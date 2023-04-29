import 'package:flutter/material.dart';

class LargeSliverAppBarFlexibleSpace extends StatelessWidget {
  final Widget collapsedTitle;
  final Widget? expandedTitle;
  final bool? centerCollapsedTitle;
  final bool primary;

  const LargeSliverAppBarFlexibleSpace({
    super.key,
    required this.collapsedTitle,
    this.expandedTitle,
    this.centerCollapsedTitle,
    this.primary = true,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final FlexibleSpaceBarSettings settings =
        context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>()!;
    final double topPadding =
        primary ? MediaQuery.of(context).viewPadding.top : 0;
    final double collapsedHeight = settings.minExtent - topPadding;
    final double scrollUnderHeight = settings.maxExtent - settings.minExtent;
    final _SliverAppBarFlexibleSpaceConfig config =
        _LargeSliverAppBarFlexibleSpaceConfig(context);

    final Widget collapsedTitle = config.collapsedTextStyle != null
        ? DefaultTextStyle(
            style: config.collapsedTextStyle!,
            child: this.collapsedTitle,
          )
        : this.collapsedTitle;
    final Widget expandedTitle = config.expandedTextStyle != null
        ? DefaultTextStyle(
            style: config.expandedTextStyle!,
            child: this.expandedTitle ?? this.collapsedTitle,
          )
        : this.expandedTitle ?? this.collapsedTitle;

    late final bool centerTitle;
    {
      bool platformCenter() {
        switch (theme.platform) {
          case TargetPlatform.android:
          case TargetPlatform.fuchsia:
          case TargetPlatform.linux:
          case TargetPlatform.windows:
            return false;
          case TargetPlatform.iOS:
          case TargetPlatform.macOS:
            return true;
        }
      }

      centerTitle = centerCollapsedTitle ??
          theme.appBarTheme.centerTitle ??
          platformCenter();
    }

    final bool isCollapsed = settings.isScrolledUnder ?? false;
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: topPadding),
          child: Container(
            height: collapsedHeight,
            padding: centerTitle
                ? config.collapsedCenteredTitlePadding
                : config.collapsedTitlePadding,
            child: AnimatedOpacity(
              opacity: isCollapsed ? 1 : 0,
              duration: const Duration(milliseconds: 500),
              curve: const Cubic(0.2, 0, 0, 1),
              child: Align(
                alignment: centerTitle
                    ? Alignment.center
                    : AlignmentDirectional.centerStart,
                child: collapsedTitle,
              ),
            ),
          ),
        ),
        Flexible(
          child: ClipRect(
            child: OverflowBox(
              minHeight: scrollUnderHeight,
              maxHeight: scrollUnderHeight,
              alignment: Alignment.bottomLeft,
              child: Container(
                alignment: AlignmentDirectional.bottomStart,
                padding: config.expandedTitlePadding,
                child: expandedTitle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LargeSliverAppBarFlexibleSpaceConfig
    with _SliverAppBarFlexibleSpaceConfig {
  _LargeSliverAppBarFlexibleSpaceConfig(this.context);

  final BuildContext context;
  late final ThemeData _theme = Theme.of(context);
  late final ColorScheme _colors = _theme.colorScheme;
  late final TextTheme _textTheme = _theme.textTheme;

  // ignore: unused_field
  static const double collapsedHeight = 64;
  // ignore: unused_field
  static const double expandedHeight = 152;

  @override
  TextStyle? get collapsedTextStyle =>
      _textTheme.titleLarge?.apply(color: _colors.onSurface);

  @override
  TextStyle? get expandedTextStyle =>
      _textTheme.headlineMedium?.apply(color: _colors.onSurface);

  @override
  EdgeInsetsGeometry? get collapsedTitlePadding =>
      const EdgeInsetsDirectional.fromSTEB(48, 0, 16, 0);

  @override
  EdgeInsetsGeometry? get collapsedCenteredTitlePadding =>
      const EdgeInsets.fromLTRB(16, 0, 16, 0);

  @override
  EdgeInsetsGeometry? get expandedTitlePadding =>
      const EdgeInsets.fromLTRB(16, 0, 16, 28);
}

mixin _SliverAppBarFlexibleSpaceConfig {
  TextStyle? get collapsedTextStyle;
  TextStyle? get expandedTextStyle;
  EdgeInsetsGeometry? get collapsedTitlePadding;
  EdgeInsetsGeometry? get collapsedCenteredTitlePadding;
  EdgeInsetsGeometry? get expandedTitlePadding;
}
