import 'package:flutter/material.dart';
import 'package:abdi/page/home/view/htagrs.dart';
import 'package:abdi/page/screen/home.dart';
import 'package:abdi/component/add_htags.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';


void main()
{
  runApp(const HomePage());
} 

class HomePage extends StatefulWidget {
  const HomePage ({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   double xOffset = 0;
  double yOffset = 0;

  bool isDrawerOpen = false;
  final ZoomDrawerController z = ZoomDrawerController();

  late final PageController _pageController ;
  int _currentIndex = 1;

  @override
  void initState() {
    
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
    
  }

 
 

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
     appBar: AppBar(
      title: const Text('Abdi'),
      centerTitle: true,
      leading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: isDrawerOpen
          ? GestureDetector(
              child: Icon(Icons.arrow_back_ios),
              onTap: () {
                setState(() {
                  xOffset = 0;
                  yOffset = 0;
                  isDrawerOpen = false;
                });
              },
            )
          : GestureDetector(
              child: Icon(Icons.menu),
              onTap: () {
               setState(() {
                  xOffset = 290;
                  yOffset = 80;
                  isDrawerOpen = true;
                });
              },
            ),
    ),
      
     ),

     body: PageView(
      onPageChanged: (index){
        setState((){

          _currentIndex = index;

        });
      },
      controller: _pageController,
      children: const <Widget>[
        Home(),
        Htags(),
      ]
      
     ),

     floatingActionButton: const  AddHtags(),
     

     bottomNavigationBar: BottomNavigationBar(
       currentIndex: _currentIndex,
       onTap:(index) {
        setState((){
          _currentIndex = index;
         
        });

        _pageController.jumpToPage(_currentIndex);
       },
      items:const  <BottomNavigationBarItem>[
       
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Hastag',
          ),
      ],
     ),


    );
  }
}





  



