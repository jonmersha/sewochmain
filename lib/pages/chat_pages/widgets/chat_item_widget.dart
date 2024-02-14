
//import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

Widget chatItemWidget(
    {
      Function()? onTapFunc,
    Function()? horizontal,
    String? username,
    String? lastMessage,
    bool isOnline = false}) {
  return GestureDetector(
    onTap: onTapFunc,
    child: Container(
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade200),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: !isOnline ? Colors.grey : Colors.green,
            child: const Icon(
              Icons.person,
              size: 35,
            ),
          ),
          const VerticalDivider(
            width: 5,
          ),
          const SizedBox(
            width: 4,
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "$username",
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.black54),
                  ),
                  Text(
                    "$lastMessage",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.black45,fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          const Icon(
            Icons.call,
            size: 30,
            color: Colors.green,
          )
        ],
      ),
    ),
  );
}

 phoneContactWidget(
    {
      Function()? onTapFunc,
      Function()? horizontal,
      String? username,
      String? id,

      bool isOnline = false,
      Contact? avatar,
    })   {

  // var fullContact =  FlutterContacts.getContact(id!);
  //Contact contact=fullContact as Contact;
//avatar![0].
  return GestureDetector(
    onTap: onTapFunc,
    child: Container(
      //height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade200),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: !isOnline ? Colors.grey : Colors.green,
            child: (avatar != null)?  Container(child: Image.memory(avatar.photoOrThumbnail!)):
            Container(child: Text(avatar.toString()),)
          ),
          const VerticalDivider(
            width: 5,
          ),
          const SizedBox(
            width: 4,
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "$username",
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.black54),
                  ),
                  Text(
                    "$id",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.black45,fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          const Icon(
            Icons.call,
            size: 30,
            color: Colors.green,
          )
        ],
      ),
    ),
  );
}
class ContactUpdate extends StatefulWidget {
  final String contactId;

  const ContactUpdate({super.key,required this.contactId});

  @override
  State<ContactUpdate> createState() => _ContactUpdateState();
}

class _ContactUpdateState extends State<ContactUpdate> {
   //late Contact  contact;
  // //late
  // @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    print(widget.contactId);
   // setState(() async {
   //   final fullcontact =  await FlutterContacts.getContact(widget.contactId);
   //
   //   contact=fullcontact!;
   //   //print(contact.displayName);
   //
   // });
  }
  @override
  Widget build(BuildContext context) {
    return// Column(children: [
      Column(
        children: [
          Text("contact ID:${widget.contactId}"),
          //Text("contact ID:${contact.displayName}"),
        ],
      );
      //Text(contact.displayName),
      //Text('${contact.photoOrThumbnail}')

    //],);
  }
}
