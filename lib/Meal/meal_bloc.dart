import 'package:flutter_bloc/flutter_bloc.dart';
import 'meal_repository.dart';
import 'meal_event.dart';
import 'meal_state.dart';

class MealBloc extends Bloc<MealEvent, MealState> {
  final MealRepository mealRepository;

  MealBloc(this.mealRepository) : super(MealInitial()) {
    on<FetchMeals>((event, emit) async {
      emit(MealLoading());
      try {
        final meals = await mealRepository.fetchMeals();
        emit(MealLoaded(meals));
      } catch (e) {
        emit(MealError(e.toString()));
      }
    });
  }
}
