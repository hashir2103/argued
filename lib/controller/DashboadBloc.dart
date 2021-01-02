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

  final _countries = BehaviorSubject<Set<String>>();
  final _state = BehaviorSubject<Set<String>>();
  final _cities = BehaviorSubject<Set<String>>();
  final _isLoading = BehaviorSubject<bool>.seeded(false);

  //Stream
  Stream<Set<String>> get countries => _countries.stream;
  Stream<Set<String>> get states => _state.stream;
  Stream<Set<String>> get cities => _cities.stream;

  Stream<HotTopicModel> get hotTopicOfHour => _hotTopicOfHour.stream;
  Stream<List<OpinionModel>> get mostWatched => _mostWatched.stream;
  Stream<List<OpinionModel>> get interestingToYou => _interestingToYou.stream;
  Stream<double> get rating => _rating.stream;
  Stream<bool> get isLoading => _isLoading.stream;

  //sink
  Function(Set<String>) get changeCountries => _countries.sink.add;
  Function(Set<String>) get changeStates => _state.sink.add;
  Function(Set<String>) get changeCities => _cities.sink.add;

  Function(HotTopicModel) get changeHotTopicOfHour => _hotTopicOfHour.sink.add;
  Function(List<OpinionModel>) get changeHotMostWatched =>
      _mostWatched.sink.add;
  Function(List<OpinionModel>) get changeInterestingToYou =>
      _interestingToYou.sink.add;
  Function(double) get changeRating => _rating.sink.add;
  Function(bool) get changeIsLoading => _isLoading.sink.add;

  //dispose
  dispose() {
    _isLoading.close();
    _cities.close();
    _countries.close();
    _state.close();
    _interestingToYou.close();
    _mostWatched.close();
    _rating.close();
    _hotTopicOfHour.close();
  }

  //Functions
  Set<String> getCountriesSelected() {
    return _countries.value;
  }

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

  getCountries() async {
    await dashboardServices.getCountry();
  }

  getStates() async {
    await dashboardServices.getStates(_countries.value.toList()[0]);
  }
}
