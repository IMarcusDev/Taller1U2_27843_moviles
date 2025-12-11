import 'package:pry_app_widget/src/data/datasources/country_remote_datasource.dart';
import 'package:pry_app_widget/src/data/datasources/widget_local_datasource.dart';

import '../../domain/entities/country.dart';
import '../../domain/repositories/country_repository.dart';

class CountryRepositoryImpl implements CountryRepository {
  final CountryRemoteDataSource remoteDataSource;
  final WidgetLocalDataSource widgetDataSource;

  CountryRepositoryImpl({
    required this.remoteDataSource,
    required this.widgetDataSource,
  });

  @override
  Future<Country> getRandomCountry() async {
    return await remoteDataSource.fetchRandomCountry();
  }

  @override
  Future<void> updateNativeWidget(Country country) async {
    await widgetDataSource.updateWidgetData(country.name, country.capital);
  }
}