import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_app/navigation_cubit.dart';

import '../home/home.dart';
import '../lexikon/lexikon.dart';
import '../settings/settings.dart';

class BurgerMenu extends StatelessWidget {
  const BurgerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hppsy Examen App')),

      drawer: _AppDrawer(),
      body: BlocBuilder<NavigationCubit, MenuItem>(
        builder: (context, menu) {
          switch (menu) {
            case MenuItem.proVersion:
              return const Center(child: Text('Proversion'));
            case MenuItem.login:
              return const Center(child: Text('Login'));
            case MenuItem.impressum:
              return const Center(child: Text('Impressum'));
            case MenuItem.faq:
              return const Center(child: Text('Häufige Fragen'));
            case MenuItem.lexikon:
              return Lexikon();
            case MenuItem.datenschutz:
              return const Center(child: Text('Datenschutz'));
            case MenuItem.settings:
              return Settings();
            case MenuItem.registieren:
              return const Center(child: Text('Registieren'));
            case MenuItem.shop:
              return const Center(child: Text('Shop'));
            case MenuItem.facebook:
              return const Center(child: Text('Facebook'));
            case MenuItem.instagram:
              return const Center(child: Text('Instagram'));
            case MenuItem.youtube:
              return const Center(child: Text('Youtube'));
            case MenuItem.home:
            default:
              return HomeScreen();
          }
        },
      ),
    );
  }
}

class _AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final current = context.watch<NavigationCubit>().state;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Menü',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Jetzt Lernen'),
            selected: current == MenuItem.home,
            onTap: () {
              context.read<NavigationCubit>().selectMenu(MenuItem.home);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Lexikon'),
            selected: current == MenuItem.lexikon,
            onTap: () {
              context.read<NavigationCubit>().selectMenu(MenuItem.lexikon);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.paid),
            title: const Text('Pro-Version'),
            selected: current == MenuItem.proVersion,
            onTap: () {
              context.read<NavigationCubit>().selectMenu(MenuItem.proVersion);
              Navigator.pop(context);
            },
          ),
          ListTile(title: const Text('Benutzer')),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Einstellung'),
            selected: current == MenuItem.settings,
            onTap: () {
              context.read<NavigationCubit>().selectMenu(MenuItem.settings);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.app_registration),
            title: const Text('Registieren'),
            selected: current == MenuItem.registieren,
            onTap: () {
              context.read<NavigationCubit>().selectMenu(MenuItem.registieren);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Login'),
            selected: current == MenuItem.login,
            onTap: () {
              context.read<NavigationCubit>().selectMenu(MenuItem.login);
              Navigator.pop(context);
            },
          ),
          ListTile(title: const Text('Über Hppsy.de')),
          ListTile(
            leading: const Icon(Icons.question_answer),
            title: const Text('FAQ: Häufige Fragen'),
            selected: current == MenuItem.faq,
            onTap: () {
              context.read<NavigationCubit>().selectMenu(MenuItem.faq);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Datenschutz'),
            selected: current == MenuItem.datenschutz,
            onTap: () {
              context.read<NavigationCubit>().selectMenu(MenuItem.datenschutz);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Impressum'),
            selected: current == MenuItem.impressum,
            onTap: () {
              context.read<NavigationCubit>().selectMenu(MenuItem.impressum);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
