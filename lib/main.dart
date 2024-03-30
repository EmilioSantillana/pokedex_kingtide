import 'package:flutter/material.dart';

import 'views/home/view/home_view.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'Pokemon',
    ),
    home: const HomeView(),
  ));
}