import 'dart:io';

import 'package:app/app/constant.dart';
import 'package:app/screen/login_screen/login.dart';
import 'package:app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  

  final Services _services = Services();

  void logOut() async {
    bool result = false;
    result = await _services.logOut();
    debugPrint("$result");

    if (result) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const MyLogin()),
          (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Logout Failed",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${Constant.userModel.name}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            height: 80,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: [
                const Icon(Icons.person, size: 50),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Profile",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text("Edit profile"),
                  ],
                ),
                const SizedBox(
                  width: 205,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'profile_update');
                    },
                    icon: const Icon(
                      Icons.arrow_forward,
                      size: 50,
                      color: Colors.deepOrange,
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            height: 80,
            width: double.infinity,
            color: Colors.white,
            child: const Row(
              children: [
                Icon(Icons.personal_injury, size: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Personal Details",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text("Edit personal details"),
                  ],
                ),
                SizedBox(
                  width: 140,
                ),
                Icon(
                  Icons.arrow_forward,
                  size: 50,
                  color: Colors.deepOrange,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            height: 80,
            width: double.infinity,
            color: Colors.white,
            child: const Row(
              children: [
                Icon(Icons.settings, size: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Settings",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text("Edit settings"),
                  ],
                ),
                SizedBox(
                  width: 210,
                ),
                Icon(
                  Icons.arrow_forward,
                  size: 50,
                  color: Colors.deepOrange,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          IconButton(
            onPressed: () {
              logOut();
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.deepOrange,
              size: 60,
            ),
          )
        ],
      ),
    );
  }
}
