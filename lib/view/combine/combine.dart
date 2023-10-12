import 'package:abdi/view/dashboard/dashboard.dart';
import 'package:abdi/view/parametre/parametre.dart';
import 'package:flutter/material.dart';

class Combine extends StatefulWidget {
  const Combine({super.key});

  @override
  State<Combine> createState() => _CombineState();
}

class _CombineState extends State<Combine> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          Dashboard(),
        ],
      ),
    );
  }
}
