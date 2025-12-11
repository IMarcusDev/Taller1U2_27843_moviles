import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pry_app_widget/src/presentation/viewmodels/country_viewmodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Accedemos al ViewModel (opcional, para acciones puntuales fuera del build)
    // final viewModel = context.read<CountryViewModel>(); 

    return Scaffold(
      appBar: AppBar(title: const Text('Widget MVVM')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Consumer<CountryViewModel>(
            builder: (context, viewModel, child) {
              // 1. Estado de Carga
              if (viewModel.isLoading) {
                return const CircularProgressIndicator();
              }

              // 2. Contenido Principal
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (viewModel.errorMessage != null)
                    Text(
                      viewModel.errorMessage!,
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),

                  if (viewModel.lastUpdatedCountry != null) ...[
                    const Icon(Icons.check_circle, color: Colors.green, size: 50),
                    const SizedBox(height: 10),
                    Text(
                      "Widget actualizado con:",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      viewModel.lastUpdatedCountry!.name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text("Capital: ${viewModel.lastUpdatedCountry!.capital}"),
                  ] else
                    const Text("Presiona el botón para configurar el widget"),

                  const SizedBox(height: 30),

                  ElevatedButton.icon(
                    onPressed: () {
                      // Llamada al evento del ViewModel
                      context.read<CountryViewModel>().refreshWidget();
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('Actualizar Widget'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}