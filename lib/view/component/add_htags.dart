import 'package:flutter/material.dart';


class AddHtags extends StatefulWidget {
  const AddHtags({super.key});

  @override
  State<AddHtags> createState() => _AddHtagsState();
  
}
 void modal(BuildContext context) => showModalBottomSheet(
    context: context,
    builder: (context) =>  Wrap(
      children:  <Widget>[

       const  Padding(
          padding:EdgeInsets.all(8.0),
         child: Text('Htags créator'),
      
        ),

        const Padding(
        padding: EdgeInsets.all(8.0) ,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Entrez votre Htagas',
          ),
          
        ),
        ),
      
        Padding(padding: const EdgeInsets.only(bottom: 10.0) ,
       child:  Row(
          mainAxisAlignment:MainAxisAlignment.end ,
          children: [
            TextButton(onPressed:() =>Navigator.pop(context),
             child:  Text('cancel'.toUpperCase())),
             
            TextButton(onPressed:() {},
             child:  Text('Add'.toUpperCase() )),
          ],
        ),)
        
      ],
    
    ),

  ); 

class _AddHtagsState extends State<AddHtags> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () { modal(context);},
      child: const Icon(Icons.add),
     ) ;
  }
}