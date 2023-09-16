
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';





class MenuScreen extends StatelessWidget {
  final VoidCallback onCloseMenu;

  const MenuScreen({required this.onCloseMenu});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      color: Colors.black, // Couleur de fond du tiroir
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
           Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.white),
              onPressed: onCloseMenu,
            ),
          ), // Espacement en haut
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
                ),
                SizedBox(height: 16),
                Text(
                  'Bienvenu ACCLOMBESSI',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          SizedBox(height: 40), // Espacement entre l'avatar/nom et les menus

          // Menus
          ListTile(
            leading: Icon(Icons.home, color: Colors.white),
            title: Text('Accueil', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Gérer la navigation vers l'écran d'accueil
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title: Text('Paramètres', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Gérer la navigation vers l'écran de paramètres
            },
          ),
          // Ajoutez d'autres éléments de menu ici

          Spacer(), // Pour pousser les éléments en bas
          ListTile(
            leading: Icon(Icons.logout, color: Colors.white),
            title: Text('Déconnexion', style: TextStyle(color: Colors.white)),
            onTap: () {
              FirebaseAuth.instance.signOut();
              // Gérer la déconnexion de l'utilisateur
            },
          ),

          // Bouton Fermer dans le coin supérieur droit
         
        ],
      ),
    );
  }
}
