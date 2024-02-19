import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
   List<Contact> contacts=[];
   List<Contact> detailedContact=[];

  var isLoading = false.obs;
  var isLoadingContact = false.obs;

  @override
  void onInit() {
    super.onInit();
    getContact();
  }

  Future<void> getContact() async {
    bool isFetched = false;
    isLoadingContact(true);
    try {
      contacts = await FlutterContacts.getContacts();
      isFetched = true;
      update();
    } catch (e) {
      print('Error:$e');
    } finally {
      if (isFetched) {
        isLoadingContact(false);
        getFullContacts(contacts);
      }
    }
  }
  Future<void> getFullContacts(List<Contact> contacts) async {
    bool isFetched = false;
    isLoading(true);
    try {
      for (int i = 0; i < contacts.length; i++) {
        var fullContact = (await FlutterContacts.getContact(contacts[i].id))!;
        Contact contact = fullContact;
        detailedContact.add(contact);
      }
      isFetched = true;
    } catch (e) {
      print('Error:$e');
    } finally {
      if (isFetched) {
        isLoading(false);
        isLoadingContact(true);
        update();
        print('Detailed Contact Has Been Loaded');
      }
    }
  }
}
