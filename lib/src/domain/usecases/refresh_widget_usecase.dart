import '../entities/country.dart';
import '../repositories/country_repository.dart';

class RefreshWidgetUseCase {
  final CountryRepository repository;

  RefreshWidgetUseCase(this.repository);

  Future<Country> call() async {
    final country = await repository.getRandomCountry();
    await repository.updateNativeWidget(country);
    return country; 
  }
}