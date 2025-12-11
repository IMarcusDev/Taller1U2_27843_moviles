import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import '../models/country_model.dart';

class CountryRemoteDataSource {
  Future<CountryModel> fetchRandomCountry() async {
    final response = await http.get(Uri.parse('https://restcountries.com/v3.1/all?fields=name,capital,flags'));
    
    if (response.statusCode == 200) {
      final List<dynamic> list = jsonDecode(response.body);
      final randomJson = list[Random().nextInt(list.length)];
      return CountryModel.fromJson(randomJson);
    } else {
      throw Exception('Error cargando países');
    }
  }
}