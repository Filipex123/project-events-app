import 'package:brota_ai_app/components/snapping-sheet/grabbing-widget.dart';
import 'package:flutter/material.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

class SimpleSnappingSheet extends StatelessWidget {
  SimpleSnappingSheet({
    Key? key,
    required Widget this.widgetBackground,
    SnappingSheetController? this.controller
  }) : super(key: key);

  final ScrollController listViewController = ScrollController();
  final Widget widgetBackground;
  final SnappingSheetController? controller;

  static const positions =  [
    SnappingPosition.factor(
      positionFactor: 0.0,
      snappingCurve: Curves.easeOutExpo,
      snappingDuration: Duration(milliseconds: 500),
      grabbingContentOffset: GrabbingContentOffset.top,
    ),
    SnappingPosition.factor(
      snappingCurve: Curves.elasticOut,
      snappingDuration: Duration(milliseconds: 1250),
      positionFactor: 0.4,
    ),
    SnappingPosition.factor(
      grabbingContentOffset: GrabbingContentOffset.bottom,
      snappingCurve: Curves.elasticOut,
      snappingDuration: Duration(milliseconds: 1500),
      positionFactor: 0.75,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SnappingSheet(
      controller: controller,
      child: widgetBackground,
      lockOverflowDrag: true,
      snappingPositions: positions,
      initialSnappingPosition: positions[1],
      grabbing: const GrabbingWidget(),
      grabbingHeight: 70,
      sheetAbove: SnappingSheetContent(
        child: Container(
          alignment: Alignment.bottomRight,
          padding: const EdgeInsets.all(15),
          child: FloatingActionButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            backgroundColor: Colors.green,
            child: const Icon(Icons.menu),
          ),
        ),
      ),
      sheetBelow: SnappingSheetContent(
        draggable: true,
        childScrollController: listViewController,
        child: Container(
          color: Colors.white,
          child: ListView.builder(
            controller: listViewController,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(15),
                color: Colors.green[200],
                height: 100,
                child: Center(
                  child: Text("Evento "+ index.toString()),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}