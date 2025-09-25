import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository _userrepository;

  SignInBloc(this._userrepository) : super(SignInInitial()) {
    on<SignInRequired>((event, emit) async {
      emit(SignInLoading());
      try {
        await _userrepository.signIn(event.email, event.password);
      } catch (e) {
        emit(SignInFailure());
      }
    });
    on<SignOutRequired>((event, emit) async => await _userrepository.logOut());
  }
}
