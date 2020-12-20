import 'dart:async';

import 'package:argued/ArguedConfigs/constant.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc {
  final _fname = BehaviorSubject<String>();
  final _lname = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _confirmPassword = BehaviorSubject<String>();
  final _rememberMe = BehaviorSubject<bool>.seeded(false);
  
  //getter

  Stream<bool> get rememberMe => _rememberMe.stream;
  Stream<String> get fname => _fname.stream;
  Stream<String> get lname => _lname.stream;
  Stream<String> get email => _email.stream.transform(emailValidator);
  Stream<String> get password => _password.stream.transform(passwordValidator);
  Stream<String> get confirmPassword =>
      _confirmPassword.stream.transform(confirmPasswordValidator);
  Stream<bool> get isValidSignUp => CombineLatestStream.combine3(
      email, password, confirmPassword, (a, b, c) => true);
  Stream<bool> get isValidLogin =>
      CombineLatestStream.combine2(email, password, (a, b) => true);

  // Setter
  Function(bool) get changeRememberMe => _rememberMe.sink.add;
  Function(String) get changefname => _fname.sink.add;
  Function(String) get changelname => _lname.sink.add;
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;
  Function(String) get changeConfirmPassword => _confirmPassword.sink.add;

  dispose() {
    _fname.close();
    _lname.close();
    _email.close();
    _password.close();
    _confirmPassword.close();
    _rememberMe.close();
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
      sink.addError("8 Characters Minimum");
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

  String get pass {
    return _password.value;
  }

  //functions
  signUp() async {}
  login() async {}

  // loginEmail() async {
  //   print('Login User');
  //   try {
  //     UserCredential userCredential = await _auth.signInWithEmailAndPassword(
  //         email: _email.value.trim(), password: _password.value.trim());
  //     var user = await _service.fetchUser(userCredential.user.uid);
  //     _user.sink.add(user);
  //   } catch (error) {
  //     _errorMessage.sink.add(error.message);
  //   }
  // }

  // Future<bool> isLoggedIn() async {
  //   User firbaseUser = _auth.currentUser;
  //   if (firbaseUser == null) return false;

  //   var user = await _service.fetchUser(firbaseUser.uid);
  //   if (user == null) return false;

  //   // print(user.email);
  //   _user.sink.add(user);
  //   return true;
  // }

  // logOut() async {
  //   await _auth.signOut();
  //   _user.sink.add(null);
  // }
}
