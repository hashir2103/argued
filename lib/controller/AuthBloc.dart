import 'dart:async';

import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/backend/auth_Services.dart';
import 'package:argued/main.dart';
import 'package:argued/model/LoginResponseModal.dart';
import 'package:argued/model/loginModel.dart';
import 'package:argued/model/signUpModel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc {
  AuthBloc() {
    {
      _username
          .debounce((_) => TimerStream(true, Duration(milliseconds: 500)))
          .listen((query) async {
        var response = await authServices.checkUesrname(query);
        if (response['code'] == 200) {
          _username.addError("error");
        }
        _username.add(query);
      });
    }
  }
  final authServices = AuthServices();
  final _pin1 = BehaviorSubject<String>();
  final _pin2 = BehaviorSubject<String>();
  final _pin3 = BehaviorSubject<String>();
  final _pin4 = BehaviorSubject<String>();
  final _fname = BehaviorSubject<String>();
  final _lname = BehaviorSubject<String>();
  final _username = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _confirmPassword = BehaviorSubject<String>();
  final _rememberMe = BehaviorSubject<bool>.seeded(false);
  final _loginPress = BehaviorSubject<bool>.seeded(false);
  final _hideText = BehaviorSubject<bool>.seeded(true);
  final _resetCredential = BehaviorSubject<bool>.seeded(true);
  final _response = BehaviorSubject<Map>();
  final _loginResponse = BehaviorSubject<LoginResponse>();

  //getter

  Stream<Map> get response => _response.stream;
  Stream<LoginResponse> get loginResponse => _loginResponse.stream;
  Stream<bool> get hideText => _hideText.stream;
  Stream<bool> get resetCredential => _resetCredential.stream;
  Stream<bool> get rememberMe => _rememberMe.stream;
  Stream<bool> get loginPress => _loginPress.stream;
  Stream<String> get username => _username.stream;
  Stream<String> get fname => _fname.stream;
  Stream<String> get lname => _lname.stream;
  Stream<String> get email => _email.stream.transform(emailValidator);
  Stream<String> get password => _password.stream.transform(passwordValidator);
  Stream<String> get confirmPassword =>
      _confirmPassword.stream.transform(passwordValidator);
  Stream<bool> get isValidSignUp =>
      CombineLatestStream.combine2(email, password, (a, b) => true);
  Stream<bool> get isValidLogin =>
      CombineLatestStream.combine2(username, password, (a, b) => true);

  // Setter

  Function(bool) get changeRememberMe => _rememberMe.sink.add;
  Function(LoginResponse) get changeLoginResponse => _loginResponse.sink.add;
  Function(bool) get changeHideText => _hideText.sink.add;
  Function(bool) get changeResetCredential => _resetCredential.sink.add;
  Function(bool) get changeLoginPress => _loginPress.sink.add;
  Function(Map) get changeResponse => _response.sink.add;
  Function(String) get changePin1 => _pin1.sink.add;
  Function(String) get changePin2 => _pin2.sink.add;
  Function(String) get changePin3 => _pin3.sink.add;
  Function(String) get changePin4 => _pin4.sink.add;
  Function(String) get changeusername => _username.sink.add;
  Function(String) get changefname => _fname.sink.add;
  Function(String) get changelname => _lname.sink.add;
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;
  Function(String) get changeConfirmPassword => _confirmPassword.sink.add;

  dispose() {
    _loginResponse.close();
    _resetCredential.close();
    _hideText.close();
    _username.close();
    _response.close();
    _pin1.close();
    _pin2.close();
    _pin3.close();
    _pin4.close();
    _fname.close();
    _lname.close();
    _email.close();
    _password.close();
    _confirmPassword.close();
    _rememberMe.close();
    _loginPress.close();
  }

  //Tranformer of stream to validate data
  //email.trim() to pull out any extra spacesother
  final emailValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (emailValidatorRegExp.hasMatch(email.trim())) {
      sink.add(email.trim());
    } else {
      sink.addError("Please Enter A Valid Email");
    }
  });

  final passwordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 8) {
      sink.add(password.trim());
    } else {
      sink.addError("8 Characters Minimun and a Uppercase Letter");
    }
  });

  final confirmPasswordValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (pass, sink) {
    if (pass == AuthBloc()._password.value) {
      sink.add(pass.trim());
    } else {
      sink.addError("Password Do not Match");
    }
  });

  //functions

  String get getloginToken {
    return _loginResponse.value.token;
  }

  Map get responseValue {
    return _response.value;
  }

  Future signUp() async {
    changeusername(_email.value.split("@")[0]);
    var signUpModel = SignUpModel(
      email: _email.value,
      password: _password.value,
      username: _username.value.trim(),
      firstname: _fname.value.trim(),
      lastname: _lname.value.trim(),
    );
    var response = await authServices.signUp(signUpModel);
    changeResponse(response);
  }

  verifyCode() async {
    String code = '${_pin1.value}${_pin2.value}${_pin3.value}${_pin4.value}';
    String id = _response.value['data']['_id'];
    var response = await authServices.verifyCode(code, id);
    authBloc.changeResponse(response);
    print('Code : $code, Id : $id');
  }

  login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var loginModel =
        LoginModel(username: _username.value, password: _password.value.trim());
    var response = await authServices.login(loginModel);
    if (response['code'] == 200) {
      var l = LoginResponse.fromJson(response['data']);
      changeLoginResponse(l);
      prefs.setString('Token', _loginResponse.value.token);
    }
    // print(response);
    changeResponse(response);
  }

  resetUserCredential(bool isPass) async {
    var response =
        await authServices.resetCredential(isPass, _email.value.trim());
    changeResponse(response);
  }
}
