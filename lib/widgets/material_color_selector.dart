import 'package:flutter/material.dart';
import 'package:flutter_puzzle/styles/themes.dart';

class MaterialColorSelector extends StatelessWidget {
  const MaterialColorSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      title: const Text("Choose Theme"),
      content: Wrap(
        spacing: 10.00,
        runSpacing: 10.00,
        alignment: WrapAlignment.center,
        children: [
          InkWell(
            child: Container(
              height: 50.00,
              width: 50.00,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(8.00)
              ),
            ),
            onTap: () => Navigator.of(context).pop(Themes.yellow),
          ),
          InkWell(
            child: Container(
              height: 50.00,
              width: 50.00,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8.00)
              ),
            ),
            onTap: () => Navigator.of(context).pop(Themes.red),
          ),
          InkWell(
            child: Container(
              height: 50.00,
              width: 50.00,
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(8.00)
              ),
            ),
            onTap: () => Navigator.of(context).pop(Themes.purple),
          ),
          InkWell(
            child: Container(
              height: 50.00,
              width: 50.00,
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(8.00)
              ),
            ),
            onTap: () => Navigator.of(context).pop(Themes.dark),
          ),
          InkWell(
            child: Container(
              height: 50.00,
              width: 50.00,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8.00)
              ),
            ),
            onTap: () => Navigator.of(context).pop(Themes.grey),
          ),
          InkWell(
            child: Container(
              height: 50.00,
              width: 50.00,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8.00)
              ),
            ),
            onTap: () => Navigator.of(context).pop(Themes.green),
          ),
          InkWell(
            child: Container(
              height: 50.00,
              width: 50.00,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8.00)
              ),
            ),
            onTap: () => Navigator.of(context).pop(Themes.blue),
          ),
        ],
      ),
    );
  }
}
