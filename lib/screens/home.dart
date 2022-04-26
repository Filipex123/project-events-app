import 'dart:developer';

import 'package:brota_ai_app/components/drawer.dart';
import 'package:brota_ai_app/components/google-map.dart';
import 'package:brota_ai_app/components/home_search_bar.dart';
import 'package:brota_ai_app/components/snapping-sheet/snapping_sheet_widget.dart';
import 'package:brota_ai_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final snappingSheetController = SnappingSheetController();
  GooglePlace? googlePlace;
  List<AutocompletePrediction> predictions = [];

  @override
  void initState() {
    googlePlace = GooglePlace("AIzaSyDGU0TNDo-a0nByrRelNxGFI_tDoA_MgW0");
    super.initState();
  }

  void _handleOnTapSearhBar() async {
    if (snappingSheetController.isAttached) {
      const position = SnappingPosition.factor(
        positionFactor: 0.0,
        snappingCurve: Curves.ease,
        snappingDuration: Duration(milliseconds: 0),
        grabbingContentOffset: GrabbingContentOffset.top,
      );
      snappingSheetController.snapToPosition(position);
    }
 
    var result = await googlePlace?.search.getFindPlace("Júlio Wilfredo", InputType.TextQuery);
    var result3 = await googlePlace?.search.getTextSearch("Rua Júlio Wilfredo Castro Perez 325");
    var result2 = await googlePlace?.autocomplete.get('Rua Júlio Wilfredo Castro Perez 325');

    
    result3?.results!.forEach((element) {
      log(element.name ?? '');
      log(element.geometry?.location?.lat.toString() ?? '');
      log(element.geometry?.location?.lng.toString() ?? '');
    },);

    result?.candidates!.forEach((element) {
      log(element.name ?? 'nada');
    },);

    result2?.predictions!.forEach((element) {
      // element.description!.forEach((element) {
      //   log(element.);
      // });
      log(element.description ?? '');
      //log(element. ?? '');
    },);
   
    //log(result?.results!.length.toString() ?? '');
     
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
