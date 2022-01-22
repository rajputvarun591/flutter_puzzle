import 'package:flutter/cupertino.dart';

import 'material_color_selector.dart';

class MyOrientationBuilder extends StatelessWidget {
  final List<Widget> children;
  const MyOrientationBuilder({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if(Orientation.landscape == orientation) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: children,
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          );
        }
      },
    );
  }
}
