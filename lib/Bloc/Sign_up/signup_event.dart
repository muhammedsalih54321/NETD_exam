part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

class FetchsignupEvent extends SignupEvent {
  final String Fullname;
  final String Email;
  final String State;
  final String City;
  final String Locality;
  final String password;

  FetchsignupEvent(
      {required this.Fullname,
      required this.Email,
      required this.State,
      required this.City,
      required this.Locality,
      required this.password});
}
