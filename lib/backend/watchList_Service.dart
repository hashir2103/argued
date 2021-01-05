import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/model/WatchListModel.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WatchListService {
  void printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  getWatchList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> header = {'Authorization': prefs.getString('Token')};
    print(prefs.getString('Token'));
    try {
      Response response = await Dio().get('$kendpoint$kProfile?populate=true',
          options: Options(headers: header));
      printWrapped("Respons========> ${response.data.toString()}");
      return WatchListModel.fromJson(response.data);
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
