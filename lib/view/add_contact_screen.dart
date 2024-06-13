import 'package:contact_application/utilits/text_const/text_constant.dart';
import 'package:flutter/material.dart';

class AddContactScreen extends StatelessWidget {
  const AddContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
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
