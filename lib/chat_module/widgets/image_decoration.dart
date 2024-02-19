import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

DecorationImage decorationImageContact() {
  return const DecorationImage(
      image: AssetImage(
        "asset/back.png",
      ),
      fit: BoxFit.cover);
}
DecorationImage decorationImageDetailContact(Contact contact) {
  return DecorationImage(
      image: (
          contact.photoOrThumbnail != null)
          ? Image.memory(contact.photoOrThumbnail!).image
          : const AssetImage(
        "asset/back.png",
      ),
      fit: BoxFit.cover);
}
