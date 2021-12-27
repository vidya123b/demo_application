import 'dart:convert';

import 'package:demo_application/models/model.dart';
import 'package:dio/dio.dart';

class Api {
  var dio;

  void initDio() {
    dio = Dio();
  }

  Future getApiCall() async {
    return await dio
        .get('https://rickandmortyapi.com/api/character/?page=1');
  }
}
