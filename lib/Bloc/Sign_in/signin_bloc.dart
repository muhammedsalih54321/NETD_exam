import 'package:authentication_exam/Repository/APi/Auth_api/Auth_api.dart';
import 'package:authentication_exam/Repository/Model_Class/Signin_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  late SigninModel signinModel;
  AuthenticationApi authenticationApi=AuthenticationApi();
  SigninBloc() : super(SigninInitial()) {
    on<FetchsigninEvent>((event, emit)async {
     emit(Signinblocloading());
     try {
       signinModel= await authenticationApi.getSignin(event.Email,event.password);
       emit(Signinblocloaded());
     } catch (e) {
       emit(SigninblocError());
     }
    });
  }
}
