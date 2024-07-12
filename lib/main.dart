import 'package:flutter/material.dart';
import 'package:my_app/Meal/meal_list_screen.dart';
import 'package:my_app/Screen/product_list_screen.dart';
import 'package:my_app/Screen/user_form_screen.dart';
import 'package:my_app/Screen/audio_player_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MealListScreen()),
                );
              },
              child: const Text('View Meals'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserFormScreen()),
                );
              },
              child: const Text('User Form'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AudioPlayerScreen()),
                );
              },
              child: const Text('Audio Player'),
            ),
          ],
        ),
      ),
    );
  }
}
