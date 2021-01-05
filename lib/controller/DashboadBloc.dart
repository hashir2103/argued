import 'package:argued/backend/Dashboard_Service.dart';
import 'package:argued/model/HotTopicModel.dart';
import 'package:argued/model/opnionModel.dart';
import 'package:rxdart/rxdart.dart';

class DashboardBloc {
  //varaible
  DashboardServices dashboardServices = DashboardServices();
  List<OpinionData> opinionList = List<OpinionData>();
  final _hotTopicOfHour = BehaviorSubject<HotTopicModel>();
  final _mostWatched = BehaviorSubject<OpinionModel>();
  final _interestingToYou = BehaviorSubject<List<OpinionData>>();
  final _rating = BehaviorSubject<double>.seeded(55.0);

  final _isLoading = BehaviorSubject<bool>.seeded(false);
  final pageNo = BehaviorSubject<int>.seeded(1);

  //Stream

  Stream<HotTopicModel> get hotTopicOfHour => _hotTopicOfHour.stream;
  Stream<OpinionModel> get mostWatched => _mostWatched.stream;
  Stream<List<OpinionData>> get interestingToYou => _interestingToYou.stream;
  Stream<double> get rating => _rating.stream;
  Stream<bool> get isLoading => _isLoading.stream;
  Stream<int> get pageNumber => pageNo.stream;

  //sink

  Function(HotTopicModel) get changeHotTopicOfHour => _hotTopicOfHour.sink.add;
  Function(OpinionModel) get changeHotMostWatched => _mostWatched.sink.add;
  Function(List<OpinionData>) get changeInterestingToYou =>
      _interestingToYou.sink.add;
  Function(double) get changeRating => _rating.sink.add;
  Function(bool) get changeIsLoading => _isLoading.sink.add;
  Function(int) get changePageNum => pageNo.sink.add;

  //dispose
  dispose() {
    pageNo.close();
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

  getInterestingToYou() async {
    OpinionModel data =
        await dashboardServices.interestingToYou(pageNo.value.toString());
    print("==========${pageNo.value}==============");

    print("opinon List ===> ${opinionList.length}");
    print("new response : ${data.message}");
    changeInterestingToYou(opinionList);
  }

  postRating(opinionId, stand) {
    var rating = {
      "rating": _rating.value.toString().split('.')[0],
      "stand": stand
    };
    dashboardServices.ratingOpinion(opinionId, rating);
  }

  int get getPageNo => pageNo.value;
}
