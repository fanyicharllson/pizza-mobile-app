import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyMacroWidget extends StatelessWidget {
  final String title;
  final int value;
  final IconData icons;
  const MyMacroWidget({
    super.key,
    required this.title,
    required this.value,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(3, 3),
              blurRadius: 5,
              color: Colors.grey.shade400,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              FaIcon(icons, color: Colors.redAccent),
              SizedBox(height: 4.0),
              Text('$value $title', style: TextStyle(fontSize: 10)),
            ],
          ),
        ),
      ),
    );
  }
}
