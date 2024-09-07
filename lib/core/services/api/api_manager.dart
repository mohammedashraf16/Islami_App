import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:islami/features/home/models/radio_model.dart';
class ApiManager{
  static Future<RadioModel?> getRadios()async{
    Uri url = Uri.parse("https://mp3quran.net/api/v3/radios");
    var response = await http.get(url);
    if(response.statusCode==200){
      var json =jsonDecode(response.body);
      RadioModel radioModel = RadioModel.fromJson(json);
      print(response.body);
      return radioModel;
    }
  }
}