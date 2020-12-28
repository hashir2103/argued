import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/model/ProfileModel.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> header = {'Authorization': prefs.getString('Token')};
    try {
      Response response = await Dio()
          .get('$kendpoint$kProfile', options: Options(headers: header));
      print("Profile :  ${response.data['data']}");
      // var data  = ProfileModel.fromJson(response.data['data']);
      // return data;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        print(e.request);
        print(e.message);
      }
    }
  }

  editProfile(ProfileModel profileModel) async {
    try {
      Response response =
          await Dio().put('$kendpoint$kProfile', data: profileModel.toJson());
      print(response.data);
      return response.data;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        print(e.request);
        print(e.message);
      }
    }
  }

  checkUesrname(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> header = {'Authorization': prefs.getString('Token')};
    var data = {"username": name};
    try {
      Response response = await Dio().post('$kendpoint$kCheckUsername',
          data: data, options: Options(headers: header));
      return response.data;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        print(e.request);
        print(e.message);
      }
    }
  }
}
