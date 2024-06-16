import 'package:contact_application/controller/contact_provider.dart';
import 'package:contact_application/utilits/color_const/color_constant.dart';
import 'package:contact_application/utilits/text_const/text_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  //
  final validationKey = GlobalKey<FormState>();
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
        backgroundColor: ColorConstant.background,
        // foregroundColor: ColorConstant.primary,
        toolbarHeight: 80,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_sharp,
              size: 30,
              color: Colors.grey.shade50,
            )),
        title: Text(
          "Add",
          style: TextConstant.styleHeading,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              onPressed: () {
                if (validationKey.currentState!.validate()) {
                  Provider.of<ContactProvider>(context, listen: false)
                      .addContact(nameController.text, surnameController.text,
                          phoneController.text);
                  Navigator.pop(context);
                }
              },
              icon: Icon(
                Icons.check_sharp,
                size: 40,
                color: Colors.greenAccent.shade700,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: validationKey,
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "enter name to save contact";
                  } else {
                    return null;
                  }
                },
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "enter a valid name";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20),
              Text(
                "  Phone Number",
                style: TextConstant.style1,
              ),
              TextFormField(
                maxLength: 10,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                controller: phoneController,
                decoration: InputDecoration(
                  counterText: "",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    gapPadding: 20,
                  ),
                  hintText: '+91 _ _ _ _ _ _ _ _ _',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "phone number is required";
                  } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                    return 'Enter a valid 10-digit phone number';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
              )
            ],
          ),
        ),
      ),
    );
  }
}
