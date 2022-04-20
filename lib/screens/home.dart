import 'package:brota_ai_app/components/drawer.dart';
import 'package:brota_ai_app/components/google-map.dart';
import 'package:brota_ai_app/components/home_search_bar.dart';
import 'package:brota_ai_app/components/snapping-sheet/snapping_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';

  final snappingSheetController = SnappingSheetController();

  HomeScreen({Key? key}) : super(key: key);

  void _handleOnTapSearhBar() {
    if (snappingSheetController.isAttached) {
      const position = SnappingPosition.factor(
        positionFactor: 0.0,
        snappingCurve: Curves.ease,
        snappingDuration: Duration(milliseconds: 0),
        grabbingContentOffset: GrabbingContentOffset.top,
      );
      snappingSheetController.snapToPosition(position);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SimpleSnappingSheet(
        controller: snappingSheetController,
        widgetBackground: Stack(
          children: [
            GoogleSimpleMap(),
            SafeArea(
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: SearchBar(
                  handleOnTap: _handleOnTapSearhBar,
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: const DrawerMenu(),
    );
  }
}
