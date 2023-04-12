import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseRepository extends GetConnect {
  @protected
  static const _apiKey = 'pataIv4PDO6yAFWS3.b10eaae92b1b19810014b3dd7ad143f91d1b3b88a7581673ad7b0bc39d2c1af5';
  final url = 'https://api.airtable.com/v0/appbU4eio2BS45p8o';
  final headers = {'Authorization': 'Bearer $_apiKey'};

  Future<dynamic> checkError(Response response) async {
    if (response.statusCode == 401) {
      final data = json.decode(response.body);
      print(data['records']);
      return data['records'];
    } else {
      final data = json.decode(response.body);
      final error = data['error'];
      throw Exception(error['message']);
    }
  }
}