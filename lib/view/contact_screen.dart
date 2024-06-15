import 'package:contact_application/controller/contact_provider.dart';
import 'package:contact_application/model/contact.dart';
import 'package:contact_application/utilits/text_const/text_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatefulWidget {
  final Contact contact;
  int index;
  ContactScreen({super.key, required this.contact, required this.index});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final nameController = TextEditingController();
  final snameController = TextEditingController();
  final phoneController = TextEditingController();
  @override
  void initState() {
    super.initState();
    Contact(
        name: nameController.text,
        surname: nameController.text,
        phone: phoneController.text);
  }

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            Container(
              //color: Colors.cyanAccent,
              child: Stack(children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: CircleAvatar(
                        child: Icon(
                          Icons.person,
                          color: Colors.grey.shade100,
                          size: 80,
                        ),
                        radius: 60,
                        backgroundColor: Colors.grey.shade900,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 5,
                  bottom: -9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          contactProvider.delete(widget.index);
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.blueGrey,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          nameController.text = widget.contact.name;
                          snameController.text = widget.contact.surname;
                          phoneController.text = widget.contact.phone;
                          showModalBottomSheet(
                            elevation: 0,
                            barrierColor: Colors.black,
                            isScrollControlled: true,
                            // useSafeArea: true,
                            context: context,
                            builder: (context) => Container(
                              //height: 350,
                              //width: double.infinity,
                              // color: Colors.amber,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        height: 70,
                                        width: double.infinity,
                                        //color: Colors.blueAccent,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(
                                                weight: 900,
                                                Icons.close,
                                                size: 30,
                                                color: Colors.red,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                Provider.of<ContactProvider>(
                                                        context,
                                                        listen: false)
                                                    .updateContact(
                                                        widget.index,
                                                        nameController.text,
                                                        snameController.text,
                                                        phoneController.text);
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(
                                                weight: 900,
                                                Icons.check,
                                                size: 30,
                                                color: Colors.green,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "  Name",
                                      style: TextConstant.style1,
                                    ),
                                    TextFormField(
                                      controller: nameController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          gapPadding: 20,
                                        ),
                                        hintText: 'Enter name',
                                      ),
                                    ),
                                    Text(
                                      "  Surname",
                                      style: TextConstant.style1,
                                    ),
                                    TextFormField(
                                      controller: snameController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          gapPadding: 20,
                                        ),
                                        hintText: 'Enter name',
                                      ),
                                    ),
                                    Text(
                                      "  Phone",
                                      style: TextConstant.style1,
                                    ),
                                    TextFormField(
                                      controller: phoneController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          gapPadding: 20,
                                        ),
                                        hintText: 'Enter name',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Colors.blueGrey,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                " ${widget.contact.name} ${widget.contact.surname}",
                maxLines: 2,
                style: TextConstant.styleContactName,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                height: 60,
                width: double.infinity,
                //color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      " 91+ ${widget.contact.phone}",
                      style: TextConstant.style91,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              color: Colors.green,
                              Icons.call,
                              size: 30,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              color: Colors.orange,
                              Icons.message,
                              size: 30,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Call history"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 250,
                width: double.infinity,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          //color: Colors.amber,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          //color: Colors.amber,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          //color: Colors.amber,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
