import 'dart:async';

import 'package:demo_application/api.dart';
import 'package:demo_application/models/model.dart';
import 'package:flutter/cupertino.dart';

class Bloc {
  Api api = new Api();
  final StreamController<InfoModel> _fetcher =
      StreamController<InfoModel>.broadcast();

  Stream<InfoModel> get fetchInfo =>
      _fetcher.stream;

  Future fetchData() async {
    api.initDio();
    this.api.getApiCall().then((response) async {
      try {
        if (response != null) {
          if (response.statusCode == 200) {
            InfoModel infoModel = InfoModel.fromJson(response.data['info']);
            List<dynamic> list =
            response.data["results"] as List;
            infoModel.results = list
                .map<RickNMortyCharacterModel>((json) => RickNMortyCharacterModel.fromJson(json))
                .toList();
            _fetcher.sink.add(infoModel);
          } else {
            throw Exception('Failed to load album');
          }
        }
      } catch (e) {
        print(e);
      }
    });
  }
}
