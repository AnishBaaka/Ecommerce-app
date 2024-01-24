import 'package:app/app/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 237, 237),
        appBar: AppBar(
          title: const Text("Update Profile"),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: Image.network(
                      "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg")
                  .image,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      radius: 20,
                      child: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => Container(
                              padding: const EdgeInsets.only(
                                  left: 80, right: 80, top: 50),
                              width: double.infinity,
                              height: 200,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.browse_gallery,
                                          size: 80,
                                        ),
                                      ),
                                      const Text("Gallery")
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.camera,
                                          size: 80,
                                        ),
                                      ),
                                      const Text("Camera")
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        icon: const FaIcon(FontAwesomeIcons.camera),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            textFieldWidget("Name"),
            textFieldWidget("Phone number"),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white)),
              onPressed: () {},
              child: const Text(
                "Update",
                style: TextStyle(color: Colors.deepOrange, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding textFieldWidget(String textHint) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: textHint,
              hintStyle: const TextStyle(color: Colors.black),
              border: const OutlineInputBorder())),
    );
  }
}
