import 'dart:async';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:sampleform_bloc/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends HydratedBloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is SaveUserEvent) {
      yield UserCompleteState(event.user);
    }
  }

  @override
  UserState fromJson(Map<String, Object> json) {
    if (json == null) {
      return UserInitial();
    } else if (json['complete'] as bool ?? false) {
      return UserCompleteState(
        User.fromJson(Map<String, dynamic>.from(json['user'] as Map)),
      );
    } else {
      return UserIncompleteState(
        User.fromJson(Map<String, dynamic>.from(json['user'] as Map)),
      );
    }
  }

  @override
  Map<String, Object> toJson(UserState state) {
    if (state is UserIncompleteState) {
      return {
        'complete': false,
        'user': state.user.toJson(),
      };
    }
    if (state is UserCompleteState) {
      return {
        'complete': true,
        'user': state.user.toJson(),
      };
    }
    return null;
  }
}
