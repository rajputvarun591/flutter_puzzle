import 'package:flutter/material.dart';
import 'package:flutter_puzzle/styles/text_style.dart';

class RoundedTextTile extends StatelessWidget {
  final Color color;
  final String label;
  final void Function() onTap;
  const RoundedTextTile({Key? key, required this.color, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.00)
      ),
      padding: const EdgeInsets.all(8.00),
      child: Container(
        decoration: BoxDecoration(
          color: color,
        ),
        padding: const EdgeInsets.all(8.00),
        child: Text(label, style: ts20ptComfortaaMEDIUM.copyWith(color: Colors.white)),
      ),
    );
  }
}
