import '../../domain/entities/country.dart';

class CountryModel extends Country {
  CountryModel({required super.name, required super.capital, required super.flagUrl});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name']['common'] ?? 'Desconocido',
      capital: (json['capital'] as List).isNotEmpty ? json['capital'][0] : 'N/A',
      flagUrl: json['flags']['png'] ?? '',
    );
  }
}