import 'package:home_widget/home_widget.dart';

class AppWidget {
  static const widgetNameAndroid = 'MyHomeWidgetProvider';
  static const widgetNameIOS = 'MyHomeWidget';

  /// Guarda texto para mostrar en el widget
  static Future<void> setWidgetText(String text) async {
    await HomeWidget.saveWidgetData<String>('widget_text', text);
    await update();
  }

  /// Actualiza el widget en pantalla
  static Future<void> update() async {
    await HomeWidget.updateWidget(
      androidName: widgetNameAndroid,
      iOSName: widgetNameIOS,
    );
  }
}
