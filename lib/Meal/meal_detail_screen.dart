import 'package:flutter/material.dart';
import 'meal_model.dart';

class MealDetailScreen extends StatelessWidget {
  final Meal meal;

  MealDetailScreen({required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(meal.imageUrl),
            SizedBox(height: 16.0),
            Text(
              meal.name,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              meal.category,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8.0),
            Text(
              meal.instructions,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
