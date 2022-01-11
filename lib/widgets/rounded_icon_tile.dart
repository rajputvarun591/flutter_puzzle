import 'package:flutter/material.dart';

class RoundedIconTile extends StatelessWidget {
  final Color color;
  final Color primaryColor;
  final IconData icon;
  final void Function()? onTap;
  const RoundedIconTile({Key? key, required this.color, required this.icon, this.onTap, required this.primaryColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(8.00)
      ),
      padding: const EdgeInsets.all(8.00),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: color,
          ),
          padding: const EdgeInsets.all(8.00),
          child: Icon(
            icon,
            color: Colors.white,
            size: 25.00,
          ),
        ),
      ),
    );
  }
}
