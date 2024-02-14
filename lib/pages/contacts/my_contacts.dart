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
  //List<Contact> _contacts = [];

  bool _permissionDenied = false;
  @override
  void initState() {
    super.initState();
    //_loadContacts();
    _fetchContacts();
  }
  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts();
      setState(() => _contacts = contacts,);
    }
  }

  // Future<void> _loadContacts() async {
  //   Iterable<Contact> contacts = await ContactsService.getContacts();
  //   setState(() {
  //     _contacts = contacts.toList();
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body(),);
  }
  Widget _body() {
    if (_permissionDenied) return const Center(child: Text('Permission denied'));
    if (_contacts == null) return const Center(child: CircularProgressIndicator());
    return customScrolView(_contacts);
  }}
Widget customScrolView(List<Contact>? userList)  {
  return CustomScrollView(
    //physics: const NeverScrollableScrollPhysics(),
    slivers: <Widget>[
      SliverList(
          delegate: SliverChildBuilderDelegate(
              childCount: userList!.length,
                  (BuildContext context, int index)  {
                    // Contact contact=Contact();
                  //  Contact contact=[];
                    //=() async {
                  // final Contact contact=cont!;
                      //return cont!;
                   // } as Contact;

                  final fullacontact  =  (() async {
                    // Your asynchronous operations go here
                    // await Future.delayed(Duration(seconds: 2));
                    // return "Data fetched from inline function!";
                    await FlutterContacts.getContact(userList[index].id);
                  })();
                  Contact contact=fullacontact!;


                return  phoneContactWidget(
                   onTapFunc: ()  async {
                     final fullContact =  await FlutterContacts.getContact(userList[index].id);
                     Navigator.of(context).push(
                         MaterialPageRoute(builder: (context)=> ContactDetailPage(fullContact!))
                     );
                   },
                    username: userList[index].displayName,
                    id:userList[index].displayName,
                   avatar:fullacontact!,
                    isOnline: false);
              } ))
    ],
  );

}