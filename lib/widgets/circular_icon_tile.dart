import 'package:flutter/material.dart';

class CircularIconTile extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;
  final Function(DragDownDetails details)? onPanDown;
  final Function(DragEndDetails details)? onPanEnd;
  const CircularIconTile({Key? key, required this.icon, this.onTap, this.onPanDown, this.onPanEnd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(5.00),
      child: GestureDetector(
        onTap: onTap,
        onPanDown: onPanDown,
        onPanEnd: onPanEnd,
        child: Container(
          decoration: BoxDecoration(
            color: theme.backgroundColor,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(5.00),
          child: Icon(
            icon,
            color: theme.iconTheme.color,
            size: 20.00,
          ),
        ),
      ),
    );
  }
}
