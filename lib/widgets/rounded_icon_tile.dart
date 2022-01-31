import 'package:flutter/material.dart';

class RoundedIconTile extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;
  final Function(DragDownDetails details)? onPanDown;
  final Function(DragEndDetails details)? onPanEnd;
  const RoundedIconTile({Key? key, required this.icon, this.onTap, this.onPanDown, this.onPanEnd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      onPanDown: onPanDown,
      onPanEnd: onPanEnd,
      child: Container(
        decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(6.00)
        ),
        padding: const EdgeInsets.all(8.00),
        child: Container(
          decoration: BoxDecoration(
            color: theme.backgroundColor,
          ),
          padding: const EdgeInsets.all(5.00),
          child: Icon(
            icon,
            color: theme.iconTheme.color,
            size: 25.00,
          ),
        ),
      ),
    );
  }
}
