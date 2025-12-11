import 'package:flutter/material.dart';
import '../../domain/entities/country.dart';
import '../../domain/usecases/refresh_widget_usecase.dart';

class CountryViewModel extends ChangeNotifier {
  final RefreshWidgetUseCase _refreshWidgetUseCase;

  // Estados
  bool _isLoading = false;
  String? _errorMessage;
  Country? _lastUpdatedCountry;

  // Getters para que la Vista consuma
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  Country? get lastUpdatedCountry => _lastUpdatedCountry;

  // Inyección del Caso de Uso por constructor
  CountryViewModel({required RefreshWidgetUseCase refreshWidgetUseCase})
      : _refreshWidgetUseCase = refreshWidgetUseCase;

  Future<void> refreshWidget() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners(); // Notifica a la UI que muestre el "loading"

    try {
      // Nota: Asumimos que tu UseCase ahora retorna el Country para mostrarlo en la app
      // Si tu UseCase era void, modifícalo para que retorne Future<Country>
      final country = await _refreshWidgetUseCase.call(); 
      
      _lastUpdatedCountry = country;
    } catch (e) {
      _errorMessage = "No se pudo actualizar el widget: $e";
    } finally {
      _isLoading = false;
      notifyListeners(); // Notifica a la UI que terminó (éxito o error)
    }
  }
}