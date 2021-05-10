import 'package:flutter/material.dart';

class StackedWidgets extends StatelessWidget {
  final List<Widget> items;
  final double size;
  final double xShift;
  final TextDirection direction;

  const StackedWidgets({
    Key key,
    this.items,
    this.size = 100.0,
    this.xShift = 25.0,
    this.direction = TextDirection.ltr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allItems = items
        .asMap()
        .map((index, item) {
          final left = size - xShift;
          final value = Container(
            width: size,
            height: size,
            child: item,
            margin: EdgeInsets.only(left: left * index),
          );
          return MapEntry(index, value);
        })
        .values
        .toList();
    return Stack(
      children: direction == TextDirection.ltr
          ? allItems.reversed.toList()
          : allItems,
    );
  }
}
