import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late final PageController _pageController;
  int _currentIndex = 1;
  String nom = "Abdoul";
  late bool powerOnDemarrage = false;
  late bool powerOnAlarme = false;
  late bool powerOnMoteur = false;
  late bool powerOnZone = false;
  final player = AudioPlayer();
   double xOffset = 0;
  double yOffset = 0;

  bool isDrawerOpen = false;

  void togglePower() {
    setState(() {
      powerOnDemarrage = !powerOnDemarrage;
      player.play(DeviceFileSource("assets/audio/demarrage.mp3"));
    });
  }

  void togglePowerAlarme() {
    setState(() {
      powerOnAlarme = !powerOnAlarme;
      player.play(DeviceFileSource("assets/audio/Alarme.mp3"));
    });
  }

  void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(isDrawerOpen ? 0.85 : 1.00)
        ..rotateZ(isDrawerOpen ? -50 : 0),
      duration: Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            isDrawerOpen ? BorderRadius.circular(40) : BorderRadius.circular(0),
      ),
    child: Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                                  isDrawerOpen
                      ? GestureDetector(
                          child: Image.asset(
                           "assets/menu1.png",
                            height: 25,
                          ), 
                         
                          onTap: () {
                            setState(() {
                              xOffset = 0;
                              yOffset = 0;
                              isDrawerOpen = false;
                            });
                          },
                        )
                      : GestureDetector(
                          child: Image.asset(
                           "assets/menu1.png",
                            height: 25,
                          ), 
                          onTap: () {
                            setState(() {
                              xOffset = 290;
                              yOffset = 80;
                              isDrawerOpen = true;
                            });
                          },
                        ),
             
                Icon(
                  Icons.person,
                  size: 45,
                  color: Colors.grey[800],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Bienvenu " + nom,
                  style: GoogleFonts.josefinSans(fontSize: 18),
                ),
                Container(
                    height: MediaQuery.of(context).size.height / 8,
                    width: 100.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/moto4.png")),
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 1,
            ),
            child: Divider(
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text("Smart Motorcycle",
              style: GoogleFonts.josefinSans(fontSize: 20)),
          const SizedBox(
            height: 10,
          ),
          SizedBox( height: 390,
            child:
          SingleChildScrollView(
  scrollDirection: Axis.vertical,
  child: Column(children:[


          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(children: [
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: powerOnDemarrage
                            ? Colors.greenAccent
                            : Color.fromARGB(46, 144, 147, 184),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Column(children: [
                          Image.asset(
                            "assets/fusee.png",
                            height: 65,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  left: 10,
                                ),
                                child: Text("Démarrage",
                                    style: GoogleFonts.josefinSans(
                                      fontSize: 10,
                                      color: powerOnDemarrage
                                          ? Colors.black
                                          : Colors.black,
                                    )),
                              ),
                              Transform(
                                transform: Matrix4.rotationZ(0)..scale(0.9),
                                child: MaterialButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () async {
                                    // will immediately start playing
                                    togglePower();
                                  },
                                  child: CupertinoSwitch(
                                      value: powerOnDemarrage,
                                      onChanged: (newValue) async {
                                        if (powerOnDemarrage == false) {
                                          await player.play(AssetSource(
                                              "audio/demarrage.mp3"));
                                        }
                                        setState(() {
                                          powerOnDemarrage = newValue;
                                        });
                                      }),
                                ),
                              )
                            ],
                          )
                        ]),
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(children: [
                    Container(
                       height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: powerOnAlarme
                            ? Colors.greenAccent
                            : Color.fromARGB(46, 144, 147, 184),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Column(children: [
                          Image.asset(
                            "assets/alerte (2).png",
                            height: 65,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  left: 10,
                                ),
                                child: Text("Alarme",
                                    style: GoogleFonts.josefinSans(
                                      fontSize: 10,
                                      color: powerOnAlarme
                                          ? Colors.black
                                          : Colors.black,
                                    )),
                              ),
                              Transform(
                                transform: Matrix4.rotationZ(0)..scale(0.9),
                                child: MaterialButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () async {
                                    // will immediately start playing
                                    togglePowerAlarme();
                                  },
                                  child: CupertinoSwitch(
                                      value: powerOnAlarme,
                                      onChanged: (newValue) async {
                                        if (powerOnAlarme== false) {
                                          await player.play(AssetSource(
                                              "audio/Alarme.mp3"));
                                        }
                                        setState(() {
                                          powerOnAlarme = newValue;
                                        });
                                      }),
                                ),
                              )
                            ],
                          )
                        ]),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(children: [
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: powerOnMoteur
                            ? Colors.greenAccent
                            : Color.fromARGB(46, 144, 147, 184),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Column(children: [
                          Image.asset(
                            "assets/moteur (1).png",
                            height: 65,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  left: 10,
                                ),
                                child:Column(children: [
                                   Text("Bloquer ",
                                    style: GoogleFonts.josefinSans(
                                      fontSize: 10,
                                      color: powerOnMoteur
                                          ? Colors.black
                                          : Colors.black,
                                    )),
                                    SizedBox(height:5,),
                                     Text("le  Moteur",
                                    style: GoogleFonts.josefinSans(
                                      fontSize: 10,
                                      color: powerOnMoteur
                                          ? Colors.black
                                          : Colors.black,
                                    )),
                                ],)
                              ),
                              Transform(
                                transform: Matrix4.rotationZ(0)..scale(0.9),
                                child: MaterialButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () async {
                                    // will immediately start playing
                                    togglePower();
                                  },
                                  child: CupertinoSwitch(
                                      value: powerOnMoteur,
                                      onChanged: (newValue) async {
                                        if (powerOnMoteur == false) {
                                          await player.play(AssetSource(
                                              "audio/car.mp3"));
                                        }
                                        setState(() {
                                          powerOnMoteur = newValue;
                                        });
                                      }),
                                ),
                              )
                            ],
                          )
                        ]),
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(children: [
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: powerOnZone
                            ? Colors.greenAccent
                            : Color.fromARGB(46, 144, 147, 184),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Column(children: [
                          Image.asset(
                            "assets/avertissement.png",
                            height: 65,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  left: 10,
                                ),
                                child: Column(children:[
                                  Text("Zone",
                                    style: GoogleFonts.josefinSans(
                                      fontSize: 10,
                                      color: powerOnZone
                                          ? Colors.black
                                          : Colors.black,
                                    )),
                                    Text("Dangereuse",
                                    style: GoogleFonts.josefinSans(
                                      fontSize: 10,
                                      color: powerOnZone
                                          ? Colors.black
                                          : Colors.black,
                                    )),
                                ])
                              ),
                              Transform(
                                transform: Matrix4.rotationZ(0)..scale(0.9),
                                child: MaterialButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () async {
                                    // will immediately start playing
                                    togglePower();
                                  },
                                  child: CupertinoSwitch(
                                      value: powerOnZone,
                                      onChanged: (newValue) async {
                                        if (powerOnZone == false) {
                                          await player.play(AssetSource(
                                              "audio/demarrage.mp3"));
                                        }
                                        setState(() {
                                          powerOnZone = newValue;
                                        });
                                      }),
                                ),
                              )
                            ],
                          )
                        ]),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          )
         ,const SizedBox(
            height: 10,
          ),
         
         ])) )]),
      ),
      backgroundColor: Colors.brown.shade50,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          _pageController.jumpToPage(_currentIndex);
        },
        items: const <BottomNavigationBarItem>[
          
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Hastag',
          ),
        ],
      ),
    ));
  }
}
