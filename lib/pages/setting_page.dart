import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/blocs/settings_bloc.dart';
import '../bloc/events/setting_event.dart';
import '../bloc/states/setting_state.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Einstellungen')),
      body: BlocBuilder<SettingBloc, SettingState>(
        builder: (context, state) {
          final isDark = state.themeMode == ThemeMode.dark;
          return ListView(
            children: [
              SwitchListTile(
                title: const Text('Dunkles Design'),
                subtitle: Text('System-Einstellung verwenden'),
                value: isDark,
                onChanged: (_) =>
                    context.read<SettingBloc>().add(ToggleThemeEvent()),
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
