part of 'signup_bloc.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}
class Signupblocloading extends SignupState{}
class Signupblocloaded extends SignupState{}
class SignupblocError extends SignupState{}
