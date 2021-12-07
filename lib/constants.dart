import 'package:fghan_dicitionary/main.dart';
import 'package:fghan_dicitionary/widgets/top_area.dart';
import 'package:flutter/material.dart';

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);

const defaultPadding = 16.0;

AppSkin appSkin = const AppSkin(
  sidebar: secondaryColor,
  backgroundStart: primaryColor,
  backgroundEnd: secondaryColor,
  border: bgColor,
  buttonMouseOver: primaryColor,
  buttonMouseDown: bgColor,
  icon: primaryColor,
  iconMouseOver: bgColor,
  iconMouseDown: primaryColor,
);
