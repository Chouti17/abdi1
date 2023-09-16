import 'package:flutter/material.dart';

  final List<Map<String,dynamic>> listhtags =[
    {
      'name':'#flutter'
    },
    {
      'name':'#dart'
    }
   ];

class Htags extends StatelessWidget {
  const Htags({super.key});

   
  @override
  Widget build(BuildContext context) {
   
    return listhtags.isEmpty ? const 
    Center(
    child: Text('No Htags'),
    )

     : ListView.builder(
      itemCount: listhtags.length,
      itemBuilder: (context, index){

        return Dismissible(
          
          key: Key(index.toString()),
          onDismissed: (direction){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('$index supprimer'),
            )) ;       },
          background: Container(
            color: Colors.red,
          ),
             child:  Card(
            child: ListTile(
              title:Text(listhtags[index]['name']),
            ),
          ) ,);

      }
    );
  }
}