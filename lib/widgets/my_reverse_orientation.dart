import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'material_color_selector.dart';

class MyReverseOrientation extends StatelessWidget {
  final List<Widget> children;
  const MyReverseOrientation({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return OrientationBuilder(
      builder: (context, orientation) {
        if(Orientation.portrait == orientation) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.00).copyWith(bottom: 10.00),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: children,
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.00).copyWith(right: 30.00),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: children,
            ),
          );
        }
      },
    );
  }
}
