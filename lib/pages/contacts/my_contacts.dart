import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:sewoch/controller/contact_controller.dart';
import 'package:sewoch/pages/chat_pages/widgets/chat_item_widget.dart';
import 'package:sewoch/pages/chat_pages/widgets/contact_repo.dart';


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
  final fullContact=Get.put(ContactController(userList!));
  return GetX<ContactController>(builder: (controller) {
    return !fullContact.isLoading.value?  getList(controller.detailedContact!):Text("Is loading");});

}
Widget getList(List<Contact> contacts){
  print(contacts.length);
  return CustomScrollView(
    //physics: const NeverScrollableScrollPhysics(),
    slivers: <Widget>[
      SliverList(
          delegate: SliverChildBuilderDelegate(
              childCount: contacts.length,
                  (BuildContext context, int index)  {
                Contact contact=contacts[index];
                return  Row(
                  children: [
                   CircleAvatar(
                     radius: 25,
                     child: (contact.photoOrThumbnail !=null)?Image.memory(contact.photoOrThumbnail!):Icon(Icons.person),
                   ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${contacts[index].displayName}"),
                        contact.phones.isNotEmpty ? Text("${contacts[index].phones.first.number}"):Text("No number"),
                      ],
                    ),
                  ],
                );
              } ))
    ],
  );
}