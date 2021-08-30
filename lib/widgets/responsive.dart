import 'package:flutter/material.dart';

class Resposive extends StatelessWidget {
  final Widget Mobile;
  final Widget Tablet;
  final Widget Desktop;

  const Resposive(
      {Key key, @required this.Mobile, this.Tablet, @required this.Desktop})
      : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraits) {
      if (constraits.maxWidth >= 1200) {
        return Desktop;
      } else if (constraits.maxWidth >= 800) {
        return Tablet ?? Mobile;
      } else {
        return Mobile;
      }
    });
  }
}
