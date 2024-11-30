import 'package:authentication_exam/Repository/APi/Auth_api/Auth_api.dart';
import 'package:authentication_exam/Repository/Model_Class/Signup_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  late SignupModel signupModel;
  AuthenticationApi authenticationApi=AuthenticationApi();
  SignupBloc() : super(SignupInitial()) {
    on<FetchsignupEvent>((event, emit)async {
   emit(Signupblocloading());
   try {
    
     signupModel=await authenticationApi.getSignup(event.Fullname,event.Email,event.State,event.City,event.Locality,event.password);
      emit(Signupblocloaded());
   } catch (e) {
     emit(SignupblocError());
   }
    });
  }
}
