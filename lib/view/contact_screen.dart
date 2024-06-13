import 'package:contact_application/utilits/text_const/text_constant.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                child: Container(
                  //height: 50,
                  //width: 80,
                  //color: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          color: Colors.black,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(height: 30),
          Text(
            'name',
            style: TextConstant.style1,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 60,
              width: double.infinity,
              //color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "1234567980",
                    style: TextConstant.style1,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.call,
                            size: 30,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.message,
                            size: 30,
                          ))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
