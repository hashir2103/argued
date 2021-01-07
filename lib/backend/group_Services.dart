import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/model/groupModel.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GroupService {
  getGroups() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> header = {'Authorization': prefs.getString('Token')};
    try {
      Response response = await Dio()
          .get('$kendpoint$kGroups', options: Options(headers: header));
      print(response.data);
      return GroupModel.fromJson(response.data);
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
