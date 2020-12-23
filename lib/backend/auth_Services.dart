import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/model/loginModel.dart';
import 'package:argued/model/signUpModel.dart';
import 'package:dio/dio.dart';

class AuthServices {
  signUp(SignUpModel signUpModel) async {
    try {
      Response response =
          await Dio().post('$kendpoint/$ksignUp', data: signUpModel.toMap());
      print(response.data);
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  verifyCode(String code, String id) async {
    try {
      Response response = await Dio().post('$kendpoint/$kverifyCode/$id',
          data: {"verificationCode": code});
      print(response);
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  login(LoginModel loginModel) async {
    try {
      Response response =
          await Dio().post('$kendpoint/$kLogin', data: loginModel.toMap());
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  resetCredential(bool password, String email) async {
    String url =
        password ? kendpoint + kforgotPassword : kendpoint + kforgotUsername;
    var data = {"email": email};
    try {
      Response response = await Dio().post(url, data: data);
      print(response.data);
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}
