import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sewoch/chat_module/wigets/contact_card.dart';
import 'package:sewoch/controller/contact_controller.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {

  final Rx<PermissionStatus> _cameraPermissionStatus =
      PermissionStatus.denied.obs;
  PermissionStatus get cameraPermissionStatus => _cameraPermissionStatus.value;


  bool _contactPermitionAllowed = false;
  var statusContact = Permission.contacts.status;
  late Permission _permission;

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future _fetchContacts() async {
   // print("Dodota Branch Manager");
    //var sta
    // try{
    //   if (!await FlutterContacts.requestPermission(readonly: true)) {
    //     setState(() => _contactPermitionAllowed = true);
    //   }
    // }
    // catch(e){
    //   print("New War");
    // }
    //FlutterContacts.requestPermission(true);

    await Permission.contacts
        .onDeniedCallback(() {
          print("onDeniedCallback");
      // Your code
    })
        .onGrantedCallback(() {
      // Your code
      print("onGrantedCallback");


    })
        .onPermanentlyDeniedCallback(() {
      // Your code
      print("onPermanentlyDeniedCallback");
      openAppSettings();

    })
        .onRestrictedCallback(() {
      // Your code
      print("onRestrictedCallback");

    })
        .onLimitedCallback(() {
      // Your code
      print("On limited Call Back");

    })
        .onProvisionalCallback(() {
      // Your code
      print("Provissional Call Back");

    })
        .request();

    //PermissionStatus statusCamera = await Permission;
    //Permission!.contacts.reactive.value(permissionStatus); //=permissionStatus as Permission?;

//PermissionStatus.permanentlyDenied

    //var status = await Permission.contacts.request();
    //print("Permissions Status ${status}");

    // print("IS Denied: ${status}");
    //
    // status = await Permission.contacts.request().isGranted;
    // print("IS Granted: ${status}");
    // status = await Permission.contacts.request().isPermanentlyDenied;
    // print("IS Permanenently Denied: ${status}");
    // status = await Permission.contacts.request().isRestricted;
    // print("IS Restrincted: ${status}");
    //
    //
    // await Permission.contacts.request();

    // print("Const Permission Current Setups ${Permission.contacts.status}");
    // if(await Permission.contacts.isDenied){
    //   print("Contact Permission Has been Denieds");
    //   var status =await Permission.contacts.request();
    //   //print(status);
    // }
    // if(await Permission.contacts.isPermanentlyDenied){
    //   print("Contact Permission Has been Permanenetly deniew");
    //   var status =await Permission.contacts.request()
    //   //print(status);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    if (!_contactPermitionAllowed) {
      return const Center(child: Text('Permission DENIED'));
    } else {
      return const Center(child: Text('Permission Allawed'));
    }
  }
  Future<PermissionStatus> requestCameraPermission() async {
    var status = await Permission.camera.request();
    _cameraPermissionStatus.value = status;
    // updatePermissionStatusInList(PermissionType.camera, status);
    return status;
  }

  Widget customScrolView() {
    final fullContacts = Get.put(ContactController());

    return GetX<ContactController>(builder: (controller) {
      return !fullContacts.isLoadingContact.value
          ? getList(controller.contacts, false)
          : const Center(child: CircularProgressIndicator());

      // !fullContacts.isLoadingContact.value
      //   ? getList(controller.contacts, false)
      //   : !fullContacts.isLoadingContact.value
      //   ? getList(controller.detailedContact!, true)
      //   : Center(child: CircularProgressIndicator());
    });
  }
}
