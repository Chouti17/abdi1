import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';

class bottom extends StatefulWidget {
  const bottom({super.key});

  @override
  State<bottom> createState() => _bottomState();
}

class _bottomState extends State<bottom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Colors.brown.shade50,
          bottomNavigationBar: GNav (
            /*currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            }*/
            gap:10,
            tabs: const[
              GButton(icon: Icons.home,text:'Home'),
              GButton(icon: Icons.notifications_outlined ,),
              GButton(icon: Icons.message_sharp,),
              GButton(icon: Icons.offline_bolt,text: 'Position',)
            ]
          ),);
  }
}