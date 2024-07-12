// ignore_for_file: file_names

import 'package:equatable/equatable.dart';

abstract class MealEvent extends Equatable {
  const MealEvent();

  @override
  List<Object> get props => [];
}

class FetchMeals extends MealEvent {}
