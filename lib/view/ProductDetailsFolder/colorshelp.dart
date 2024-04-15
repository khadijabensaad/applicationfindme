import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class THelperFunctions {
  static Color? getColor(String value) {
    switch (value.toLowerCase()) {
      case 'green':
        return Colors.green;
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      case 'pink':
        return Colors.pink;
      case 'grey':
        return Colors.grey;
      case 'purple':
        return Colors.purple;
      case 'black':
        return Colors.black;
      case 'white':
        return Colors.white;
      case 'yellow':
        return Colors.yellow;
      case 'orange':
        return Colors.orange;
      case 'brown':
        return Colors.brown;
      case 'cyan':
        return Colors.cyan;
      case 'teal':
        return Colors.teal;
      case 'amber':
        return Colors.amber;
      case 'indigo':
        return Colors.indigo;
      case 'lime':
        return Colors.lime;
      case 'deeporange':
        return Colors.deepOrange;
      case 'lightblue':
        return Colors.lightBlue;
      case 'lightgreen':
        return Colors.lightGreen;
      case 'deepPurple':
        return Colors.deepPurple;
      case 'yellowAccent':
        return Colors.yellowAccent;
      case 'tealAccent':
        return Colors.tealAccent;
      case 'cyanAccent':
        return Colors.cyanAccent;
      case 'blueAccent':
        return Colors.blueAccent;
      case 'orangeAccent':
        return Colors.orangeAccent;
      case 'greenAccent':
        return Colors.greenAccent;
      case 'indigoAccent':
        return Colors.indigoAccent;
      case 'purpleAccent':
        return Colors.purpleAccent;
      case 'pinkAccent':
        return Colors.pinkAccent;
      case 'redAccent':
        return Colors.redAccent;
      case 'greyAccent':
        return Colors.grey.shade400;
      default:
        return null;
    }
  }
}
