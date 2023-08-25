import 'package:a03_assemble_project/exam10/exam10_main.dart';
import 'package:a03_assemble_project/exam11/exam11_main.dart';
import 'package:flutter/material.dart';

import 'exam01/exam01_main.dart';
import 'exam02/exam02_main.dart';
import 'exam03/exam03_main.dart';
import 'exam04/exam04_main.dart';
import 'exam05/exam05_main.dart';
import 'exam06/exam06_main.dart';
import 'exam07/exam07_main.dart';
import 'exam08/exam08_main.dart';
import 'exam09/exam09_main.dart';

class Example {
  final List<Map<String, dynamic>> list = [
    {
      "appName": "exam01 Wallet",
      "leadingIcon": Icons.wallet_membership_outlined,
      "link": const exam01(),
    },
    {
      "appName": "exam02 Click Counter",
      "leadingIcon": Icons.add_box_outlined,
      "link": const exam02(),
    },
    {
      "appName": "exam03 Timer",
      "leadingIcon": Icons.watch_later_outlined,
      "link": const exam03(),
    },
    {
      "appName": "exam04 Webtoon",
      "leadingIcon": Icons.menu_book_rounded,
      "link": HomeScreenApp4(),
    },
    {
      "appName": "exam05 Sinamoro",
      "leadingIcon": Icons.camera_outlined,
      "link": const Exam05(),
    },
    {
      "appName": "exam06 SnackBar",
      "leadingIcon": Icons.message,
      "link": const Exam06(),
    },
    {
      "appName": "exam07 App Page",
      "leadingIcon": Icons.system_security_update_good_outlined,
      "link": const Exam07(),
    },
    {
      "appName": "exam08 Responsive Design",
      "leadingIcon": Icons.sports_gymnastics_outlined,
      "link": const Exam08(),
    },
    {
      "appName": "exam09 Image Masking",
      "leadingIcon": Icons.sports_gymnastics_outlined,
      "link": const Exam09(),
    },
    {
      "appName": "exam10 Material3",
      "leadingIcon": Icons.navigation_rounded,
      "link": const Exam10_Material3(),
    },
    {
      "appName": "exam11 FutureBuilder & StreamBuilder",
      "leadingIcon": Icons.navigation_rounded,
      "link": const Exam11(),
    },
  ];
}
