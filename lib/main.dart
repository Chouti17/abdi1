import 'package:abdi/firebase_options.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:abdi/page/home/view/sidebar.dart';

import 'package:abdi/page/home/view/cc.dart';

import 'package:abdi/page/home/view/dashboard.dart';

import 'package:abdi/page/home/view/profil.dart';

import 'package:abdi/page/home/home.dart';
import 'package:abdi/page/position/position.dart';
import 'package:abdi/page/authentification/instance.dart';
import 'package:abdi/page/home/view/remplirProfil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //intialisation de firebase

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const Abdi());
}

class Abdi extends StatelessWidget {
  const Abdi({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: 'Abdi',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Stack(children: [
          //...ProfileScreen(),
            // Dashboard(),
        //DrawerScreen(),
          // HomeScreen(),
        //  MapScreen(),
        COmpleteProfilScreen(),
          ]),
        ));
  }
}
