abstract class HomeEvent {}

class PushSquareEvent extends HomeEvent {
  final int squareId;

  PushSquareEvent(this.squareId);
}

class PopSquareEvent extends HomeEvent {}
