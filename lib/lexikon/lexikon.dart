import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'lexikon_bloc.dart';
import 'lexikon_event.dart';
import 'lexikon_state.dart';

class Lexikon extends StatelessWidget {
  const Lexikon({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<LexikonBloc>().add(LoadLexikon());

    return Scaffold(
      drawer: const Drawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Suche...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (query) {
                context.read<LexikonBloc>().add(SearchLexikon(query));
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<LexikonBloc, LexikonState>(
              builder: (context, state) {
                if (state is LexikonLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is LexikonLoaded) {
                  final entries = state.entries;
                  if (entries.isEmpty) {
                    return const Center(child: Text('Keine Einträge gefunden'));
                  }
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: entries.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final entry = entries[index];
                      return Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          title: Text(
                            entry.term,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(entry.description),
                        ),
                      );
                    },
                  );
                } else if (state is LexikonError) {
                  return Center(child: Text('Fehler: ${state.message}'));
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
