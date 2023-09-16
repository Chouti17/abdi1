import 'package:flutter/material.dart';
import 'package:abdi/page/authentification/instance.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:abdi/page/home/home.dart';
import 'package:google_fonts/google_fonts.dart';

class COmpleteProfilScreen extends StatefulWidget {
  const COmpleteProfilScreen({super.key});

  @override
  State<COmpleteProfilScreen> createState() => _COmpleteProfilScreenState();
}

class _COmpleteProfilScreenState extends State<COmpleteProfilScreen> {
  String prenom = "", numero = "", date= "",  nom = "";
  bool option = true;

  TextEditingController mailController = TextEditingController();

  TextEditingController nomController = TextEditingController();
  TextEditingController numController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController dateController = TextEditingController();
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
                    
                   child:Text(
                        "Merci de compléter votre profil.",
                        style: GoogleFonts.josefinSans(fontSize: 18.0,fontWeight:FontWeight.bold),
                        
                      ), ),
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
                              "Nom",
                              style: GoogleFonts.josefinSans(fontSize: 15.0),
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
                            Text(
                              "Prenom",
                              style:GoogleFonts.josefinSans(fontSize: 15.0),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: prenomController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Entrez votre prenom';
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
                              "Date de naissance",
                              style: GoogleFonts.josefinSans(fontSize: 15.0,),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: numController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Entrez votre date de naissance';
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
                           Text(
                              "Numero de telephone",
                              style: GoogleFonts.josefinSans(fontSize: 18.0),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: numController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Entrez votre numero de telephone';
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
                              prenom = prenomController.text;
                              numero = numController.text;
                              date= dateController.text;
                              nom = nomController.text;
                            });
                          }
                        
                        },
                        color: Colors.greenAccent,
                        height: 60,
                        elevation: 0,
                        minWidth: double.infinity,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          'Suivant',
                          style: GoogleFonts.josefinSans(fontSize: 18.0,fontWeight:FontWeight.bold)
                          
                        ),
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

Future createPersonne(
    {required String prenom,
    required DateTime date,
    required String numero,
    required String nom}) async {
  final docPersonne = FirebaseFirestore.instance.collection('personne');

  final pers = Personne(
    prenom: prenom,
    numero: numero,
    date: date,
    nom: nom,
  );

  final json = pers.toJson();
  await docPersonne.add(json);
  print('donne envoyer ');
}

class Personne {
  final String numero;
  final String prenom;
  final DateTime date;
  final String nom;
  Personne(
      {required this.numero,
      required this.prenom,
      required this.date,
      required this.nom});
  Map<String, dynamic> toJson() => {
        'prenom': prenom,
        'date_de_naissance': date,
        'numero': numero,
        'nom': nom,
      };
}
