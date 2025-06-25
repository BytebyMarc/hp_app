import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme_bloc.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Einstellungen')),
      body: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          final isDark = state.themeMode == ThemeMode.dark;
          return ListView(
            children: [
              SwitchListTile(
                title: const Text('Dunkles Design'),
                subtitle: Text('System-Einstellung verwenden'),
                value: isDark,
                onChanged: (_) =>
                    context.read<ThemeBloc>().add(ToggleThemeEvent()),
              ),
              const Divider(),
              // Weitere Einstellungen hier...
            ],
          );
        },
      ),
    );
  }
}
