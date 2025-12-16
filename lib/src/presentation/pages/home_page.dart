import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pry_app_widget/src/presentation/viewmodels/country_viewmodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: Consumer<CountryViewModel>(
          builder: (context, viewModel, _) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (viewModel.isLoading)
                    const CircularProgressIndicator()
                  else if (viewModel.errorMessage != null)
                    Text(
                      viewModel.errorMessage!,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.error,
                      ),
                      textAlign: TextAlign.center,
                    )
                  else if (viewModel.lastUpdatedCountry != null) ...[
                    Icon(
                      Icons.widgets_rounded,
                      size: 56,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      viewModel.lastUpdatedCountry!.name,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      viewModel.lastUpdatedCountry!.capital,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ] else
                    Text(
                      'Actualiza el widget para mostrar un país',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  const SizedBox(height: 48),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: FilledButton(
                      onPressed: () {
                        context.read<CountryViewModel>().refreshWidget();
                      },
                      child: const Text('Actualizar widget'),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
