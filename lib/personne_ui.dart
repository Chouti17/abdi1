import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RenseignementApp extends StatelessWidget {
  const RenseignementApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RenseignementPage(),
    );
  }
}

class RenseignementPage extends StatefulWidget {
  const RenseignementPage({super.key});
  @override
  _RenseignementPageState createState() => _RenseignementPageState();
  
}

class _RenseignementPageState extends State<RenseignementPage> {
  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulaire de Renseignement'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nomController,
              decoration: const InputDecoration(labelText: 'Nom'),
            ),
            TextField(
              controller: prenomController,
              decoration: const InputDecoration(labelText: 'Prénom'),
            ),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(labelText: 'Âge'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final nom = nomController.text;
                final prenom = prenomController.text;
                final age = ageController.text;
                await createPersonne(nom: nom, prenom: prenom, age: age);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
Future createPersonne(
    {required String nom, required String prenom, required String age}) async {
  final docPersonne = FirebaseFirestore.instance.collection('personne');

  final pers = Personne(nom: nom, prenom: prenom, age: age);

  final json = pers.toJson();
  await docPersonne.add(json);
  print('donne envoyer ');
}
class Personne {
  final String nom;
  final String prenom;
  final String age;
  Personne({required this.nom, required this.prenom, required this.age});
  Map<String, dynamic> toJson() => {
        'nom': nom,
        'prenom': prenom,
        'age': age,
      };
}
