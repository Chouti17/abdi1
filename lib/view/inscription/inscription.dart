import 'package:abdi/controller/auth.dart';
import 'package:abdi/view/instance/intance.dart';
import 'package:abdi/view/kit/kit.dart';
import 'package:abdi/view/profil/profil.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PageInscription extends StatefulWidget {
  const PageInscription({super.key});

  @override
  State<PageInscription> createState() => _PageInscriptionState();
}

class _PageInscriptionState extends State<PageInscription> {
  String email = "", password = "", passwords = "";
  bool option = true;
  bool options = true;

  TextEditingController mailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passsController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  /*Future checkEmail(String email) async {
    final QuerySnapshot email = await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: mailController.text)
        .get();
    if (email.docs.isNotEmpty) {
      setState(() {
        options = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Color.fromARGB(255, 255, 0, 55),
        content: Text(
          'Email existe deja',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ));

      return "votre email existe deja";
    } else {
      setState(() {
        options = true;
      });
      return null;
    }
  }*/

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
                          fontFamily: "JosefinSans",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Inscrivez-vous dès maintenant et protégez votre moto ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700],
                          fontFamily: "JosefinSans",
                        ),
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
                                  fontFamily: "JosefinSans",
                                  color: Colors.black87),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: mailController,
                              validator: (value)  {
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
                              "Mots de pass",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "JosefinSans",
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
                                  fontFamily: "JosefinSans",
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.visiblePassword,
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
                                        fontFamily: "JosefinSans",
                                      ),
                                    ),
                                  ));
                                } else {
                                  option =
                                      true; // Réinitialisez option à true si les mots de passe correspondent
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
                          if (_formkey.currentState!.validate() &&
                              option == true) {
                            setState(() {
                              email = mailController.text;

                              password = passController.text;
                            });
                            //await checkEmail(mailController.text);
                           
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => COmpleteProfilScreen(
                                      email: email, password: password)));
                          
                          }
                        },
                        color: Colors.greenAccent,
                        height: 60,
                        elevation: 0,
                        minWidth: double.infinity,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: const Text(
                          'Suivant',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: "JosefinSans",
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("J'ai un compte ?",
                          style: TextStyle(
                            fontFamily: "JosefinSans",
                          )),
                      Text(
                        "Me connecter ",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "JosefinSans",
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
              fontSize: 15,
              fontWeight: FontWeight.w400,
              fontFamily: "JosefinSans",
              color: Colors.black87),
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
