import 'package:abdi/model/kit.dart';
import 'package:abdi/utils/user.dart';
import 'package:abdi/view/connexion/connexion.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rive/rive.dart';

class MyAuth {
  static void register(
    BuildContext context,
    String email,
    String password,
    String nom,
    String prenom,
    String date,
    String numero,
    String identifiants,
    String cles,
  ) async {
    try {
      final personne = Personne(null,
          prenom: prenom,
          date: date,
          numero: numero,
          email: email,
          passUser: password,
          nom: nom,
          idKit: identifiants,
          passKit: cles);

      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: personne.email, password: personne.passUser);

      personne.uid = userCredential.user!.uid;
      // debugPrint(personne.uid);

      final kits = Kit(
          userInformation: Users(
              identifiant: userCredential.user!.uid, password: personne.numero),
          authentificationA: AuthentificationA(autorisation: false),
          authentificationR: AuthentificationR(reception: false),
          alarmeA: AlarmeA(false),
          alarmeR: AlarmeR(false),
          moteurA: MoteurA(autorisation: false),
          moteurR: MoteurR(reception: false),
          zoneDangereuseA: ZoneDangereuseA(autorisation: false),
          zoneDangereuseR: ZoneDangereuseR(reception: false),
          volR: VolU(volActiveUser: false),
          volA: VolA(volActiveAdmin: false),
          positionA: PositionA(autorisation: false),
          positionR: PositionR(reception: false),
          positionKit: Position());

      await FirebaseFirestore.instance
          .collection("users")
          .doc(personne.uid)
          .set(personne.toJson());

      await FirebaseDatabase.instance.ref().child(identifiants).set(kits
          .toMap()); // await FirebaseFirestore.instance.collection("kit").doc(kits.identifiant).set(kits.toMap());

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Login()));

      /* await createPersonne(
            numero: numero, email: email, pass: password, nom: nom);*/

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.greenAccent,
        content: Text(
          'Inscription reussi',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: "JosefinSans",
          ),
        ),
      ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Color.fromARGB(255, 255, 0, 55),
          content: Text(
            'Mots de pass faible',
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: "JosefinSans",
            ),
          ),
        ));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Color.fromARGB(255, 255, 0, 55),
          content: Text(
            'Email existe deja',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ));
      }
    }
  }
}
