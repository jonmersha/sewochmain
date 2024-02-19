import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sewoch/chat_module/widgets/contact_card.dart';
import 'package:sewoch/controller/contact_controller.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  late bool _contactPermissionAllowed;

  @override
  initState() {
    super.initState();
    _fetchContacts();
  }

  Future _fetchContacts() async {
    _contactPermissionAllowed = false;
    await Permission.contacts.onDeniedCallback(() {
      _contactPermissionAllowed = false;
    }).onGrantedCallback(() {
      _contactPermissionAllowed = true;
    }).onPermanentlyDeniedCallback(() {
      openAppSettings();
    }).onRestrictedCallback(() {
      _contactPermissionAllowed = false;
    }).onLimitedCallback(() {
      _contactPermissionAllowed = false;
    }).onProvisionalCallback(() {
      _contactPermissionAllowed = false;
    }).request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    if (_contactPermissionAllowed) {
      return const Center(child: Text('Permission DENIED'));
    } else {
      return customScrollView();
    }
  }

  Widget customScrollView() {
    final fullContacts = Get.put(ContactController());

    return GetX<ContactController>(builder: (controller) {
      return !fullContacts.isLoading.value
          ? getList(controller.detailedContact, true)
          : (!fullContacts.isLoadingContact.value
              ? getList(controller.contacts, false)
              : const Center(child: CircularProgressIndicator()));
    });
  }
}
