import 'package:flutter/material.dart';

/// A widget that makes your screen responsive according to the defined widgets on breakpoints.
class ResponsiveSoul extends StatelessWidget {
  final Widget xsm;
  final Widget sm;
  final Widget md;
  final Widget lg;
  final Widget xl;
  final Widget xxl;

  final bool autoManage;

  late final Map<String, Widget> map;

  /// default widget.
  static const defaultW = Center(
      child: Text('Place some widget to show',
          style: TextStyle(
              color: Colors.red, fontSize: 16, fontWeight: FontWeight.w900)));

  ResponsiveSoul({
    Key? key,
    this.xsm = const SizedBox(),
    this.sm = const SizedBox(),
    this.md = const SizedBox(),
    this.lg = const SizedBox(),
    this.xl = const SizedBox(),
    this.xxl = const SizedBox(),
    this.autoManage = true,
  }) : super(key: key) {
    map = {
      "xsm": xsm,
      "sm": sm,
      "md": md,
      "lg": lg,
      "xl": xl,
      "xxl": xxl,
    };
  }

  static bool isXSM(BuildContext context) =>
      MediaQuery.of(context).size.width < 576;

  static bool isSM(BuildContext context) =>
      MediaQuery.of(context).size.width >= 576 &&
      MediaQuery.of(context).size.width < 768;

  static bool isMD(BuildContext context) =>
      MediaQuery.of(context).size.width >= 768 &&
      MediaQuery.of(context).size.width < 992;

  static bool isLG(BuildContext context) =>
      MediaQuery.of(context).size.width >= 992 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isXL(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200 &&
      MediaQuery.of(context).size.width < 1400;

  static bool isXXL(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1400;

  /// returns [widget] based on breakpoints.
  @override
  Widget build(BuildContext context) {
    if (autoManage) {
      if (xsm is! SizedBox && isXSM(context)) {
        return xsm;
      } else if (xsm is SizedBox && isXSM(context)) {
        return extractWidget(startIndex: 0);
      } else if (sm is! SizedBox && isSM(context)) {
        return sm;
      } else if (sm is SizedBox && isSM(context)) {
        return extractWidget(startIndex: 0);
      } else if (md is! SizedBox && isMD(context)) {
        return md;
      } else if (md is SizedBox && isMD(context)) {
        return extractWidget(startIndex: 1);
      } else if (lg is! SizedBox && isLG(context)) {
        return lg;
      } else if (lg is SizedBox && isLG(context)) {
        return extractWidget(startIndex: 2);
      } else if (xl is! SizedBox && isXL(context)) {
        return xl;
      } else if (xl is SizedBox && isXL(context)) {
        return extractWidget(startIndex: 3);
      } else if (xxl is! SizedBox && isXXL(context)) {
        return xxl;
      } else if (xxl is SizedBox && isXXL(context)) {
        return extractWidget(startIndex: 4);
      } else {
        return defaultW;
      }
    } else {
      if (xsm is! SizedBox && isXSM(context)) {
        return xsm;
      } else if (sm is! SizedBox && isSM(context)) {
        return sm;
      } else if (md is! SizedBox && isMD(context)) {
        return md;
      } else if (lg is! SizedBox && isLG(context)) {
        return lg;
      } else if (xl is! SizedBox && isXL(context)) {
        return xl;
      } else if (xxl is! SizedBox && isXXL(context)) {
        return xxl;
      } else {
        return const SizedBox();
      }
    }
  }

  /// loop start from [startIndex] and search the widget that is not null. (means SizedBox)
  ///
  /// returns [widget] that is not SizedBox and that is most previous to the defined one.

  Widget extractWidget({required startIndex}) {
    Widget result = const SizedBox();
    final list = map.values.toList();
    for (var i = startIndex; i >= 0; i--) {
      if (list[i] is! SizedBox) {
        result = list[i];
        break;
      }
    }
    if (result is SizedBox) {
      for (var i = startIndex + 1; i < list.length; i++) {
        if (list[i] is! SizedBox) {
          result = list[i];
          break;
        }
      }
    }

    return result;
  }
}
