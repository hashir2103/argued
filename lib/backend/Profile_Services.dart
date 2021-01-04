import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/model/ProfileModel.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  void printWrapped(String text,int length) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> header = {'Authorization': prefs.getString('Token')};
    try {
      Response response = await Dio()
          .get('$kendpoint$kProfile', options: Options(headers: header));
      printWrapped("Profile :  ${response.data['data']}",response.data.toString().length);
      // debugPrint("Profile :  ${response.data['data'].toString()}");
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
      // return response.data;
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
