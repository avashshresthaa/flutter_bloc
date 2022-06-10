import 'dart:convert';
import 'package:flutter_bloc_practice/model/data_model.dart';
import 'package:http/http.dart' as http;

class DataServices {
  String baseUrl = "http://mark.bslmeiyu.com/api";

  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/getplaces';
    http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));

    //we get json object and we need to decode it
    //body is list of json object and we need to decode it as flutte understand map

    // we need to deocde in list and conver into map for that we need model
    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        print(list);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}
