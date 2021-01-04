import 'package:argued/backend/Dashboard_Service.dart';
import 'package:argued/model/HotTopicModel.dart';
import 'package:argued/model/opnionModel.dart';
import 'package:rxdart/rxdart.dart';

class DashboardBloc {
  //varaible
  DashboardServices dashboardServices = DashboardServices();
  List<OpinionModel> opinionList = List<OpinionModel>();
  final _hotTopicOfHour = BehaviorSubject<HotTopicModel>();
  final _mostWatched = BehaviorSubject<List<OpinionModel>>();
  final _interestingToYou = BehaviorSubject<List<OpinionModel>>();
  final _rating = BehaviorSubject<double>.seeded(55.0);

  final _isLoading = BehaviorSubject<bool>.seeded(false);
  final _index = BehaviorSubject<int>.seeded(1);

  //Stream

  Stream<HotTopicModel> get hotTopicOfHour => _hotTopicOfHour.stream;
  Stream<List<OpinionModel>> get mostWatched => _mostWatched.stream;
  Stream<List<OpinionModel>> get interestingToYou => _interestingToYou.stream;
  Stream<double> get rating => _rating.stream;
  Stream<bool> get isLoading => _isLoading.stream;
  Stream<int> get index => _index.stream;

  //sink

  Function(HotTopicModel) get changeHotTopicOfHour => _hotTopicOfHour.sink.add;
  Function(List<OpinionModel>) get changeHotMostWatched =>
      _mostWatched.sink.add;
  Function(List<OpinionModel>) get changeInterestingToYou =>
      _interestingToYou.sink.add;
  Function(double) get changeRating => _rating.sink.add;
  Function(bool) get changeIsLoading => _isLoading.sink.add;
  Function(int) get changeIndex => _index.sink.add;

  //dispose
  dispose() {
    _index.close();
    _isLoading.close();
    _interestingToYou.close();
    _mostWatched.close();
    _rating.close();
    _hotTopicOfHour.close();
  }

  //Functions

  getHotTopicOfHour() async {
    HotTopicModel data = await dashboardServices.hotTopicOfHour();
    changeHotTopicOfHour(data);
  }

  getMostWatchedTopic() async {
    var data = await dashboardServices.mostWatchedTopic();
    changeHotMostWatched(data);
  }

  getInterestingToYou(pageNo) async {
    List<OpinionModel> data = await dashboardServices.interestingToYou(pageNo);
    opinionList.addAll(data);
    changeInterestingToYou(opinionList);
  }

  postRating(opinionId, stand) {
    var rating = {
      "rating": _rating.value.toString().split('.')[0],
      "stand": stand
    };
    dashboardServices.ratingOpinion(opinionId, rating);
  }
}
