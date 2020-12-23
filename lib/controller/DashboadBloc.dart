import 'package:argued/model/HotTopicModel.dart';
import 'package:rxdart/rxdart.dart';

class DashboardBloc {
  final _hotTopicOfHour = BehaviorSubject<HotTopicModel>();

  //Stream
  Stream<HotTopicModel> get hotTopicOfHour => _hotTopicOfHour.stream;

  //sink
  Function(HotTopicModel) get changeHotTopicOfHour => _hotTopicOfHour.sink.add;

  //dispose
  dispose() {
    _hotTopicOfHour.close();
  }
}
