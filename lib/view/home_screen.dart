// ignore_for_file: prefer_const_constructors

import 'package:contact_application/controller/student_controller.dart';
import 'package:contact_application/model/contact.dart';
import 'package:contact_application/view/add_contact_screen.dart';
import 'package:contact_application/view/contact_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slideable/slideable.dart';

import '../controller/contact_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //int dataCount = boxContact.length;
  bool dataFlag = false;

  @override
  void initState() {
    super.initState();
    isLoaded();
  }

  void isLoaded() {
    setState(() {
      dataFlag = boxContact.isNotEmpty;
    });
  }
  //

  void add() {}
  @override
  Widget build(BuildContext context) {
    final contactprovider = Provider.of<ContactProvider>(context);
    // final h1 = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[50],
        title: Text("Contacts"),
        actions: [
          PopupMenuButton(
              iconSize: 30,
              iconColor: Colors.black,
              itemBuilder: (context) => [
                    PopupMenuItem(
                        child: Row(
                      children: [
                        Text("Sort by"),
                        Icon(
                          Icons.arrow_right_sharp,
                          size: 30,
                        )
                      ],
                    )),
                    PopupMenuItem(
                        onTap: () {
                          showDialog(
                            // barrierColor: Colors.red,

                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(
                                  "Are You Sure to delete all the Contacts?"),
                              actions: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          contactprovider.deleteAll();
                                          Navigator.pop(context);
                                        },
                                        child: Text("delete")),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("cancel"))
                                  ],
                                )
                              ],
                            ),
                          );
                          /* Container(
                                    height: 100,
                                    width: 150,
                                    color: Colors.amber,
                                  )); */
                        },
                        child: Text("Delete All"))
                  ])
        ],
      ),
      body:
          //Visibility(
          //visible: dataFlag,
          boxContact.isNotEmpty
              ?

              // child:
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: boxContact.length,
                            itemBuilder: (context, index) {
                              Contact person = boxContact.getAt(index);
                              return Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ContactScreen(
                                                contact: Contact(
                                                    name: person.name,
                                                    surname: person.surname,
                                                    phone: person.phone),
                                                index: index,
                                              ),
                                            ));
                                      },
                                      child: Slideable(
                                        resetSlide: true,
                                        backgroundColor: Colors.white,
                                        duration: Duration(
                                            seconds:
                                                3), // curve:Border.all(color: Colors.black),
                                        items: <ActionItems>[
                                          ActionItems(
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.black,
                                            ),
                                            onPress: () {
                                              contactprovider.delete(index);
                                            },
                                            backgroudColor: Colors.transparent,
                                          ),
                                        ],
                                        child: ListTile(
                                          //tileColor: Colors.grey,
                                          leading: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 20,
                                              child: Center(
                                                child: Icon(
                                                  Icons.person,
                                                  size: 30,
                                                ),
                                              ),
                                            ),
                                          ),
                                          title: Text(
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            "${person.name} ${person.surname}",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          subtitle: Text(
                                            person.phone,
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          horizontalTitleGap: 30,
                                          trailing: IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.call,
                                                size: 30, color: Colors.green),
                                          ),
                                          iconColor: Colors.grey.shade900,
                                          focusColor: Colors.blue,
                                          contentPadding: EdgeInsets.all(10),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                      thickness: .5,
                                      height: 1,
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: Text("Add Contacts to See your Contact List"),
                ),
      //  ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddContactScreen(),
              ));
        },
        backgroundColor: Colors.black,
        child: Center(
          child: Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
