import 'dart:async';

import 'package:argued/backend/Profile_Services.dart';
import 'package:argued/model/ProfileModel.dart';
import 'package:rxdart/rxdart.dart';

class ProfileBloc {
  //varaible
  ProfileService profileService = ProfileService();
  final _profile = BehaviorSubject<ProfileModel>();
  final _salutation = BehaviorSubject<String>.seeded('Mr.');
  final _username = BehaviorSubject<String>();
  final _firstname = BehaviorSubject<String>();
  final _lastname = BehaviorSubject<String>();
  final _dob = BehaviorSubject<DateTime>();
  final _phoneNo = BehaviorSubject<String>();
  final _phoneCode = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _confirmPassword = BehaviorSubject<String>();
  final _country = BehaviorSubject<String>.seeded('Pakistan');
  final _currency = BehaviorSubject<String>.seeded('Pakistani rupee');
  final _maritalStatus = BehaviorSubject<String>.seeded('Single');
  final _religion = BehaviorSubject<String>.seeded('Islam');
  final _occupation =
      BehaviorSubject<String>.seeded("Agriculture, Food and Natural Resources");
  final _hideText = BehaviorSubject<bool>.seeded(true);
  final _showMyOccupation = BehaviorSubject<bool>.seeded(false);
  final _geographicalInterest = BehaviorSubject<bool>.seeded(true);

  //Stream
  Stream<bool> get hideText => _hideText.stream;
  Stream<String> get salutation => _salutation.stream;
  Stream<String> get username => _username.stream;
  Stream<String> get firstname => _firstname.stream;
  Stream<String> get lastname => _lastname.stream;
  Stream<String> get phoneNo => _phoneNo.stream.transform(phoneNoValidator);
  Stream<String> get phoneCode => _phoneCode.stream;
  Stream<String> get country => _country.stream;
  Stream<String> get currency => _currency.stream;
  Stream<String> get occupation => _occupation.stream;
  Stream<String> get religion => _religion.stream;
  Stream<String> get maritalStatus => _maritalStatus.stream;
  Stream<DateTime> get dob => _dob.stream;
  Stream<String> get password => _password.stream.transform(passwordValidator);
  Stream<String> get confirmPassword =>
      _confirmPassword.stream.transform(passwordValidator);
  Stream<ProfileModel> get profile => _profile.stream;
  Stream<bool> get showMyOccupation => _showMyOccupation.stream;
  Stream<bool> get showGeographicalInterest => _geographicalInterest.stream;
  Stream<bool> get isValidProfile =>
      CombineLatestStream.combine3(username,password,phoneNo, (a, b,c) => true);

  //sink
  Function(bool) get changeHideText => _hideText.sink.add;
  Function(String) get changeSalutation => _salutation.sink.add;
  Function(String) get changeUsername => _username.sink.add;
  Function(String) get changefirstname => _firstname.sink.add;
  Function(String) get changeLastName => _lastname.sink.add;
  Function(String) get changePhoneNo => _phoneNo.sink.add;
  Function(String) get changePhoneCode => _phoneCode.sink.add;
  Function(String) get changePassword => _password.sink.add;
  Function(String) get changeCountry => _country.sink.add;
  Function(String) get changeCurrency => _currency.sink.add;
  Function(String) get changeOccupation => _occupation.sink.add;
  Function(String) get changeReligion => _religion.sink.add;
  Function(String) get changeMaritalStatus => _maritalStatus.sink.add;
  Function(String) get changeConfrimPassword => _confirmPassword.sink.add;
  Function(DateTime) get changeDOB => _dob.sink.add;
  Function(ProfileModel) get changeProfile => _profile.sink.add;
  Function(bool) get changeShowMyOccupation => _showMyOccupation.sink.add;
  Function(bool) get changeGeographicalInterest =>
      _geographicalInterest.sink.add;

  //dispose
  dispose() {
    _occupation.close();
    _religion.close();
    _maritalStatus.close();
    _country.close();
    _currency.close();
    _phoneCode.close();
    _hideText.close();
    _salutation.close();
    _username.close();
    _firstname.close();
    _lastname.close();
    _phoneNo.close();
    _dob.close();
    _confirmPassword.close();
    _password.close();
    _showMyOccupation.close();
    _geographicalInterest.close();
    _profile.close();
  }

  //validator
  final passwordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])';
    RegExp regExp = new RegExp(pattern);
    if (password.length >= 8 && regExp.hasMatch(password)) {
      sink.add(password.trim());
    } else {
      sink.addError("8 Characters Minimun and a Uppercase Letter");
    }
  });
  final phoneNoValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (phoneNo, sink) async {
    if (phoneNo.length >= 10) {
      sink.add(phoneNo.trim());
    } else {
      sink.addError("Invalid Phone No.");
    }
  });

  //Functions
  bool get getHideText => _hideText.value;
  String get pass => _password.value;
  String get confirmpass => _confirmPassword.value;

  getProfile() async {
    var data = await profileService.getProfile();
    changeProfile(data);
  }

  editProfile() async {
    var profileModel = ProfileModel(
      salutation: _salutation.value,
      username: _username.value,
    
    );
    await profileService.editProfile(profileModel);
  }


  checkUserName() async {
    var response = await profileService.checkUesrname(_username.value ?? '');
    if (response['code'] != 200) {
      _username.addError("error");
    }
  }
}
