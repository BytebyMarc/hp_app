import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_app/navigation_cubit.dart';


class HomePage extends StatelessWidget {

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Hppsy Examen App')),

        drawer: _AppDrawer(),
        body: BlocBuilder<NavigationCubit, MenuItem>(
          builder:(context, menu){
            switch (menu){
              case MenuItem.settings:
                return const Center(child: Text('Einstellung'));
              case MenuItem.home:
              default:
                return const Center(child: Text('Startseite'));
            }
          }
        )


    );
  }
}

class _AppDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final current = context.watch<NavigationCubit>().state;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Menü', style: TextStyle(color: Colors.white, fontSize: 24))
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Startseite'),
            selected: current == MenuItem.home,
            onTap:(){
              context.read<NavigationCubit>().selectMenu(MenuItem.home);
              Navigator.pop(context);

            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Einstellung'),
            selected: current == MenuItem.settings,
            onTap:(){
              context.read<NavigationCubit>().selectMenu(MenuItem.settings);

            }
          )


        ],
    ),
    );

  }


}