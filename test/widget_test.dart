import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:ui_builder_c/main.dart' show MyApp;

void main() {
  testWidgets('App loads without crashing', (tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(GetMaterialApp), findsOneWidget);
  });
}
