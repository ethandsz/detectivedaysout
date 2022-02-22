import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' as math;

import './variables.dart' as variables;

double distance(mx, my, px, py) {
  var dx = mx - px;
  var dy = my - py;
  return math.sqrt(dx * dx + dy * dy);
}
