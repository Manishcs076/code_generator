import '../modules/builder/models/widget_model.dart';

class CodeGenerator {
  static String generateWidgetTree(List<WidgetModel> widgets) {
    final buffer = StringBuffer();
    buffer.writeln("Stack(children: [");
    for (var w in widgets) {
      buffer.writeln("  Positioned(left: ${w.position.dx}, top: ${w.position.dy}, child: Text('${w.text}')),");
    }
    buffer.writeln("]);");
    return buffer.toString();
  }

  static String generateFullPage(List<WidgetModel> widgets) {
    return """
Scaffold(
  body: ${generateWidgetTree(widgets)}
)
""";
  }
}
