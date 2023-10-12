import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:abdi/view/position/position.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    getUsername();
    inital();

    // Obtain shared preferences.
  }

  inital() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final bool? alarme = pref.getBool('powerOnAlarme');
    final bool? demarrage = pref.getBool('powerOnDemarrage');
    final bool? zone = pref.getBool('powerOnZone');
    final bool? bloquer = pref.getBool('powerOnMoteur');
    final bool? signale = pref.getBool(' signal');
    if (alarme == null) {
      await powerOnAlarmeSet(false);
    } else {
      powerOnAlarmeGet();
    }
    if (demarrage == null) {
      await powerOnDemarrageSet(false);
    } else {
      powerOnDemarrageGet();
    }
    if (zone == null) {
      await powerOnZoneSet(false);
    } else {
      powerOnZoneGet();
    }
    if (bloquer == null) {
      await powerOnMoteurSet(false);
    } else {
      powerOnMoteurGet();
    }
     if (signale == null) {
      await signalSet(false);
    } else {
      signalGet();
    }
  }

  getUsername() async {
    final userUID = FirebaseAuth.instance.currentUser!.uid;

    final userData =
        await FirebaseFirestore.instance.collection("users").doc(userUID).get();
    setState(() {
      nom = userData["nom"];
      kitId = userData["idKit"];
    });
  }

//Alarme
  Future<void> powerOnAlarmeSet(bool ab) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool('powerOnAlarme', ab);
    setState(() {
      powerOnAlarme = ab;
    });
  }

  powerOnAlarmeGet() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final bool? powerOnAlarmes = pref.getBool('powerOnAlarme');
    setState(() {
      powerOnAlarme = powerOnAlarmes!;
    });
  }

//Demarrage
  Future<void> powerOnDemarrageSet(bool ab) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool('powerOnDemarrage', ab);
    setState(() {
      powerOnDemarrage = ab;
    });
  }

  powerOnDemarrageGet() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final bool? powerOnDemarrages = pref.getBool('powerOnDemarrage');
    setState(() {
      powerOnDemarrage = powerOnDemarrages!;
    });
  }

//Zone
  Future<void> powerOnZoneSet(bool ab) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool('powerOnZone', ab);
    setState(() {
      powerOnZone = ab;
    });
  }

  powerOnZoneGet() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final bool? powerOnZones = pref.getBool('powerOnZone');
    setState(() {
      powerOnZone = powerOnZones!;
    });
  }

  Future<void> powerOnMoteurSet(bool ab) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool('powerOnMoteur', ab);
    setState(() {
      powerOnMoteur = ab;
    });
  }

  powerOnMoteurGet() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final bool? powerOnMoteurs = pref.getBool('powerOnMoteur');
    setState(() {
      powerOnMoteur = powerOnMoteurs!;
    });
  }

  Future<void> signalSet(bool ab) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool('signal', ab);
    setState(() {
      signal = ab;
    });
  }

  signalGet() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final bool? signals = pref.getBool('powerOnMoteur');
    setState(() {
      signal = signals!;
    });
  }

  //late final PageController _pageControlle //int _currentIndex = 1;
  String nom = "";
  late bool receptions = false;
  late bool powerOnDemarrage = false;
  late bool powerOnAlarme = false;
  late bool powerOnMoteur = false;
  late bool powerOnZone = false;
  late bool position = false;
  late bool signal = false;
  final player = AudioPlayer();
  String kitId = "";
  double xOffset = 0;
  double yOffset = 0;

  bool isDrawerOpen = false;

  void togglePower() {
    setState(() {
      powerOnDemarrage = !powerOnDemarrage;
      player.play(DeviceFileSource("assets/image/audio/demarrage.mp3"));
    });
  }

  void togglePowerAlarme() {
    setState(() {
      powerOnAlarme = !powerOnAlarme;
      player.play(DeviceFileSource("assets/image/audio/Alarme.mp3"));
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
          borderRadius: isDrawerOpen
              ? BorderRadius.circular(40)
              : BorderRadius.circular(0),
        ),
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        isDrawerOpen
                            ? GestureDetector(
                                child: Image.asset(
                                  "assets/image/menu1.png",
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
                                  "assets/image/menu1.png",
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
                                  image: AssetImage("assets/image/moto4.png")),
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
                  SizedBox(
                      height: 390,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(children: [
                            Container(
                              height: 150,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(children: [
                                      Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(24),
                                          color: powerOnDemarrage
                                              ? Colors.greenAccent
                                              : Color.fromARGB(
                                                  46, 144, 147, 184),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 25),
                                          child: Column(children: [
                                            Image.asset(
                                              "assets/image/fusee.png",
                                              height: 65,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.only(
                                                    left: 10,
                                                  ),
                                                  child: Text("Démarrage",
                                                      style: GoogleFonts
                                                          .josefinSans(
                                                        fontSize: 10,
                                                        color: powerOnDemarrage
                                                            ? Colors.black
                                                            : Colors.black,
                                                      )),
                                                ),
                                                Transform(
                                                  transform:
                                                      Matrix4.rotationZ(0)
                                                        ..scale(0.9),
                                                  child: MaterialButton(
                                                      padding:
                                                          EdgeInsets.all(0),
                                                      onPressed: () async {},
                                                      child: StreamBuilder(
                                                        stream: FirebaseDatabase
                                                            .instance
                                                            .ref()
                                                            .child(kitId)
                                                            .onValue,
                                                        builder: (context,
                                                            snapshot) {
                                                          if (snapshot
                                                                  .hasData &&
                                                              snapshot
                                                                      .data!
                                                                      .snapshot
                                                                      .value !=
                                                                  null) {
                                                            // Accédez aux données avec snapshot.data.snapshot.value
                                                            final reception = snapshot
                                                                .data!.snapshot
                                                                .child(
                                                                    "authentificationR")
                                                                .child(
                                                                    'reception')
                                                                .value;

                                                            final autorisation =
                                                                snapshot.data!
                                                                    .snapshot
                                                                    .child(
                                                                        "authentificationA")
                                                                    .child(
                                                                        'autorisation')
                                                                    .value;

                                                            /* if (powerOnDemarrage == true &&
                                                                autorisation ==
                                                                    false &&
                                                                reception ==
                                                                    false) {
                                                              powerOnDemarrageSet(
                                                                  false);
                                                            }*/

                                                            if (autorisation ==
                                                                    false &&
                                                                reception ==
                                                                    false) {
                                                              return CupertinoSwitch(
                                                                  value:
                                                                      powerOnDemarrage,
                                                                  onChanged:
                                                                      (newValue) async {
                                                                    setState(
                                                                        () {});
                                                                    FirebaseDatabase
                                                                        .instance
                                                                        .ref()
                                                                        .child(
                                                                            kitId)
                                                                        .child(
                                                                            "authentificationA")
                                                                        .child(
                                                                            "autorisation")
                                                                        .set(
                                                                            newValue);

                                                                    powerOnDemarrageSet(
                                                                        true);
                                                                  });
                                                            }
                                                            if (reception ==
                                                                    false &&
                                                                autorisation ==
                                                                    true) {
                                                              return const CircularProgressIndicator(
                                                                  color: Colors
                                                                      .yellow);
                                                            }

                                                            if (reception ==
                                                                    true &&
                                                                autorisation ==
                                                                    true) {
                                                              /*  player.play(
                                                                  AssetSource(
                                                                      "audio/demarrage.mp3"));*/

                                                              return CupertinoSwitch(
                                                                value:
                                                                    powerOnDemarrage,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  setState(() {
                                                                    // powerOnDemarrage =
                                                                    // newValue;
                                                                    FirebaseDatabase
                                                                        .instance
                                                                        .ref()
                                                                        .child(
                                                                            kitId)
                                                                        .child(
                                                                            "authentificationA")
                                                                        .child(
                                                                            "autorisation")
                                                                        .set(
                                                                            newValue);
                                                                    FirebaseDatabase
                                                                        .instance
                                                                        .ref()
                                                                        .child(
                                                                            kitId)
                                                                        .child(
                                                                            "authentificationR")
                                                                        .child(
                                                                            "reception")
                                                                        .set(
                                                                            newValue);

                                                                    powerOnDemarrageSet(
                                                                        false);

                                                                    // Mettez à jour la variable powerOnDemarage ici en fonction de newValue si nécessaire.
                                                                  });
                                                                },
                                                              );
                                                            }

                                                            // Utilisez la valeur de "reception" ici
                                                          }
                                                          return const CircularProgressIndicator(
                                                              color: Colors
                                                                  .redAccent);
                                                        },
                                                      )),
                                                )
                                              ],
                                            )
                                          ]),
                                        ),
                                      ),
                                    ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Row(children: [
                                      Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(24),
                                          color: powerOnAlarme
                                              ? Colors.greenAccent
                                              : const Color.fromARGB(
                                                  46, 144, 147, 184),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 25),
                                          child: Column(children: [
                                            Image.asset(
                                              "assets/image/alerte (2).png",
                                              height: 65,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 10,
                                                  ),
                                                  child: Text("Alarme",
                                                      style: GoogleFonts
                                                          .josefinSans(
                                                        fontSize: 10,
                                                        color: powerOnAlarme
                                                            ? Colors.black
                                                            : Colors.black,
                                                      )),
                                                ),
                                                Transform(
                                                  transform:
                                                      Matrix4.rotationZ(0)
                                                        ..scale(0.9),
                                                  child: MaterialButton(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0),
                                                      onPressed: () async {
                                                        // will immediately start playing
                                                        //  togglePowerAlarme();
                                                      },
                                                      child: StreamBuilder(
                                                          stream:
                                                              FirebaseDatabase
                                                                  .instance
                                                                  .ref()
                                                                  .child(kitId)
                                                                  .onValue,
                                                          builder: ((context,
                                                              snapshot) {
                                                            if (snapshot
                                                                    .hasData &&
                                                                snapshot
                                                                        .data!
                                                                        .snapshot
                                                                        .value !=
                                                                    null) {
                                                              final alarmeA = snapshot
                                                                  .data!
                                                                  .snapshot
                                                                  .child(
                                                                      "alarmeA")
                                                                  .child(
                                                                      "autorisation")
                                                                  .value;
                                                              final alarmeR = snapshot
                                                                  .data!
                                                                  .snapshot
                                                                  .child(
                                                                      "alarmeR")
                                                                  .child(
                                                                      "reception")
                                                                  .value;
                                                              if (alarmeA ==
                                                                      false &&
                                                                  alarmeR ==
                                                                      false) {
                                                                print(
                                                                    powerOnAlarme);
                                                                return CupertinoSwitch(
                                                                    value:
                                                                        powerOnAlarme,
                                                                    onChanged:
                                                                        (newValue) async {
                                                                      setState(
                                                                          () {
                                                                        FirebaseDatabase
                                                                            .instance
                                                                            .ref()
                                                                            .child(kitId)
                                                                            .child("alarmeA")
                                                                            .child("autorisation")
                                                                            .set(newValue);
                                                                        print(
                                                                            powerOnAlarme);
                                                                        powerOnAlarmeSet(
                                                                            true);
                                                                        print(
                                                                            powerOnAlarme);
                                                                      });
                                                                    });
                                                              }
                                                              if (alarmeA ==
                                                                      true &&
                                                                  alarmeR ==
                                                                      false) {
                                                                return const CircularProgressIndicator(
                                                                    color: Colors
                                                                        .yellow);
                                                              }
                                                              if (alarmeA ==
                                                                      true &&
                                                                  alarmeR ==
                                                                      true) {
                                                                /*player.play(
                                                                    AssetSource(
                                                                        "audio/Alarme.mp3"));*/
                                                                print(
                                                                    powerOnAlarme);
                                                                return CupertinoSwitch(
                                                                    value:
                                                                        powerOnAlarme,
                                                                    onChanged:
                                                                        (newValue) async {
                                                                      setState(
                                                                          () {
                                                                        FirebaseDatabase
                                                                            .instance
                                                                            .ref()
                                                                            .child(kitId)
                                                                            .child("alarmeA")
                                                                            .child("autorisation")
                                                                            .set(newValue);
                                                                        FirebaseDatabase
                                                                            .instance
                                                                            .ref()
                                                                            .child(kitId)
                                                                            .child("alarmeR")
                                                                            .child("reception")
                                                                            .set(newValue);

                                                                        powerOnAlarmeSet(
                                                                            false);
                                                                        print(
                                                                            powerOnAlarme);
                                                                      });
                                                                    });
                                                              }

                                                              if (alarmeA ==
                                                                      false &&
                                                                  alarmeR ==
                                                                      true) {
                                                                FirebaseDatabase
                                                                    .instance
                                                                    .ref()
                                                                    .child(
                                                                        kitId)
                                                                    .child(
                                                                        "alarmeR")
                                                                    .child(
                                                                        "reception")
                                                                    .set(false);
                                                              }
                                                            }

                                                            return const CircularProgressIndicator(
                                                                color: Colors
                                                                    .redAccent);
                                                          }))),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(children: [
                                      Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(24),
                                          color: powerOnMoteur
                                              ? Colors.greenAccent
                                              : const Color.fromARGB(
                                                  46, 144, 147, 184),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 25),
                                          child: Column(children: [
                                            Image.asset(
                                              "assets/image/moteur (1).png",
                                              height: 65,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                    padding: EdgeInsets.only(
                                                      left: 10,
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Text("Bloquer ",
                                                            style: GoogleFonts
                                                                .josefinSans(
                                                              fontSize: 10,
                                                              color:
                                                                  powerOnMoteur
                                                                      ? Colors
                                                                          .black
                                                                      : Colors
                                                                          .black,
                                                            )),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text("le  Moteur",
                                                            style: GoogleFonts
                                                                .josefinSans(
                                                              fontSize: 10,
                                                              color:
                                                                  powerOnMoteur
                                                                      ? Colors
                                                                          .black
                                                                      : Colors
                                                                          .black,
                                                            )),
                                                      ],
                                                    )),
                                                Transform(
                                                  transform:
                                                      Matrix4.rotationZ(0)
                                                        ..scale(0.9),
                                                  child: MaterialButton(
                                                    padding: EdgeInsets.all(0),
                                                    onPressed: () async {},
                                                    child: StreamBuilder(
                                                        stream: FirebaseDatabase
                                                            .instance
                                                            .ref()
                                                            .child(kitId)
                                                            .onValue,
                                                        builder: ((context,
                                                            snapshot) {
                                                          if (snapshot
                                                                  .hasData &&
                                                              snapshot
                                                                      .data!
                                                                      .snapshot
                                                                      .value !=
                                                                  null) {
                                                            final autorisation =
                                                                snapshot.data!
                                                                    .snapshot
                                                                    .child(
                                                                        'moteurA')
                                                                    .child(
                                                                        'autorisation')
                                                                    .value;
                                                            final autorisations =
                                                                snapshot.data!
                                                                    .snapshot
                                                                    .child(
                                                                        'authentificationA')
                                                                    .child(
                                                                        'autorisation')
                                                                    .value;

                                                            if (autorisation ==
                                                                false) {
                                                              return CupertinoSwitch(
                                                                  value:
                                                                      powerOnMoteur,
                                                                  onChanged:
                                                                      (newValue) async {
                                                                    if (powerOnMoteur ==
                                                                        false) {
                                                                      /* await player
                                                                          .play(
                                                                              AssetSource("audio/car.mp3"));*/
                                                                    }
                                                                    setState(
                                                                        () {
                                                                      FirebaseDatabase
                                                                          .instance
                                                                          .ref()
                                                                          .child(
                                                                              kitId)
                                                                          .child(
                                                                              'moteurA')
                                                                          .child(
                                                                              'autorisation')
                                                                          .set(
                                                                              true);
                                                                      powerOnMoteurSet(
                                                                          true);

                                                                      powerOnDemarrageSet(
                                                                          false);
                                                                    });
                                                                  });
                                                            }
                                                            if (autorisation ==
                                                                true) {
                                                              FirebaseDatabase
                                                                  .instance
                                                                  .ref()
                                                                  .child(kitId)
                                                                  .child(
                                                                      'authentificationA')
                                                                  .child(
                                                                      'autorisation')
                                                                  .set(false);
                                                              FirebaseDatabase
                                                                  .instance
                                                                  .ref()
                                                                  .child(kitId)
                                                                  .child(
                                                                      'authentificationR')
                                                                  .child(
                                                                      'reception')
                                                                  .set(false);
                                                              powerOnDemarrageSet(
                                                                  false);
                                                              return CupertinoSwitch(
                                                                  value:
                                                                      powerOnMoteur,
                                                                  onChanged:
                                                                      (newValue) async {
                                                                    setState(
                                                                        () {
                                                                      FirebaseDatabase
                                                                          .instance
                                                                          .ref()
                                                                          .child(
                                                                              kitId)
                                                                          .child(
                                                                              'moteurA')
                                                                          .child(
                                                                              'autorisation')
                                                                          .set(
                                                                              false);
                                                                      powerOnMoteurSet(
                                                                          false);
                                                                    });
                                                                  });
                                                            }
                                                            if (autorisations ==
                                                                true) {
                                                              FirebaseDatabase
                                                                  .instance
                                                                  .ref()
                                                                  .child(kitId)
                                                                  .child(
                                                                      'MoteurA')
                                                                  .child(
                                                                      'autorisation')
                                                                  .set(false);
                                                              powerOnMoteurSet(
                                                                  false);
                                                            }
                                                          }
                                                          return const CircularProgressIndicator(
                                                              color: Colors
                                                                  .redAccent);
                                                        })),

                                                    /*CupertinoSwitch(
                                                        value: powerOnMoteur,
                                                        onChanged:
                                                            (newValue) async {
                                                          if (powerOnMoteur ==
                                                              false) {
                                                            await player.play(
                                                                AssetSource(
                                                                    "audio/car.mp3"));
                                                          }
                                                          setState(() {
                                                            powerOnMoteur =
                                                                newValue;
                                                          });
                                                        }),*/
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Row(children: [
                                      Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(24),
                                          color: powerOnZone
                                              ? Colors.greenAccent
                                              : Color.fromARGB(
                                                  46, 144, 147, 184),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 25),
                                          child: Column(children: [
                                            Image.asset(
                                              "assets/image/avertissement.png",
                                              height: 65,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                    padding: EdgeInsets.only(
                                                      left: 10,
                                                    ),
                                                    child: Column(children: [
                                                      Text("Zone",
                                                          style: GoogleFonts
                                                              .josefinSans(
                                                            fontSize: 10,
                                                            color: powerOnZone
                                                                ? Colors.black
                                                                : Colors.black,
                                                          )),
                                                      Text("Dangereuse",
                                                          style: GoogleFonts
                                                              .josefinSans(
                                                            fontSize: 10,
                                                            color: powerOnZone
                                                                ? Colors.black
                                                                : Colors.black,
                                                          )),
                                                    ])),
                                                Transform(
                                                  transform:
                                                      Matrix4.rotationZ(0)
                                                        ..scale(0.9),
                                                  child: MaterialButton(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0),
                                                      onPressed: () async {
                                                        // will immediately start playing
                                                      },
                                                      child: StreamBuilder(
                                                          stream:
                                                              FirebaseDatabase
                                                                  .instance
                                                                  .ref()
                                                                  .child(kitId)
                                                                  .onValue,
                                                          builder: ((context,
                                                              snapshot) {
                                                            if (snapshot
                                                                    .hasData &&
                                                                snapshot
                                                                        .data!
                                                                        .snapshot
                                                                        .value !=
                                                                    null) {
                                                              final zoneA = snapshot
                                                                  .data!
                                                                  .snapshot
                                                                  .child(
                                                                      "zoneDangereuseA")
                                                                  .child(
                                                                      "autorisation")
                                                                  .value;
                                                              final zoneR = snapshot
                                                                  .data!
                                                                  .snapshot
                                                                  .child(
                                                                      "zoneDangereuseR")
                                                                  .child(
                                                                      "reception")
                                                                  .value;
                                                              if (zoneA ==
                                                                      false &&
                                                                  zoneR ==
                                                                      false) {
                                                                return CupertinoSwitch(
                                                                    value:
                                                                        powerOnZone,
                                                                    onChanged:
                                                                        (newValue) async {
                                                                      setState(
                                                                          () {
                                                                        powerOnZoneSet(
                                                                            true);

                                                                        FirebaseDatabase
                                                                            .instance
                                                                            .ref()
                                                                            .child(kitId)
                                                                            .child("zoneDangereuseA")
                                                                            .child("autorisation")
                                                                            .set(newValue);
                                                                        powerOnZoneSet(
                                                                            true);
                                                                      });
                                                                    });
                                                              }
                                                              if (zoneA ==
                                                                      true &&
                                                                  zoneR ==
                                                                      false) {
                                                                return const CircularProgressIndicator(
                                                                    color: Colors
                                                                        .yellow);
                                                              }
                                                              if (zoneA ==
                                                                      true &&
                                                                  zoneR ==
                                                                      true) {
                                                                /*player.play(
                                                                        AssetSource(
                                                                            "audio/Alarme.mp3"));*/

                                                                return CupertinoSwitch(
                                                                    value:
                                                                        powerOnZone,
                                                                    onChanged:
                                                                        (newValue) async {
                                                                      setState(
                                                                          () {
                                                                       

                                                                        FirebaseDatabase
                                                                            .instance
                                                                            .ref()
                                                                            .child(kitId)
                                                                            .child("zoneDangereuseA")
                                                                            .child("autorisation")
                                                                            .set(newValue);
                                                                        FirebaseDatabase
                                                                            .instance
                                                                            .ref()
                                                                            .child(kitId)
                                                                            .child("zoneDangereuseR")
                                                                            .child("reception")
                                                                            .set(newValue);
                                                                         powerOnZoneSet(
                                                                            false);    
                                                                      });
                                                                    });
                                                              }

                                                              if (zoneA ==
                                                                      false &&
                                                                  zoneR ==
                                                                      true) {
                                                                FirebaseDatabase
                                                                    .instance
                                                                    .ref()
                                                                    .child(
                                                                        kitId)
                                                                    .child(
                                                                        "zoneDangereuseR")
                                                                    .child(
                                                                        "reception")
                                                                    .set(false);
                                                              }
                                                            }
                                                            return const CircularProgressIndicator(
                                                                color:
                                                                    Colors.red);
                                                          }))),
                                                )
                                              ],
                                            )
                                          ]),
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 18),
                                          child: Row(children: [
                                            Container(
                                              height: 150,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                                color: signal
                                                    ? Colors.redAccent
                                                    :  Colors.greenAccent,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 25,
                                                ),
                                                child: Column(children: [
                                                  Image.asset(
                                                    "assets/image/ecoute.png",
                                                    height: 65,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 10,
                                                                  left: 10),
                                                          child:
                                                              Column(children: [
                                                            Text("Signaler ",
                                                                style: GoogleFonts
                                                                    .josefinSans(
                                                                  fontSize: 13,
                                                                  color:  Colors.black,
                                                                )),
                                                            Text("un vol",
                                                                style: GoogleFonts
                                                                    .josefinSans(
                                                                  fontSize: 13,
                                                                  color: powerOnZone
                                                                      ? Colors
                                                                          .black
                                                                      : Colors
                                                                          .black,
                                                                )),
                                                          ])),
                                                      Transform(
                                                        transform:
                                                            Matrix4.rotationZ(0)
                                                              ..scale(0.9),
                                                        child: MaterialButton(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(0),
                                                            onPressed:
                                                                () async {
                                                              // will immediately start playing
                                                            },
                                                            child:
                                                                StreamBuilder(
                                                                    stream: FirebaseDatabase
                                                                        .instance
                                                                        .ref()
                                                                        .child(
                                                                            kitId)
                                                                        .onValue,
                                                                    builder:
                                                                        ((context,
                                                                            snapshot) {
                                                                      if (snapshot
                                                                              .hasData &&
                                                                          snapshot.data!.snapshot.value !=
                                                                              null) {
                                                                        final volU = snapshot
                                                                            .data!
                                                                            .snapshot
                                                                            .child("volU")
                                                                            .child("volActiveUser")
                                                                            .value;
                                                                        final volA = snapshot
                                                                            .data!
                                                                            .snapshot
                                                                            .child("volA")
                                                                            .child("volActiveAdmin")
                                                                            .value;
                                                                        if (volU ==
                                                                                false &&
                                                                            volA ==
                                                                                false) {
                                                                          return CupertinoSwitch(
                                                                              value: signal,
                                                                              onChanged: (newValue) async {
                                                                                setState(() {
                                                                                 

                                                                                  FirebaseDatabase.instance.ref().child(kitId).child("volA").child("volActiveUser").set(newValue);
                                                                                   signalSet(true);
                                                                                });
                                                                              });
                                                                        }
                                                                        if (volU ==
                                                                                true) {
                                                                          return const CircularProgressIndicator(
                                                                              color: Colors.yellow);
                                                                        }
                                                                        if (volU ==
                                                                                true &&
                                                                            volA==
                                                                                true) {
                                                                          player
                                                                              .play(AssetSource("audio/Alarme.mp3"));

                                                                          return CupertinoSwitch(
                                                                              value: signal,
                                                                              onChanged: (newValue) async {
                                                                                setState(() {
                                                                              
                                                                                  FirebaseDatabase.instance.ref().child(kitId).child("userA").child("volActiveAdmin").set(newValue);
                                                                                  FirebaseDatabase.instance.ref().child(kitId).child("userU").child("volActiveUser").set(newValue);
                                                                                  signalSet(false);
                                                                                });
                                                                              });
                                                                        }

                                                                        
                                                                      }

                                                                      return const CircularProgressIndicator(
                                                                          color:
                                                                              Colors.red);
                                                                    }))
                                                           
                                                            ),
                                                      )
                                                    ],
                                                  )
                                                ]),
                                              ),
                                            )
                                          ])),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const MapScreen()));
                                            },
                                            child: Container(
                                              height: 150,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                                color: position
                                                    ? Colors.greenAccent
                                                    : Color.fromARGB(
                                                        46, 144, 147, 184),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 25,
                                                    right: 18,
                                                    left: 18),
                                                child: Column(children: [
                                                  Image.asset(
                                                    "assets/image/signal.png",
                                                    height: 65,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10,
                                                                  top: 10),
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                  "Position actuelle ",
                                                                  style: GoogleFonts
                                                                      .josefinSans(
                                                                    fontSize:
                                                                        12,
                                                                    color: position
                                                                        ? Colors
                                                                            .black
                                                                        : Colors
                                                                            .black,
                                                                  )),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                            ],
                                                          )),
                                                    ],
                                                  )
                                                ]),
                                              ),
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ])),
                            SizedBox(height: 15)
                          ])))
                ]),
              ),
            ),
            backgroundColor: Colors.brown.shade50,
            bottomNavigationBar: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                child: GNav(
                    /*currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            }*/
                    gap: 5,
                    tabBackgroundColor: Colors.greenAccent,
                    padding: EdgeInsets.all(16),
                    tabs: [
                      GButton(
                        icon: Icons.home,
                        text: 'Home',
                        textStyle: GoogleFonts.josefinSans(
                          fontSize: 12,
                        ),
                      ),
                      GButton(
                          icon: Icons.notifications_outlined,
                          text: 'Alerte',
                          textStyle: GoogleFonts.josefinSans(
                            fontSize: 12,
                          )),
                      GButton(
                          icon: Icons.message_sharp,
                          text: ' Message',
                          textStyle: GoogleFonts.josefinSans(
                            fontSize: 12,
                          )),
                      GButton(
                        icon: Icons.offline_bolt,
                        text: 'Position',
                        textStyle: GoogleFonts.josefinSans(
                          fontSize: 12,
                        ),
                      )
                    ]),
              ),
            )));
  }
}
