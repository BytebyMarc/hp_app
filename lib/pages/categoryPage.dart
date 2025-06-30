import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/getQuestion.dart';
import '../bloc/blocs/category_page_bloc.dart';
import '../bloc/events/category_page_event.dart';
import '../bloc/states/category_page_state.dart';
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
              final selectedIndex = state.selectedAnswerIndex;
              final isAnswered = state.isAnswered;
              return SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(state.question.question, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 16),
                  ...List.generate(state.question.answers.length, (i) {
                    Color borderColor = Colors.black;
                    Color backgroundColor = Colors.white;
                    if (isAnswered && selectedIndex == i) {
                      backgroundColor = (i == state.question.right)
                          ? Colors.green
                          : Colors.red;
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: GestureDetector(
                        onTap: () =>
                            context.read<CategoryPageBloc>().add(AnswerQuestion(i)),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: borderColor, width: 2),
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            state.question.answers[i],
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 24),
                   ElevatedButton(
                    onPressed: isAnswered
                         ? () => context.read<CategoryPageBloc>().add(NextQuestion())
                      : null,
                    child: const Text('Nächste Frage'),
                   ),
                ],
                  )
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


