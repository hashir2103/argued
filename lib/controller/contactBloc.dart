import 'package:argued/backend/contact_service.dart';
import 'package:argued/model/contactModel.dart';
import 'package:rxdart/rxdart.dart';

class ContactBloc {
  //variable
  ContactService contactService = ContactService();
  final _contact = BehaviorSubject<ContactModel>();
  final _searchQuery = BehaviorSubject<String>();
  //Streams
  Stream<ContactModel> get contact => _contact.stream;
  Stream<String> get searchQuery => _searchQuery.stream;

  //Sink
  Function(ContactModel) get changeContact => _contact.sink.add;
  Function(String) get changeSearchQuery => _searchQuery.sink.add;

  //dispose
  dispose() {
    _searchQuery.close();
    _contact.close();
  }

  //func
  getContact() async {
    var data = await contactService.getContact();
    changeContact(data);
  }
}
