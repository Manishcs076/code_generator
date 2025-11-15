import 'package:get/get.dart';
import '../modules/builder/views/builder_view.dart';
part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.builder, page: () => const BuilderView()),
  ];
}
