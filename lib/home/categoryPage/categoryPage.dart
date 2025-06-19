import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'category_page_bloc.dart';
import 'category_page_event.dart';
import 'category_page_state.dart';
import 'package:hp_app/repository/categoryRepository.dart';
import 'package:hp_app/models/categoryModel.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final bloc = CategoryPageBloc(repository: CategoryRepository());
        bloc.add(LoadCategories());
        return bloc;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Kategorien')),
        body: BlocBuilder<CategoryPageBloc, CategoryState>(
          builder: (context, state) {
            if (state is CategoriesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CategoriesLoaded) {
              return ListView.builder(
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  final cat = state.categories[index];
                  return ListTile(
                    title: Text(cat.name),
                    onTap: () => context.read<CategoryPageBloc>().add(SelectCategory(cat.id)),
                  );
                },
              );
            } else if (state is CategoriesError) {
              return Center(child: Text('Fehler: \${state.message}'));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
