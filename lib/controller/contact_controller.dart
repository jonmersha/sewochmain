import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
class ContactController extends GetxController{
  final List<Contact> contacts;
  late List<Contact>? detailedContact;
  var isLoading = false.obs;
  Contact? contact;
  ContactController(this.contacts);
  @override
  void onInit() {
    super.onInit();
    detailedContact=[];
    getFullContacts();
  }
  Future<void> getFullContacts() async {
    bool isFetched=false;
    isLoading(true);
    try{
      for(int i=0;i<contacts.length;i++){
      var fullContact  = (await FlutterContacts.getContact(contacts[i].id))!;
        Contact contact =fullContact;
      detailedContact?.add(contact);
      }
      isFetched=true;

    } catch(e){
      print('Error:$e');
        }
    finally{
      if(isFetched) {
        isLoading(false);
      }

    }

  }






}
class GetFull extends StatelessWidget {
  final String id;
   GetFull({super.key,required this.id});
  late Contact contact;

  getValue() async {
    final fullText=await FlutterContacts.getContact(id);
    contact=fullText!;
    print(contact.displayName);


  }

  @override
  Widget build(BuildContext context) {
    print('Create Customer Text');
    getValue();
    return Text(contact.displayName);
  }
}
