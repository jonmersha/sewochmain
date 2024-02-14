import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  List<Contact> _contacts = [];
  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  Future<void> _loadContacts() async {
    Iterable<Contact> contacts = await ContactsService.getContacts();
    setState(() {
      _contacts = contacts.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Images'),
      ),
      body: ListView.builder(
        itemCount: _contacts.length,
        itemBuilder: (context, index) {
          Contact contact = _contacts[index];
          return ListTile(
            leading: (contact.avatar != null && contact.avatar!.isNotEmpty)
                ? CircleAvatar(
              backgroundImage: Image.memory(contact.avatar!).image,
            )
                : Icon(Icons.person),
            title: Text(contact.displayName ?? ''),
            subtitle: Text(contact.phones!.isNotEmpty
                ? contact.phones!.first.value ?? ''
                : 'No phone number'),
          );
        },
      ),
    );
  }
}
