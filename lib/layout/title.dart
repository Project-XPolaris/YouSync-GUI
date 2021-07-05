import 'dart:ui';
import 'dart:io' show Platform;
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

final buttonColors = WindowButtonColors(
  iconNormal: Color(0xFFFFFFFF),
  mouseOver: Color(0x22000000),
  mouseDown: Color(0x33000000),
);

final lightButtonColors = WindowButtonColors(
  iconNormal: Color(0xFF2A2A2A),
  mouseOver: Color(0x22000000),
  mouseDown: Color(0x33000000),
);
final closeButtonColors = WindowButtonColors(
  mouseOver: Color(0xFFD32F2F),
  mouseDown: Color(0xFFB71C1C),
  iconNormal: Colors.white,
);
final lightCloseButtonColors = WindowButtonColors(
    mouseOver: Color(0xFFD32F2F),
    mouseDown: Color(0xFFB71C1C),
    iconNormal: Color(0xFF2A2A2A));

class WindowButtons extends StatelessWidget {
  final bool isLight;

  WindowButtons({this.isLight = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(
            colors: isLight ? lightButtonColors : buttonColors),
        MaximizeWindowButton(
            colors: isLight ? lightButtonColors : buttonColors),
        CloseWindowButton(
            colors: isLight ? lightCloseButtonColors : closeButtonColors),
      ],
    );
  }
}

class TitleBar extends StatefulWidget {
  final Widget child;
  final bool isLight;
  final Color? color;
  const TitleBar({Key? key, required this.child, this.isLight = false,this.color})
      : super(key: key);

  @override
  _TitleBarState createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid || Platform.isIOS) {
      return widget.child;
    }
    return Material(
      child: Container(
        color: widget.color ?? Theme.of(context).primaryColor,
        child: Column(
          children: [
            WindowTitleBarBox(
              child: Row(
                children: [
                  Expanded(child: MoveWindow()),
                  WindowButtons(
                    isLight: widget.isLight,
                  )
                ],
              ),
            ),
            Expanded(child: widget.child),
          ],
        ),
      ),
    );
  }
}
