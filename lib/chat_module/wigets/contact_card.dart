import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:sewoch/chat_module/wigets/image_decoration.dart';

// Widget contactCard(List<Contact> contact) {
//   return CustomScrollView(
//     //physics: const NeverScrollableScrollPhysics(),
//     slivers: <Widget>[
//       SliverList(
//           delegate: SliverChildBuilderDelegate(childCount: contact.length,
//               (BuildContext context, int index) {
//         return Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//           child: Row(
//             children: [
//               Container(
//                 height: 60,
//                 width: 60,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     image: decorationImageContact()),
//               ),
//               const SizedBox(
//                 width: 5,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(contact[index].displayName,
//                       style:
//                           const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
//                   //                  contact.phones.isNotEmpty ? Text("${contacts[index].phones.first.number}"):Text("No number"),
//                 ],
//               ),
//             ],
//           ),
//         );
//       }))
//     ],
//   );
// }

Widget getList(List<Contact> contacts, bool isDetail) {
  return CustomScrollView(
    //physics: const NeverScrollableScrollPhysics(),
    slivers: <Widget>[
      SliverList(
          delegate: SliverChildBuilderDelegate(childCount: contacts.length,
              (BuildContext context, int index) {
        Contact contact = contacts[index];
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Divider(
                height: 0.1,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: isDetail
                            ? decorationImageDetailContact(contact)
                            : decorationImageContact()),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contacts[index].displayName,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      if (isDetail) phoneNumber(contacts[index])
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      }))
    ],
  );
}

Widget phoneNumber(Contact contact) {
  return contact.phones.isNotEmpty
      ? Text(contact.phones.first.normalizedNumber,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400))
      : const Text("");
}
