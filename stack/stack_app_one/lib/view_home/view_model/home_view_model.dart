import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeViewModel extends Bloc<HomeEvent, HomeState> {
  HomeViewModel() : super(HomeInitialState()) {
    on<PushSquareEvent>((event, emit) {
      // Yeni karei yığına ekle
      final updatedStack = List<int>.from(state.stack)..add(event.squareId);
      emit(HomeUpdatedState(updatedStack));
    });

    on<PopSquareEvent>((event, emit) {
      // Yığından son kareyi çıkar
      if (state.stack.isNotEmpty) {
        final updatedStack = List<int>.from(state.stack)..removeLast();
        emit(HomeUpdatedState(updatedStack));
      }
    });
  }
}
