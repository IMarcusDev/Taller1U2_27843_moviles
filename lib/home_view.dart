import 'package:flutter/material.dart';
import 'package:pry_app_widget/app_widget/app_widget.dart';

class UpdateWidgetScreen extends StatelessWidget {
  const UpdateWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Actualizar Widget")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            AppWidget.setWidgetText("Hola desde Flutter!");
          },
          child: Text("Actualizar widget de inicio"),
        ),
      ),
    );
  }
}
