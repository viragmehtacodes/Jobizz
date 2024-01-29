import 'package:flutter/widgets.dart';

ColorFilter svgColor(Color color) {
  return ColorFilter.mode(
    color,
    BlendMode.srcIn,
  );
}


const Color primaryColor = Color(0xFFE3F14E);
const Color byjusColor = Color(0xFF9054ff);

const double defaultPadding = 16.0;