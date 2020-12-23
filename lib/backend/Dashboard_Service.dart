import 'package:argued/ArguedConfigs/constant.dart';
import 'package:dio/dio.dart';

class DashboardServices {
  hotTopicOfHour() async {
    try {
      Response response = await Dio().get('$kendpoint$kHotTopicHour');
      print(response.data);
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}
