import 'package:firebase_auth/firebase_auth.dart';
import 'package:abdi/page/home/home.dart';

import 'package:flutter/material.dart';

class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  String email = "", numero = "", password = "", passwords = "";

  TextEditingController mailController = TextEditingController();
  TextEditingController numController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passsController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  register() async {
    if (password != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Inscription reussi',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ));

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.orange,
            content: Text(
              'Mots de pass faible',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.orange,
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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/register.png'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
          key: _formkey,
          child: Column(children: [
            Container(
                padding: const EdgeInsets.only(left: 33, top: 33),
                child: const Text(
                  'Bienvenu',
                  style: TextStyle(color: Colors.white, fontSize: 33),
                )),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.2,
                    right: 35,
                    left: 35),
                child: Column(
                  children: [
                    TextFormField(
                      controller: mailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrez votre mail';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: numController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrez votre numero';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Numero',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: passController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrez un mots de pass';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passsController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrez de nouveau votre pass';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Confirm Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    GestureDetector(

                      onTap: () async {
                        
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              email = mailController.text;
                              numero = numController.text;
                              password = passController.text;
                            });
                          }
                          register();
                      
                      },

                      child:  TextButton(
                      onPressed: () async {
                        
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              email = mailController.text;
                              numero = numController.text;
                              password = passController.text;
                            });
                          }
                          register();
                      
                      },

                      child: Text(
                        'S\'incrire',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16, // Taille de la police
                          fontWeight:
                              FontWeight.bold, // Poids de la police (optionnel)
                          fontStyle: FontStyle
                              .italic, // Style de la police (optionnel)
                          letterSpacing: 1.5,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Couleur du texte
                        padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15), // Espacement intérieur
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // Bordures arrondies
                        ),
                      ),
                    ),
                
                      
                    ),
                   ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
