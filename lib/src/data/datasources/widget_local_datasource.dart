import 'package:home_widget/home_widget.dart';

class WidgetLocalDataSource {
  Future<void> updateWidgetData(String name, String capital) async {
    // Guardar datos clave-valor para Android
    await HomeWidget.saveWidgetData<String>('country_name', name);
    await HomeWidget.saveWidgetData<String>('capital', capital);
    
    // Notificar al provider nativo (Kotlin)
    await HomeWidget.updateWidget(
      name: 'CountryWidgetProvider',
      androidName: 'CountryWidgetProvider',
    );
  }
}