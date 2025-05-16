import 'package:flutter/material.dart';

const double kNone = 0.0;

const double kSize02 = 0.2;
const double kSize03 = 0.3;
const double kSize1 = 1.0;
const double kSize10 = 10;
const double kSize12 = 12.0;
const double kSize14 = 14.0;
const double kSize16 = 16.0;
const double kSize18 = 18.0;
const double kSize20 = 20.0;
const double kSize24 = 24.0;
const double kSize28 = 28.0;
const double kSize30 = 30.0;
const double kSize34 = 34.0;
const double kSize40 = 40.0;
const double kSize50 = 50.0;
const double kSize100 = 100.0;
const double kSize160 = 160.0;
const double kSize200 = 200.0;
const double kSize300 = 300.0;
const double kSize400 = 400.0;
const double kSize500 = 500.0;

const Duration k150milSec = Duration(milliseconds: 150);
const Duration k500milSec = Duration(milliseconds: 500);

const Duration k2sec = Duration(seconds: 2);
const Duration k3sec = Duration(seconds: 3);
const Duration k20sec = Duration(seconds: 20);

EdgeInsets kPaddingAll(double value) => EdgeInsets.all(value);

EdgeInsets kPaddingSymmetric({double vertical = kNone, double horizontal = kNone}) =>
    EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal);

EdgeInsets kPaddingOnly({double left = kNone, double right = kNone, double top = kNone, double bottom = kNone}) =>
    EdgeInsets.only(left: left, right: right, top: top, bottom: bottom);
