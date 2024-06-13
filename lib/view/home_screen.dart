// ignore_for_file: prefer_const_constructors

import 'package:contact_application/view/add_contact_screen.dart';
import 'package:contact_application/view/contact_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final dataCount = 0;
  bool dataFlag = false;
  isloaded() {
    setState(() {
      dataFlag = dataCount > 0;
    });
  }

  @override
  void initState() {
    super.initState();
    isloaded();
  }

  void add() {}
  @override
  Widget build(BuildContext context) {
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
                                        onPressed: () {},
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
      body: Visibility(
        visible: dataFlag,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: dataCount,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ContactScreen(),
                                ));
                          },
                          child: ListTile(
                            //tileColor: Colors.grey,
                            leading: Padding(
                              padding: const EdgeInsets.only(left: 10),
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
                              "Name djslkajlksjdlkajh",
                              style: TextStyle(fontSize: 20),
                            ),
                            subtitle: Text(
                              "1234567890",
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
                        Divider(
                          color: Colors.grey,
                          thickness: .5,
                          height: 1,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        replacement: Center(
          child: Text("Add Contacts to See your Contact List"),
        ),
      ),
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
