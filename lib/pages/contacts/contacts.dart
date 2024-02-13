import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:sewoch/pages/chat_pages/widgets/chat_item_widget.dart';
import 'package:sewoch/pages/contacts/contact_detail_page.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});
  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  List<Contact>? _contacts;
  List<String> _contactNumber=[];
  bool _permissionDenied = false;
  @override
  void initState() {
    super.initState();
    _fetchContacts();

  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts();
      setState(() => {
        _contacts = contacts,

      });


    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body(),);
  }

  Widget _body() {
    if (_permissionDenied) return Center(child: Text('Permission denied'));
    if (_contacts == null) return Center(child: CircularProgressIndicator());
    return customScrolView(_contacts);


  }}

//void goto

Widget customScrolView(List<Contact>? userList)  {

  print('conatct Length: ${userList!.length}');
  //print('Indexed Value: ${userList![56]}');
  return CustomScrollView(
    //physics: const NeverScrollableScrollPhysics(),
    slivers: <Widget>[
      SliverList(
          delegate: SliverChildBuilderDelegate(
              childCount: userList?.length,
                  (BuildContext context, int index)   {
                return  phoneContactWidget(
                   onTapFunc: () async {
                     final fullContact =  await FlutterContacts.getContact(userList[index].id);
                    // id=fullContact!.phones.first.number;
                     Navigator.of(context).push(
                         MaterialPageRoute(builder: (context)=> ContactDetailPage(fullContact!))
                     );
                   },
                    username: userList?[index].displayName,
                    id:userList?[index].id ,//userList![index].phones.isEmpty?'No Number':userList?[index].phones.first.number,
                    isOnline: false);
              }))
    ],
  );

}