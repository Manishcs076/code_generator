import 'package:get/get.dart';
import '../../builder/models/widget_model.dart';
import '../../../services/code_generator.dart';

class BuilderController extends GetxController {
  var widgets = <WidgetModel>[].obs;

  var uiCode = "".obs;
  var widgetCode = "".obs;

  void addWidget(WidgetModel w) {
    widgets.add(w);
    generateCode();
  }

  void generateCode() {
    uiCode.value = CodeGenerator.generateFullPage(widgets);
    widgetCode.value = CodeGenerator.generateWidgetTree(widgets);
  }
}
