import 'package:flutter/cupertino.dart';

class ColumnOrientationBuilder extends StatelessWidget {
  final List<Widget> children;
  const ColumnOrientationBuilder({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return OrientationBuilder(
      builder: (context, orientation) {
        if(Orientation.portrait == orientation) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.00),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          );
        } else {
          return SizedBox(
            width: size.width * 0.40,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.00, right: 10.00),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
            ),
          );
        }
      },
    );
  }
}
