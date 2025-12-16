import 'package:flutter/material.dart';
import '../../domain/entities/country.dart';
import '../../domain/usecases/refresh_widget_usecase.dart';

class CountryViewModel extends ChangeNotifier {
  final RefreshWidgetUseCase _refreshWidgetUseCase;

  // Estados
  bool _isLoading = false;
  String? _errorMessage;
  Country? _lastUpdatedCountry;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  Country? get lastUpdatedCountry => _lastUpdatedCountry;

  CountryViewModel({required RefreshWidgetUseCase refreshWidgetUseCase})
      : _refreshWidgetUseCase = refreshWidgetUseCase;

  Future<void> refreshWidget() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final country = await _refreshWidgetUseCase.call();
      // final country = Country(name: 'Ecuador', capital: 'Quito', flagUrl: 'url');
      
      _lastUpdatedCountry = country;
    } catch (e) {
      print(e);
      _errorMessage = "No se pudo actualizar el widget: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}