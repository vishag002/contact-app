import 'package:contact_application/controller/contact_provider.dart';
import 'package:contact_application/utilits/text_const/text_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  //
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final phoneController = TextEditingController();
  //
  //late Box<Contact> contactBox;
/* 
  @override
  void initState() {
    super.initState();
    contactBox = Hive.box<Contact>('contactBox');
  } */
/* 
  void printContactList() {
    final contacts = contactBox.values.toList();
    for (var contact in contacts) {
      print(
          'Name: ${contact.name}, Surname: ${contact.surname}, Phone: ${contact.phone}');
    }
  } */

  @override
  Widget build(BuildContext context) {
    //print(contactBox.values.toList());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_sharp,
              size: 30,
              color: Colors.black,
            )),
        title: Text("Add"),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ContactProvider>(context, listen: false).addContact(
                  nameController.text,
                  surnameController.text,
                  phoneController.text);
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.check_sharp,
              size: 30,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "  Name",
              style: TextConstant.style1,
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  gapPadding: 20,
                ),
                hintText: 'Enter name',
              ),
            ),
            SizedBox(height: 20),
            Text(
              "  Surname",
              style: TextConstant.style1,
            ),
            TextFormField(
              controller: surnameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  gapPadding: 20,
                ),
                hintText: 'Enter Surname',
              ),
            ),
            SizedBox(height: 20),
            Text(
              "  Phone Number",
              style: TextConstant.style1,
            ),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  gapPadding: 20,
                ),
                hintText: '+91 _ _ _ _ _ _ _ _ _',
              ),
            )
          ],
        ),
      ),
    );
  }
}
