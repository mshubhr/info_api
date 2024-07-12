import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'meal_bloc.dart';
import 'meal_event.dart';
import 'meal_state.dart';
import 'meal_model.dart';
import 'meal_repository.dart';
import 'meal_detail_screen.dart';

class MealListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
      ),
      body: BlocProvider(
        create: (context) => MealBloc(MealRepository())..add(FetchMeals()),
        child: BlocBuilder<MealBloc, MealState>(
          builder: (context, state) {
            if (state is MealLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is MealLoaded) {
              return ListView.builder(
                itemCount: state.meals.length,
                itemBuilder: (context, index) {
                  final meal = state.meals[index];
                  return ListTile(
                    title: Text(meal.name),
                    subtitle: Text(meal.category),
                    leading: Image.network(meal.imageUrl),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MealDetailScreen(meal: meal),
                        ),
                      );
                    },
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
