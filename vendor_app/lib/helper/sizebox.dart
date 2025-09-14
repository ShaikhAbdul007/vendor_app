import 'package:flutter/widgets.dart';

Widget setHeight({required double height}) {
  return SizedBox(
    height: height,
  );
}

Widget setWidth({required double width}) {
  return SizedBox(
    width: width,
  );
}

Widget setHeightWidth({required double height, required double width}) {
  return SizedBox(
    width: width,
    height: height,
  );
}
