import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RightSideTopArea extends StatelessWidget {
  String title;
  RightSideTopArea(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      child: WindowTitleBarBox(
        child: MoveWindow(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                left: 0,
                top: -5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                // padding:
                //     const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  "$title - " + "AppName".tr,
                ),
              ),
              Positioned(
                  right: 0,
                  // padding:
                  //     const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: const WindowButtons())
            ],
          ),
        ),
      ),
    );
  }
}

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context)!.colors;
    final buttonColors = WindowButtonColors(
        iconNormal: colors.icon,
        iconMouseDown: colors.iconMouseDown,
        iconMouseOver: colors.iconMouseOver,
        mouseDown: colors.buttonMouseDown,
        mouseOver: colors.buttonMouseOver);
    final closeButtonColors = WindowButtonColors(
        mouseOver: Colors.red[700],
        mouseDown: Colors.red[900],
        iconNormal: colors.icon,
        iconMouseOver: Colors.white);

    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        MaximizeWindowButton(colors: buttonColors),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}

class AppColors extends InheritedWidget {
  final AppSkin colors;
  //final Widget child;
  const AppColors({
    Key? key,
    required this.colors,
    required Widget child,
  }) : super(key: key, child: child);

  static AppColors? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppColors>();
  }

  @override
  bool updateShouldNotify(AppColors oldWidget) => colors != oldWidget.colors;
}

class AppSkin {
  final Color sidebar;
  final Color backgroundStart;
  final Color backgroundEnd;
  final Color border;
  final Color buttonMouseOver;
  final Color buttonMouseDown;
  final Color icon;
  final Color iconMouseOver;
  final Color iconMouseDown;

  const AppSkin(
      {required this.sidebar,
      required this.backgroundStart,
      required this.backgroundEnd,
      required this.border,
      required this.buttonMouseOver,
      required this.buttonMouseDown,
      required this.icon,
      required this.iconMouseOver,
      required this.iconMouseDown});
}
