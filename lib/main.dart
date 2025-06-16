import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_app/BurgerMenu/BurgerMenu.dart';
import 'lexikon/lexikon_event.dart';
import 'navigation_cubit.dart';
import 'lexikon/lexikon_bloc.dart';


void main() {
  runApp(BlocProvider(
    create: (_) => NavigationCubit(),
    child: MultiBlocProvider(providers: [
      BlocProvider(create: (_) => NavigationCubit()),
      BlocProvider(create: (_) => LexikonBloc()..add(LoadLexikon())),
        ], child: const MyApp())
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hppsy Examen App',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BurgerMenu(),
    );
  }
}

