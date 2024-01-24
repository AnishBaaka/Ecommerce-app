import 'package:app/screen/forget_screen/forget_screen.dart';
import 'package:app/screen/login_screen/login.dart';
import 'package:app/screen/profile_update_screen/profile_update_screen.dart';
import 'package:app/screen/register_screen/register.dart';
import 'package:app/screen/splash_screen/index_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyAVnD3NFOG-SmOGD8ggJuTFgLxXdEicB_M",
        appId: "1:461300255000:android:06a2faf7ef141b53aab66d",
        messagingSenderId: "XXX",
        projectId: "myproject-69d9d"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        routes: {
          'login': (context) => const MyLogin(),
          'register': (context) => const MyRegister(),
          'homeScreen': (context) => const IndexScreen(),
          'forget_screen': (context) => const ForgetScreen(),
          'profile_update': (context) => const ProfileUpdateScreen(),
        });
  }
}
