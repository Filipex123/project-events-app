import 'dart:developer';

import 'package:brota_ai_app/services/google_place_service.dart';
import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';

class AddressSearch extends SearchDelegate<SearchResult?> {
  GooglePlaceService googlePlace = GooglePlaceService();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('null');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: query == "" ? null : googlePlace.getLocationPredictions(query),
      builder: (context, snapshot) => query == ''
          ? Container(
              padding: EdgeInsets.all(16.0),
              child: Text('Insira o endereço'),
            )
          : () {
              var result = (snapshot.data as TextSearchResponse?);

              if (result?.results?.length == 0) {
                return Text('Nenhum resultado encontrado');
              }

              return ListView.builder(
                itemCount: result?.results?.length,
                itemBuilder: (context, index) {
                  var r = result?.results![index];
                  return ListTile(
                    title: Text(r?.name ?? ''),
                    onTap: () {
                      close(context, r);
                    },
                  );
                },
              );
            }(),
    );
  }
}
