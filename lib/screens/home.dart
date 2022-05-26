import 'dart:async';
import 'dart:developer';

import 'package:brota_ai_app/components/address_search.dart';
import 'package:brota_ai_app/components/drawer.dart';
import 'package:brota_ai_app/components/home_search_bar.dart';
import 'package:brota_ai_app/components/snapping-sheet/snapping_sheet_widget.dart';
import 'package:brota_ai_app/screens/join_event_screen.dart';
import 'package:brota_ai_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import '../models/event_card_model.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final snappingSheetController = SnappingSheetController();
  final Completer<GoogleMapController> _controller = Completer();
  TextEditingController searchController = TextEditingController();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{}; 

  GooglePlace? googlePlace;
  List<AutocompletePrediction> predictions = [];

  @override
  void initState() {
    googlePlace = GooglePlace("AIzaSyDGU0TNDo-a0nByrRelNxGFI_tDoA_MgW0");
    super.initState();
  }

  static final _kGooglePlex = CameraPosition(
    // Brasília cordinates
    target: LatLng(-15.793699, -47.882720),
    zoom: 11,
  );

  void _handleOnTapSearhBar() async {
    final result = await showSearch(
      context: context,
      delegate: AddressSearch(),
    );
    if (result != null) {
      searchController.text = result.name ?? '';
      APIService apiService = APIService();

      var _kGoogleNewPosition = CameraPosition(
        target: LatLng(result.geometry!.location!.lat ?? -15.793699, result.geometry!.location!.lng ??  -47.882720),
        zoom: 16.5,
      );

      var nearbyEvents = await apiService.getAllByLocale({
        "lat": result.geometry!.location!.lat,
        "lng": result.geometry!.location!.lng,
      });

      nearbyEvents.forEach((element) {
        log("############" + element.participating.toString());
        final markerIdVal = element.name ?? '';
        final MarkerId markerId = MarkerId(markerIdVal);
        final Marker marker = Marker(
          markerId: markerId,
          position: LatLng(double.parse(element.locale!['lat']), double.parse(element.locale!['lng'])),
          infoWindow: InfoWindow(title: markerIdVal, snippet: element.sport!.name !+ ": " + (element.description ?? '') , onTap: () {
            GetIt.I<EventResponseCardModel>().locale = element.locale;
            GetIt.I<EventResponseCardModel>().description = element.description;
            GetIt.I<EventResponseCardModel>().id = element.id;
            GetIt.I<EventResponseCardModel>().name = element.name;
            GetIt.I<EventResponseCardModel>().participating = element.participating;
            Navigator.pushNamed(context, JoinEventScreen.id);
          }),
          onTap: () {
            // _onMarkerTapped(markerId);
          },
        );
        setState(() {
          markers[markerId] = marker;
        });
      });

      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(_kGoogleNewPosition));

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SimpleSnappingSheet(
        controller: snappingSheetController,
        widgetBackground: Stack(
          children: [
            Scaffold(
              body: GoogleMap(
                mapType: MapType.normal,
                zoomControlsEnabled: false,
                compassEnabled: false,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                markers: Set<Marker>.of(markers.values),
                // onTap: (latlong) {
                //   FocusScope.of(context).requestFocus(FocusNode());
                // },
              )
            ),
            SafeArea(
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: SearchBar(
                  handleOnTap: _handleOnTapSearhBar,
                  controller: searchController
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
