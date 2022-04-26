import 'package:brota_ai_app/components/event_card.dart';
import 'package:brota_ai_app/components/snapping-sheet/grabbing_widget.dart';
import 'package:flutter/material.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import '../../models/event_card_model.dart';
import '../../services/api_service.dart';
import 'package:intl/intl.dart';

class SimpleSnappingSheet extends StatefulWidget {
  SimpleSnappingSheet(
      {Key? key, required this.widgetBackground, this.controller})
      : super(key: key);

  final Widget widgetBackground;
  final SnappingSheetController? controller;

  static const positions = [
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
  State<SimpleSnappingSheet> createState() => _SimpleSnappingSheetState();
}

class _SimpleSnappingSheetState extends State<SimpleSnappingSheet> {
  final ScrollController listViewController = ScrollController();
  late List<EventResponseCardModel> _eventCards = List.empty();

  @override
  void initState() {
    super.initState();
    _getEventCardList();
  }

  void _getEventCardList() async {
    final api = APIService();
    setState(() {
      api.getAllEvents().then((value) => {_eventCards = value});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SnappingSheet(
      onSnapCompleted: (positionData, snappingPosition) =>
          {_getEventCardList()},
      controller: widget.controller,
      child: widget.widgetBackground,
      lockOverflowDrag: true,
      snappingPositions: SimpleSnappingSheet.positions,
      initialSnappingPosition: SimpleSnappingSheet.positions[1],
      grabbing: const GrabbingWidget(),
      grabbingHeight: 65,
      sheetAbove: SnappingSheetContent(
        child: Container(
          alignment: Alignment.bottomRight,
          padding: const EdgeInsets.all(15),
          child: FloatingActionButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
              FocusScope.of(context).requestFocus(FocusNode());
            },
            backgroundColor: Colors.white,
            child: const Icon(Icons.menu),
          ),
        ),
      ),
      sheetBelow: SnappingSheetContent(
        draggable: true,
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            controller: listViewController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(28, 8, 0, 2),
                  child: const Text(
                    'Eventos próximos',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'ABeeZee',
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                FutureBuilder(
                  future: APIService().getAllEvents(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return Container(
                        padding: const EdgeInsets.only(top: 30),
                        alignment: Alignment.center,
                        child: const SizedBox(
                          height: 50.0,
                          width: 50.0,
                          child: CircularProgressIndicator(
                            value: null,
                            strokeWidth: 7.0,
                          ),
                        ),
                      );
                    } else {
                      return Column(
                        children: _eventCards
                            .map<EventCard>((e) => EventCard(
                                name: e.name!,
                                dateTime: DateFormat('dd/MM - HH:mm')
                                    .format(e.initialDateTime!),
                                sport: e.sport!))
                            .toList(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
