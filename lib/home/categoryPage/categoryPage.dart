import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/getQuestion.dart';
import 'category_page_bloc.dart';
import 'category_page_event.dart';
import 'category_page_state.dart';
import 'package:hp_app/repository/categoryRepository.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

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
                    onTap: () => context.read<CategoryPageBloc>().add(
                      SelectCategory(cat.id),
                    ),
                  );
                },
              );
            } else if (state is CategorySelected) {
              return
              // Center(child: Text('${state.question.answer2}'),);
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    state.question.question,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  ...List.generate(4, (i) {
                    Color borderColor = Colors.grey;
                    if (_isAnswered && _selectedIndex == i) {
                      if (i == state.question.right) {
                        borderColor = Colors.green;
                      } else {
                        borderColor = Colors.red;
                      }
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: GestureDetector(
                        onTap: () => _onAnswerTap(i),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: borderColor, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            state.question.answers[i],
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _isAnswered ? state.question.onNext : null,
                    child: const Text('Nächste Frage'),
                  ),
                ],
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


