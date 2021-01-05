import 'package:argued/backend/watchList_Service.dart';
import 'package:argued/model/WatchListModel.dart';
import 'package:rxdart/rxdart.dart';

class WatchListBloc {
  //varaibles
  final watchListService = WatchListService();
  final _watchList = BehaviorSubject<WatchListModel>();
  final _searchQuery = BehaviorSubject<String>();

  //streams
  Stream<WatchListModel> get watchList => _watchList.stream;
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
    changeWatchList(data);
  }
}
