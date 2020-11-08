part of 'stats_bloc.dart';

abstract class StatsEvent extends Equatable {
  const StatsEvent();

  @override
  List<Object> get props => [];
}

class StatsUpdated extends StatsEvent {
  final List<Todo> todos;

  StatsUpdated(this.todos);

  @override
  List<Object> get props => [todos];

  @override
  String toString() {
    return 'StatsUpdated { todos: $todos }';
  }
}
