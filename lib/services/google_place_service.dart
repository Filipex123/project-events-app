import 'package:google_place/google_place.dart';

class GooglePlaceService {
  late GooglePlace googlePlaceInstance;

  final apiKey = "AIzaSyDGU0TNDo-a0nByrRelNxGFI_tDoA_MgW0";

  GooglePlaceService() {
    googlePlaceInstance = GooglePlace(apiKey);
  }

  Future<TextSearchResponse?> getLocationPredictions(String value) async {
    return await googlePlaceInstance.search.getTextSearch(value);
  }
}