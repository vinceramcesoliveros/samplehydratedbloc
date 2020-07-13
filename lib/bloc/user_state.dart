part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserIncompleteState extends UserState {
  final User user;
  const UserIncompleteState(this.user);
  @override
  List<Object> get props => [user];
}

class UserCompleteState extends UserState {
  final User user;
  const UserCompleteState(this.user);
  @override
  List<Object> get props => [user];
}
