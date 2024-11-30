import 'dart:convert';
import 'package:authentication_exam/Repository/APi/api_client.dart';
import 'package:authentication_exam/Repository/Model_Class/Signin_model.dart';
import 'package:authentication_exam/Repository/Model_Class/Signup_model.dart';
import 'package:http/http.dart';


class AuthenticationApi {
  ApiClient apiClient = ApiClient();
//1
  Future<SignupModel> getSignup(String Fullname,String Email,String State,String City ,String Locality,String password  ) async {
    String trendingpath = 'http://45.159.221.50:9890/api/signup';

    print(trendingpath);
    var body ={
    "fullName":Fullname,
    "email":Email,
    "state":State,
    "city":City,
    "locality":Locality,
    "password":password,
};
print(body);
    Response response =
        await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));
       
print(response.body);
    return SignupModel.fromJson(jsonDecode(response.body));
  }
  //2
  Future<SigninModel> getSignin(String Email,String password  ) async {
    String trendingpath = 'http://45.159.221.50:9890/api/signin';

    print(trendingpath);
    var body ={
    "email":Email,
    "password":password,
};
print(body);
    Response response =
        await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));
       
print(response.body);
    return SigninModel.fromJson(jsonDecode(response.body));
  }

 
}