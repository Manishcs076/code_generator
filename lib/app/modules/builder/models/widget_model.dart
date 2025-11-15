import 'package:flutter/material.dart';

class WidgetModel {
  final String id;
  final String type;
  String text;
  Color color;
  Offset position;

  WidgetModel({
    required this.id,
    required this.type,
    this.text = "Sample Text",
    this.color = Colors.black,
    required this.position,
  });
}
