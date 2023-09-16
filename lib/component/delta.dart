import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
class SideMenuTitle extends StatefulWidget {
  const SideMenuTitle({
    Key? key,
  }) : super(key: key);

  @override
  State<SideMenuTitle> createState() => _SideMenuTitleState();
}

class _SideMenuTitleState extends State<SideMenuTitle> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget> [
       const Padding(
        padding: EdgeInsets.only(left:24),
        child:Divider(
          color: Colors.white24,
          height:1,
        ),
        ),
        ListTile(
          onTap:(){},
          leading: const SizedBox(
            height: 34,
            width: 34,
            child: RiveAnimation.asset('',
            artboard: "Home",
             
             ),),
             title: const Text(
              "Home",
              style: TextStyle(color:Colors.white),
             ),
        ),
        SideMenuTitle()
      ],
    );
  }
}
