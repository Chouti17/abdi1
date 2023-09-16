import 'package:flutter/material.dart';
import 'package:abdi/page/authentification/instance.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:abdi/page/home/home.dart';

class PageInscription extends StatefulWidget {
  const PageInscription({super.key});

  @override
  State<PageInscription> createState() => _PageInscriptionState();
}

class _PageInscriptionState extends State<PageInscription> {
  String email = "", numero = "", password = "", passwords = "", nom = "";
  bool option = true;

  TextEditingController mailController = TextEditingController();

  TextEditingController nomController = TextEditingController();
  TextEditingController numController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passsController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  register() async {
    print(option);
    if (password != null && option == true) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        await createPersonne(
            numero: numero, email: email, pass: password, nom: nom);

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.yellow,
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
            backgroundColor: Color.fromARGB(255, 255, 0, 55),
            content: Text(
              'Mots de pass faible',
              style: TextStyle(
                fontSize: 20.0,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Acceuil()));
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Form(
        key: _formkey,
        child: Container(
            height: MediaQuery.of(context).size.height - 100,
            width: double.infinity,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Text(
                        "Inscription",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Connectez vous a votre compte ",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              "Email",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: mailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Entrez votre mail';
                                }
                                return null;
                              },
                              obscureText: false,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 40),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 189, 189, 189)),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 189, 189, 189)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              "Nom",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: nomController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Entrez votre nom';
                                }
                                return null;
                              },
                              obscureText: false,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 40),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 189, 189, 189)),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 189, 189, 189)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              "Numero de telephone",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: numController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Entrez votre Numero de telephone';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              obscureText: false,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 40),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 189, 189, 189)),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 189, 189, 189)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              "Mots de pass",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: passController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Entrez votre mots de pass';
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 40),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 189, 189, 189)),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 189, 189, 189)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              "Confimez votre mots de pass",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: passsController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Confimez votre mots de pass';
                                } else if (passController.text !=
                                    passsController.text) {
                                  option = false;
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 0, 55),
                                    content: Text(
                                      'Les mots de pass ne correspondent pas',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ));
                                }else {
                                    option = true; // Réinitialisez option à true si les mots de passe correspondent
                                  }

                                return null;
                              },
                              obscureText: true,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 40),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 189, 189, 189)),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 189, 189, 189)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      padding: const EdgeInsets.only(left: 3, top: 3),
                      decoration: BoxDecoration(
                        border: const Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: MaterialButton(
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              email = mailController.text;
                              numero = numController.text;
                              password = passController.text;
                              nom = nomController.text;
                            });
                          }
                          register();
                        },
                        color: Colors.greenAccent,
                        height: 60,
                        elevation: 0,
                        minWidth: double.infinity,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: const Text(
                          'M\'inscrire',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("J'ai un compte ?"),
                      Text(
                        "Me connecter ",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ])),
      )),
    );
  }

  Widget makeInput({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: obscureText,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 189, 189, 189)),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 189, 189, 189)),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}

Future createPersonne(
    {required String numero,
    required String email,
    required String pass,
    required String nom}) async {
  final docPersonne = FirebaseFirestore.instance.collection('personne');

  final pers = Personne(
    email: email,
    numero: numero,
    pass: pass,
    nom: nom,
  );

  final json = pers.toJson();
  await docPersonne.add(json);
  print('donne envoyer ');
}

class Personne {
  final String numero;
  final String email;
  final String pass;
  final String nom;
  Personne(
      {required this.numero,
      required this.email,
      required this.pass,
      required this.nom});
  Map<String, dynamic> toJson() => {
        'email': email,
        'pass': pass,
        'numero': numero,
        'nom': nom,
      };
}
