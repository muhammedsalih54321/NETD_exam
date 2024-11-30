part of 'signin_bloc.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}
class Signinblocloading extends SigninState{}
class Signinblocloaded extends SigninState{}
class SigninblocError extends SigninState{}
