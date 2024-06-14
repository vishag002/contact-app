import 'package:flutter/material.dart';

import '../model/contact.dart';
import 'student_controller.dart';

class ContactProvider extends ChangeNotifier {
  //

  //
  void addContact(uName, sname, phone) {
    boxContact.put(
      'key$uName',
      Contact(
        name: uName,
        surname: sname,
        phone: phone,
      ),
    );
    notifyListeners();
  }
  //get

  /* getContact() {
    Contact person = boxContact.getAt(0);
    String uname = person.name;
    String sname = person.surname;
    var phone = person.phone;
    notifyListeners();
  } */

  //delete
  void delete(index) {
    boxContact.deleteAt(index);
    notifyListeners();
  }

  void deleteAll() {
    boxContact.clear();
    notifyListeners();
  }
}
