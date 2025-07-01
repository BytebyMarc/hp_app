import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_app/widgets/navigation/burger_menu.dart';
import 'bloc/events/lexikon_event.dart';
import 'widgets/navigation/navigation_cubit.dart';
import 'bloc/blocs/lexikon_bloc.dart';
import 'theme/app_theme.dart';
import 'package:hp_app/bloc/blocs/settings_bloc.dart';
import 'bloc/states/setting_state.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(BlocProvider(
    create: (_) => NavigationCubit(),
    child: MultiBlocProvider(providers: [
      BlocProvider(create: (_) => SettingBloc()),
      BlocProvider(create: (_) => NavigationCubit()),
      BlocProvider(create: (_) => NavigationHome()),
      BlocProvider(create: (_) => LexikonBloc()..add(LoadLexikon())),
        ], child: const MyApp())
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, themeState) {
        return MaterialApp(
          title: 'Hppsy Prüfungstrainer',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeState.themeMode,
          home: const BurgerMenu(),
        );
      },
    );
  }
}

