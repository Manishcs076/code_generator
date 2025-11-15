import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/builder_controller.dart';
import '../models/widget_model.dart';

class BuilderView extends StatelessWidget {
  const BuilderView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(BuilderController());

    return Scaffold(
      body: Row(
        children: [
          // LEFT SIDE
          Expanded(
            flex: 3,
            child: Column(
              children: [
                // horizontal widget list
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Draggable<String>(
                        data: "text",
                        feedback: const Material(child: Text("Text")),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Chip(label: Text("Text")),
                        ),
                      ),
                    ],
                  ),
                ),

                // phone canvas
                Expanded(
                  child: DragTarget<String>(
                    onAcceptWithDetails: (details) {
                      c.addWidget(
                        WidgetModel(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          type: details.data,
                          position: details.offset,
                        ),
                      );
                    },
                    builder: (ctx, cand, rej) {
                      return Obx(() => Stack(
                        children: [
                          for (var w in c.widgets)
                            Positioned(
                              left: w.position.dx,
                              top: w.position.dy,
                              child: Text(w.text),
                            )
                        ],
                      ));
                    },
                  ),
                ),
              ],
            ),
          ),

          // RIGHT SIDE CODE EDITOR TABS
          Expanded(
            flex: 2,
            child: Obx(() => DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  bottom: const TabBar(
                    tabs: [
                      Tab(text: "UI Code"),
                      Tab(text: "Widget Code"),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Text(c.uiCode.value),
                    ),
                    SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Text(c.widgetCode.value),
                    ),
                  ],
                ),
              ),
            )),
          ),
        ],
      ),
    );
  }
}
