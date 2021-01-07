import 'package:argued/backend/group_Services.dart';
import 'package:argued/model/groupModel.dart';
import 'package:rxdart/rxdart.dart';

class GroupBloc {
  //variables
  final groupServices = GroupService();
  final _searchQuery = BehaviorSubject<String>();
  final _groups = BehaviorSubject<GroupModel>();

  //streams
  Stream<String> get searchQuery => _searchQuery.stream;
  Stream<GroupModel> get groups => _groups.stream;

  //sinks
  Function(String) get changeSearchQuery => _searchQuery.sink.add;
  Function(GroupModel) get changeGroups => _groups.sink.add;

  //dispose
  dispose() {
    _searchQuery.close();
    _groups.close();
  }

  //FUNC
  getGroups() async {
    _groups.addError("loading");
    var data = await groupServices.getGroups();
    _groups.add(data);
  }
}
