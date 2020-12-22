import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/controller/AuthBloc.dart';
import 'package:argued/model/loginModel.dart';
import 'package:argued/model/signUpModel.dart';
import 'package:dio/dio.dart';

class AuthServices {
  AuthBloc authBloc = AuthBloc();
  signUp(SignUpModel signUpModel) async {
    try {
      Response response =
          await Dio().post('$kendpoint/$ksignUp', data: signUpModel.toMap());
      print(response.statusCode);
      print(response.statusMessage);
      print(response.headers);
      print(response.data);
    } catch (e) {
      print(e);
    }
  }

  verifyCode(String code) async {
    Response response = await Dio().post('$kendpoint/$kverifyCode');
    print(response);
  }

  login(LoginModel loginModel) async {
    try {
      Response response =
          await Dio().post('$kendpoint/$kLogin', data: loginModel.toMap());
      authBloc.changeResponse(response.data);
      print(response.data);
    } catch (e) {
      print(e);
    }
  }
}
