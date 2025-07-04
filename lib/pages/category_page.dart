import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/get_question.dart';
import '../bloc/blocs/category_bloc.dart';
import '../bloc/events/category_event.dart';
import '../bloc/states/category_state.dart';
import 'package:hp_app/repository/get_category_list_repository.dart';
import '../widgets/navigation/navigation_cubit.dart';
import 'category_question_page.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final bloc = CategoryPageBloc(
          repository: CategoryRepository(),
          questionRepository: GetQuestionRepository(),
        );
        bloc.add(LoadCategories());
        return bloc;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Kategorien')),
        body: BlocBuilder<NavigationCategory, NavigationCategoryState>(
          builder: (context, navState) {
            if (navState.menu == HomeMenuItem.selectedCategory &&
                navState.categoryId != null) {
              return CategoryQuestionPage(catID: navState.categoryId!);
            }
            return BlocBuilder<CategoryPageBloc, CategoryState>(
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
                        onTap: () => context
                            .read<NavigationCategory>()
                            .selectCategory(cat.id),
                      );
                    },
                  );
                } else if (state is CategoriesError) {
                  return Center(child: Text('Fehler: ${state.message}'));
                }
                return const SizedBox.shrink();
              },
            );
          },
        ),
      ),
    );
  }
}
