import 'package:argued/backend/watchList_Service.dart';
import 'package:argued/model/WatchListModel.dart';
import 'package:argued/model/userOpininonModel.dart';
import 'package:rxdart/rxdart.dart';

class WatchListBloc {
  //varaibles
  final watchListService = WatchListService();
  final _watchList = BehaviorSubject<WatchListModel>();
  final _userOpinion = BehaviorSubject<UserOpinion>();
  final _searchQuery = BehaviorSubject<String>();

  //streams
  Stream<WatchListModel> get watchList => _watchList.stream;
  Stream<UserOpinion> get userOpinon => _userOpinion.stream;
  Stream<String> get searchQuery => _searchQuery.stream;

  //sink
  Function(WatchListModel) get changeWatchList => _watchList.sink.add;
  Function(String) get changeSearchQuery => _searchQuery.sink.add;

  //dispose
  dispose() {
    _searchQuery.close();
    _watchList.close();
  }

  //func
  getWatchList() async {
    var data = await watchListService.getWatchList();
    if (data['data'] != null || data['data'] != []) {
      var o = WatchListModel.fromJson(data);
      changeWatchList(o);
    } else {
      _watchList.addError('Disable');
    }
  }

  getProfileOpinion(String userId) async {
    var data = await watchListService.getUserOpinion(userId);
    if (data['data'] != null || data['data'] != []) {
      var o = UserOpinion.fromJson(data);
      _userOpinion.add(o);
    } else {
      _userOpinion.addError('Disable');
    }
  }
}
