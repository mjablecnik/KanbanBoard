import 'package:vader_app/vader_app.dart';
import 'package:kanban_board_app/entities/user.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class UserState with _$UserState {
  const UserState._();

  const factory UserState.init([User? user]) = UserStateInit;

  const factory UserState.loading() = UserStateLoading;

  const factory UserState.failure(Exception error) = UserStateFailure;

  const factory UserState.success(User user) = UserStateSuccess;

  const factory UserState.loggedIn(User user) = UserStateLoggedIn;

  const factory UserState.loggedOut() = UserStateLoggedOut;
}