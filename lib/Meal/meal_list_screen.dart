import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'meal_bloc.dart';
import 'meal_event.dart';
import 'meal_state.dart';
import 'meal_repository.dart';
import 'meal_detail_screen.dart';

class MealListScreen extends StatelessWidget {
  const MealListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
      ),
      body: BlocProvider(
        create: (context) => MealBloc(MealRepository())..add(FetchMeals()),
        child: BlocBuilder<MealBloc, MealState>(
          builder: (context, state) {
            if (state is MealLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MealLoaded) {
              return ListView.builder(
                itemCount: state.meals.length,
                itemBuilder: (context, index) {
                  final meal = state.meals[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MealDetailScreen(meal: meal),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: Image.network(meal.imageUrl),
                        title: Text(meal.name,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(meal.category),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  );
                },
              );
            } else if (state is MealError) {
              return Center(child: Text(state.message));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
