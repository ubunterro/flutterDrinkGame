import 'package:flutter/material.dart';

class PaletteBox extends StatelessWidget {
  const PaletteBox({
    required this.color,
    required this.height
  });

  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Tooltip(
        message: '#${color.red.toRadixString(16)}'
                 '${color.green.toRadixString(16)}'
                 '${color.blue.toRadixString(16)}',
        child: Container(
          height: height,
          color: color,
        ),
      ),
    );
  }
}
