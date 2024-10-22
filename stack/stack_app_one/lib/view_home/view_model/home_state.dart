abstract class HomeState {
  List<int> get stack => [];
}

class HomeInitialState extends HomeState {}

class HomeUpdatedState extends HomeState {
  final List<int> updatedStack;

  HomeUpdatedState(this.updatedStack);

  @override
  List<int> get stack => updatedStack;
}
