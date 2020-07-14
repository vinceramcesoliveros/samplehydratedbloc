part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();
}

class SaveUserEvent extends UserEvent {
  final User user;
  const SaveUserEvent({this.user});

  @override
  List<Object> get props => [user];
}
