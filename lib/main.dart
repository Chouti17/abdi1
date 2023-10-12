import 'package:abdi/firebase_options.dart';
import 'package:abdi/view/combine/combine.dart';
import 'package:abdi/view/instance/intance.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //intialisation de firebase

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(ProviderScope(child: const Abdi()));
}

class Abdi extends StatelessWidget {
  const Abdi({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Abdi',
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: AuthStream()
            //Stack(children: [Acceuil()]),
            ));
  }
}

class AuthStream extends StatefulWidget {
  const AuthStream({super.key});

  @override
  State<AuthStream> createState() => _AuthStreamState();
}

class _AuthStreamState extends State<AuthStream> {
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance.authStateChanges();

    return StreamBuilder(
      stream: auth,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasData) {
          if (snapshot.data == null) {
            return Acceuil();
          } else {
            return Combine();
          }
        }

        return Acceuil();
      },
    );
  }
}
