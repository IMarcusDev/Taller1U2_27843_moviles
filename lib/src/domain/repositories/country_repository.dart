import '../entities/country.dart';

abstract class CountryRepository {
  Future<Country> getRandomCountry();
  Future<void> updateNativeWidget(Country country);
}