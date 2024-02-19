import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
class ContactController extends GetxController{

  late final List<Contact> contacts;
  late List<Contact>? detailedContact;

  var isLoading = false.obs;
  var isLoadingContact = false.obs;

  @override
  void onInit() {
    super.onInit();
    detailedContact=[];
    //contacts=[];
    getContact();

  }
  Future<void> getContact() async {
    bool isFetched=false;
    isLoadingContact(true);
    try{
      contacts = await FlutterContacts.getContacts();
       isFetched=true;
    } catch(e){
      print('Error:$e');
        }
    finally{
      if(isFetched) {
        isLoadingContact(false);
        getFullContacts(contacts);
      }

    }

  }
  Future<void> getFullContacts(List<Contact> contacts) async {
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
        isLoadingContact(true);
        print('Datailed contact Has been loadeds');
      }

    }

  }







}
// class GetFull extends StatelessWidget {
//   final String id;
//    GetFull({super.key,required this.id});
//   late Contact contact;
//
//   getValue() async {
//     final fullText=await FlutterContacts.getContact(id);
//     contact=fullText!;
//     //print(contact.displayName);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//    // print('Create Customer Text');
//     getValue();
//     return Text(contact.displayName);
//   }
// }
