import 'package:abdi/controller/auth.dart';
import 'package:abdi/view/instance/intance.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:google_fonts/google_fonts.dart';

class CompleteKitScreen extends StatefulWidget {
  final String email;
  final String password;
  final String nom;
  final String prenom;
  final String numero;
  final String date;

  const CompleteKitScreen(
      {super.key,
      required this.email,
      required this.password,
      required this.nom,
      required this.prenom,
      required this.numero,
      required this.date});

  @override
  State<CompleteKitScreen> createState() => _CompleteKitScreenState();
}

class _CompleteKitScreenState extends State<CompleteKitScreen> {
  String cles = "", identifiants = "";
  bool option = true;

  TextEditingController mailController = TextEditingController();

  TextEditingController clesController = TextEditingController();
  TextEditingController identifiantsController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

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
                      Center(
                        child: Text(
                          "Merci de fournir les détails de votre kit (Abdi).",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.josefinSans(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
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
                            Text(
                              "Identifiants",
                              style: GoogleFonts.josefinSans(fontSize: 15.0),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: identifiantsController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Entrez l\'dentifiant de votre kit ';
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
                            Text(
                              "Clés de sécurité",
                              style: GoogleFonts.josefinSans(fontSize: 15.0),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                            
                              controller: clesController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Entrez la clés de sécurité de votre kit';
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
                              cles = clesController.text;
                              identifiants = identifiantsController.text;
                            });
                            MyAuth.register(
                                context,
                                widget.email,
                                widget.password,
                                widget.nom,
                                widget.prenom,
                                widget.date,
                                widget.numero,
                                identifiants,
                                cles);
                          }
                        },
                        color: Colors.greenAccent,
                        height: 60,
                        elevation: 0,
                        minWidth: double.infinity,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: Text('Suivants',
                            style: GoogleFonts.josefinSans(
                                fontSize: 18.0, fontWeight: FontWeight.bold)),
                      ),
                    ),
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

/*

Future createPersonne(
    {
    
    required String cles,
    required String identifiant}) async {
  final docPersonne = FirebaseFirestore.instance.collection('personne');

  /*final pers = Personne(
    identifiant: identifiant,
    cles: cles,
    
   
  );*/

  //final json = pers.toJson();
 // await docPersonne.add(json);
  print('donne envoyer ');
}

*/
/*



class Personne {
  final String identifiant;
  final String cles;
  
  
  Personne(
      
      {required this.identifiant,
      required this.cles,
     
      });
  Map<String, dynamic> toJson() => {
        'identifiant': identifiant,
       
        'cles': cles,
        
      };
}
*/