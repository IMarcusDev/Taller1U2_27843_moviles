import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pry_app_widget/src/data/datasources/country_remote_datasource.dart';
import 'package:pry_app_widget/src/data/datasources/widget_local_datasource.dart';
import 'package:pry_app_widget/src/data/repositories/country_repository_impl.dart';
import 'package:pry_app_widget/src/domain/usecases/refresh_widget_usecase.dart';
import 'package:pry_app_widget/src/presentation/pages/home_page.dart';
import 'package:pry_app_widget/src/presentation/viewmodels/country_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final remoteDataSource = CountryRemoteDataSource();
    final widgetLocalDataSource = WidgetLocalDataSource();

    final repository = CountryRepositoryImpl(
      remoteDataSource: remoteDataSource,
      widgetDataSource: widgetLocalDataSource,
    );

    // 3. Use Case
    final refreshWidgetUseCase = RefreshWidgetUseCase(repository);

    return MultiProvider(
      providers: [
        // 4. ViewModel (Provider inyecta el UseCase en el ViewModel)
        ChangeNotifierProvider(
          create: (_) => CountryViewModel(
            refreshWidgetUseCase: refreshWidgetUseCase
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Country Widget',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomePage(),
      ),
    );
  }
}