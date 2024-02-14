import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class ContactDetailPage extends StatefulWidget {
  final Contact contact;

  const ContactDetailPage(this.contact, {super.key});

  @override
  State<ContactDetailPage> createState() => _ContactDetailPageState();
}

class _ContactDetailPageState extends State<ContactDetailPage> {

  @override
  Widget build(BuildContext context) {
     //Uint8List?  photoOrThumbnail => photo ?? thumbnail;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(

          pinned: true,
          expandedHeight: 100,
          title: const Text('User Name'),
          backgroundColor: Colors.teal[800],
          flexibleSpace:  const FlexibleSpaceBar(
            title: Text('Sewoch'),
          ),

        ),

        //ChatUserList(),
        SliverFillRemaining(
          child: Column(
            children: [
              Text(widget.contact.phones.first.number),
              Text(widget.contact.phones.first.customLabel),
              Text(widget.contact.phones.first.normalizedNumber),
              Text(widget.contact.name.first),
              Text(widget.contact.name.last),
              Text(widget.contact.name.firstPhonetic),
             // Text("${widget.contact.photoOrThumbnail}"),
             Image.memory(widget.contact.photoOrThumbnail!)
             // Image.memory(widget.contact.photoOrThumbnail!),


        //   Container(
        //   width: 200.0,
        //   height: 200.0,
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: Image.memory((widget.contact."":"") as Uint8List).image,
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // )

            ],
          ),
        )
      ],
    ));
  }
}
