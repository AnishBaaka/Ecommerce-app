import 'package:app/services/services.dart';
import 'package:flutter/material.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final TextEditingController _emailCntroller = TextEditingController();
  final _key = GlobalKey<FormState>();

  final Services _services = Services();

  void resetPassword() async {
    try {
      bool result = false;
      result = await _services.forgetPassword(_emailCntroller.text);

      if (result) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            "Email sent Successfully",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          backgroundColor: Colors.green,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            "Email sent Unsuccessfully",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          backgroundColor: Colors.red,
        ));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Forget Password"),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 236, 234, 234),
          ),
          height: double.infinity,
          width: double.infinity,
          child: Form(
            key: _key,
            child: Column(children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Enter your email to send reset mail....",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      _emailCntroller.text.toString();
                    },
                    controller: _emailCntroller,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      labelText: "Email Address",
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    resetPassword();
                  },
                  child: const Text("Send mail"))
            ]),
          ),
        ),
      ),
    );
  }
}
