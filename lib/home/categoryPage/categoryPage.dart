import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'category_page_bloc.dart';
import 'package:hp_app/repository/categoryRepository.dart';
import 'category_page_event.dart';
import 'category_page_state.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoryPageBloc(repository: CategoryRepository())..add(LoadCategories()),
      child: Scaffold(
        appBar: AppBar(title: Text('Kategorien')),
        body: BlocBuilder<CategoryPageBloc, CategoryPageState>(
          builder: (context, state) {
            if (state is CategoriesLoading) {
              return Center(child: CircularProgressIndicator());
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
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}