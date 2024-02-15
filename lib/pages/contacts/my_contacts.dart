import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:sewoch/chat_module/wigets/contact_card.dart';
import 'package:sewoch/controller/contact_controller.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  List<Contact>? _contacts;
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
      setState(
        () => _contacts = contacts,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    if (_permissionDenied) {
      return const Center(child: Text('Permission denied'));
    }
    if (_contacts == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return customScrolView(_contacts);
  }
}

Widget customScrolView(List<Contact>? userList) {
  final fullContact = Get.put(ContactController(userList!));
  return GetX<ContactController>(builder: (controller) {
    return !fullContact.isLoading.value
        ? getList(controller.detailedContact!, true)
        : getList(userList, false);
  });
}
