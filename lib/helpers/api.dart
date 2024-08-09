import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Api {
  Dio dio = Dio();

  Future<dynamic> get({required String url, @required String? token}) async {
     dio.options.headers = {};
    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
    Response response = await dio.get(url);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
          'there is an error in status code ${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    dio.options.headers = {};

    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }

    try {
      Response response = await dio.post(url, data: body);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(
            'there is a problem with status code ${response.statusCode} with body ${response.data}');
      }
    } catch (e) {
      throw Exception('Request failed with error: $e');
    }
  }

  Future<dynamic> put(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    dio.options.headers = {};

    dio.options.headers.addAll({
      'Content-Type': 'application/x-www-form-urlencoded',
    });
    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }

    try {
      Response response = await dio.post(url, data: body);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(
            'there is a problem with status code ${response.statusCode} with body ${response.data}');
      }
    } catch (e) {
      throw Exception('Request failed with error: $e');
    }
  }
}
