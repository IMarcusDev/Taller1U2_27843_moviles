package com.example.pry_app_widget

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetProvider

// Esta clase es el "Puente"
class CountryWidgetProvider : HomeWidgetProvider() {

    override fun onUpdate(context: Context, appWidgetManager: AppWidgetManager, appWidgetIds: IntArray, widgetData: SharedPreferences) {
        // Recorremos todos los widgets que el usuario haya puesto en su pantalla
        appWidgetIds.forEach { widgetId ->
            
            // Cargamos el diseño visual (el XML nativo)
            val views = RemoteViews(context.packageName, R.layout.widget_layout).apply {
                
                // 1. LEEMOS los datos que guardaste desde Flutter/Dart
                // Las claves "country_name" y "capital" deben ser iguales a las de Flutter
                val countryName = widgetData.getString("country_name", "Esperando datos...")
                val capital = widgetData.getString("capital", "--")

                // 2. PINTAMOS los datos en los textos del diseño XML
                setTextViewText(R.id.tv_country_name, countryName)
                setTextViewText(R.id.tv_capital, capital)
            }

            // 3. ACTUALIZAMOS el widget en la pantalla
            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}