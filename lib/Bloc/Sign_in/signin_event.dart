part of 'signin_bloc.dart';

@immutable
sealed class SigninEvent {}
class FetchsigninEvent extends SigninEvent{
    final String Email;
  final String password;

  FetchsigninEvent({required this.Email, required this.password});
}