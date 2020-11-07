part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class TodosLoaded extends TodosEvent {}

class TodoAdded extends TodosEvent {
  final Todo todo;

  const TodoAdded(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() {
    return 'TodoAdded { todo: $todo }';
  }
}

class TodoUpdated extends TodosEvent {
  final Todo todo;

  TodoUpdated(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() {
    return 'TodoUpdated { todo: $todo }';
  }
}

class TodoDeleted extends TodosEvent {
  final Todo todo;

  TodoDeleted(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() {
    return 'TodoDeleted { todo: $todo }';
  }
}

class ClearCompleted extends TodosEvent {}

class ToggleAll extends TodosEvent {}
