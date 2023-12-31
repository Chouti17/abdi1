import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class InfoCard extends StatelessWidget {
 

  const InfoCard({
    Key? key,
    required this.name,
    required this.prenom,

    
  }) : super(key: key);

  final String name , prenom;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:const CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(
          CupertinoIcons.person,
          color: Colors.white,
        ),
      ),
      title: Text(
        name,
        style:const TextStyle(
          color: Colors.white,
        ),
      ),
      subtitle: Text(
         prenom,
        style:const TextStyle(
          color: Colors.white,
        ),
      ),
    ); 
  }
}
