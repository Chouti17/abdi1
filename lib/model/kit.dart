// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:latlong2/latlong.dart';

class Kit {

  final Users userInformation;

  final AuthentificationA authentificationA;
  final AuthentificationR authentificationR;

  final AlarmeR alarmeR;
  final AlarmeA alarmeA;

  final MoteurA moteurA;
  final MoteurR moteurR;
 
  final ZoneDangereuseA zoneDangereuseA;
  final ZoneDangereuseR zoneDangereuseR;

  final VolU volR;
  final VolA volA;
  

  final PositionA positionA;
  final PositionR positionR;
  final Position positionKit;
  Kit({
    required this.userInformation,
    required this.authentificationA,
    required this.authentificationR,
    required this.alarmeR,
    required this.alarmeA,
    required this.moteurA,
    required this.moteurR,
    required this.zoneDangereuseA,
    required this.zoneDangereuseR,
    required this.volR,
    required this.volA,
    required this.positionA,
    required this.positionR,
    required this.positionKit,
  });
 


 

  
   

 
  

  Kit copyWith({
    Users? userInformation,
    AuthentificationA? authentificationA,
    AuthentificationR? authentificationR,
    AlarmeR? alarmeR,
    AlarmeA? alarmeA,
    MoteurA? moteurA,
    MoteurR? moteurR,
    ZoneDangereuseA? zoneDangereuseA,
    ZoneDangereuseR? zoneDangereuseR,
    VolU? volR,
    VolA? volA,
    PositionA? positionA,
    PositionR? positionR,
    Position? positionKit,
  }) {
    return Kit(
      userInformation: userInformation ?? this.userInformation,
      authentificationA: authentificationA ?? this.authentificationA,
      authentificationR: authentificationR ?? this.authentificationR,
      alarmeR: alarmeR ?? this.alarmeR,
      alarmeA: alarmeA ?? this.alarmeA,
      moteurA: moteurA ?? this.moteurA,
      moteurR: moteurR ?? this.moteurR,
      zoneDangereuseA: zoneDangereuseA ?? this.zoneDangereuseA,
      zoneDangereuseR: zoneDangereuseR ?? this.zoneDangereuseR,
      volR: volR ?? this.volR,
      volA: volA ?? this.volA,
      positionA: positionA ?? this.positionA,
      positionR: positionR ?? this.positionR,
      positionKit: positionKit ?? this.positionKit,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userInformation': userInformation.toMap(),
      'authentificationA': authentificationA.toMap(),
      'authentificationR': authentificationR.toMap(),
      'alarmeR': alarmeR.toMap(),
      'alarmeA': alarmeA.toMap(),
      'moteurA': moteurA.toMap(),
      'moteurR': moteurR.toMap(),
      'zoneDangereuseA': zoneDangereuseA.toMap(),
      'zoneDangereuseR': zoneDangereuseR.toMap(),
      'volR': volR.toMap(),
      'volA': volA.toMap(),
      'positionA': positionA.toMap(),
      'positionR': positionR.toMap(),
      'positionKit': positionKit.toMap(),
    };
  }

  factory Kit.fromMap(Map<String, dynamic> map) {
    return Kit(
      userInformation: Users.fromMap(map['userInformation'] as Map<String,dynamic>),
      authentificationA: AuthentificationA.fromMap(map['authentificationA'] as Map<String,dynamic>),
      authentificationR: AuthentificationR.fromMap(map['authentificationR'] as Map<String,dynamic>),
      alarmeR: AlarmeR.fromMap(map['alarmeR'] as Map<String,dynamic>),
      alarmeA: AlarmeA.fromMap(map['alarmeA'] as Map<String,dynamic>),
      moteurA: MoteurA.fromMap(map['moteurA'] as Map<String,dynamic>),
      moteurR: MoteurR.fromMap(map['moteurR'] as Map<String,dynamic>),
      zoneDangereuseA: ZoneDangereuseA.fromMap(map['zoneDangereuseA'] as Map<String,dynamic>),
      zoneDangereuseR: ZoneDangereuseR.fromMap(map['zoneDangereuseR'] as Map<String,dynamic>),
      volR: VolU.fromMap(map['volR'] as Map<String,dynamic>),
      volA: VolA.fromMap(map['volA'] as Map<String,dynamic>),
      positionA: PositionA.fromMap(map['positionA'] as Map<String,dynamic>),
      positionR: PositionR.fromMap(map['positionR'] as Map<String,dynamic>),
      positionKit: Position.fromMap(map['positionKit'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Kit.fromJson(String source) => Kit.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Kit(userInformation: $userInformation, authentificationA: $authentificationA, authentificationR: $authentificationR, alarmeR: $alarmeR, alarmeA: $alarmeA, moteurA: $moteurA, moteurR: $moteurR, zoneDangereuseA: $zoneDangereuseA, zoneDangereuseR: $zoneDangereuseR, volR: $volR, volA: $volA, positionA: $positionA, positionR: $positionR, positionKit: $positionKit)';
  }

  @override
  bool operator ==(covariant Kit other) {
    if (identical(this, other)) return true;
  
    return 
      other.userInformation == userInformation &&
      other.authentificationA == authentificationA &&
      other.authentificationR == authentificationR &&
      other.alarmeR == alarmeR &&
      other.alarmeA == alarmeA &&
      other.moteurA == moteurA &&
      other.moteurR == moteurR &&
      other.zoneDangereuseA == zoneDangereuseA &&
      other.zoneDangereuseR == zoneDangereuseR &&
      other.volR == volR &&
      other.volA == volA &&
      other.positionA == positionA &&
      other.positionR == positionR &&
      other.positionKit == positionKit;
  }

  @override
  int get hashCode {
    return userInformation.hashCode ^
      authentificationA.hashCode ^
      authentificationR.hashCode ^
      alarmeR.hashCode ^
      alarmeA.hashCode ^
      moteurA.hashCode ^
      moteurR.hashCode ^
      zoneDangereuseA.hashCode ^
      zoneDangereuseR.hashCode ^
      volR.hashCode ^
      volA.hashCode ^
      positionA.hashCode ^
      positionR.hashCode ^
      positionKit.hashCode;
  }
}

class AlarmeR {
  final bool reception;

  AlarmeR(this.reception);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'reception': reception,
    };
  }

  factory AlarmeR.fromMap(Map<String, dynamic> map) {
    return AlarmeR(
      map['reception'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AlarmeR.fromJson(String source) =>
      AlarmeR.fromMap(json.decode(source) as Map<String, dynamic>);
}

class AlarmeA {
  final bool autorisation;

  AlarmeA(this.autorisation);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'autorisation': autorisation,
    };
  }

  factory AlarmeA.fromMap(Map<String, dynamic> map) {
    return AlarmeA(
      map['autorisation'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AlarmeA.fromJson(String source) =>
      AlarmeA.fromMap(json.decode(source) as Map<String, dynamic>);
}

class MoteurR {
  final bool reception;
  MoteurR({
    required this.reception,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'reception': reception,
    };
  }

  factory MoteurR.fromMap(Map<String, dynamic> map) {
    return MoteurR(
      reception: map['reception'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory MoteurR.fromJson(String source) =>
      MoteurR.fromMap(json.decode(source) as Map<String, dynamic>);
}

class MoteurA {
  final bool autorisation;

  MoteurA({
    required this.autorisation,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'autorisation': autorisation,
    };
  }

  factory MoteurA.fromMap(Map<String, dynamic> map) {
    return MoteurA(
      autorisation: map['autorisation'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory MoteurA.fromJson(String source) =>
      MoteurA.fromMap(json.decode(source) as Map<String, dynamic>);
}

class AuthentificationR{
  final bool reception;
  AuthentificationR({
    required this.reception,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'reception': reception,
    };
  }

  factory AuthentificationR.fromMap(Map<String, dynamic> map) {
    return AuthentificationR(
      reception: map['reception'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthentificationR.fromJson(String source) =>
      AuthentificationR.fromMap(json.decode(source) as Map<String, dynamic>);
}

class AuthentificationA {
  final bool autorisation;

  AuthentificationA({
    required this.autorisation,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'autorisation': autorisation,
    };
  }

  factory AuthentificationA.fromMap(Map<String, dynamic> map) {
    return AuthentificationA(
      autorisation: map['autorisation'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthentificationA.fromJson(String source) =>
      AuthentificationA.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ZoneDangereuseR {
  final bool reception;
  ZoneDangereuseR({
    required this.reception,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'reception': reception,
    };
  }

  factory ZoneDangereuseR.fromMap(Map<String, dynamic> map) {
    return ZoneDangereuseR(
      reception: map['reception'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ZoneDangereuseR.fromJson(String source) =>
      ZoneDangereuseR.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ZoneDangereuseA {
  final bool autorisation;

  ZoneDangereuseA({
    required this.autorisation,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'autorisation': autorisation,
    };
  }

  factory ZoneDangereuseA.fromMap(Map<String, dynamic> map) {
    return ZoneDangereuseA(
      autorisation: map['autorisation'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ZoneDangereuseA.fromJson(String source) =>
      ZoneDangereuseA.fromMap(json.decode(source) as Map<String, dynamic>);
}

class VolU {
  bool volActiveUser;

  VolU({
    required this.volActiveUser,
  });

  VolU copyWith({
    bool? volActiveUser,
  }) {
    return VolU(
      volActiveUser: volActiveUser ?? this.volActiveUser,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'volActiveUser': volActiveUser,
    };
  }

  factory VolU.fromMap(Map<String, dynamic> map) {
    return VolU(
      volActiveUser: map['volActiveUser'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory VolU.fromJson(String source) =>
      VolU.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'VolU(volActiveUser: $volActiveUser)';

  @override
  bool operator ==(covariant VolU other) {
    if (identical(this, other)) return true;

    return other.volActiveUser == volActiveUser;
  }

  @override
  int get hashCode => volActiveUser.hashCode;
}

class VolA {
  bool volActiveAdmin;
  VolA({
    required this.volActiveAdmin,
  });

  VolA copyWith({
    bool? volActiveAdmin,
  }) {
    return VolA(
      volActiveAdmin: volActiveAdmin ?? this.volActiveAdmin,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'volActiveAdmin': volActiveAdmin,
    };
  }

  factory VolA.fromMap(Map<String, dynamic> map) {
    return VolA(
      volActiveAdmin: map['volActiveAdmin'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory VolA.fromJson(String source) =>
      VolA.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'VolA(volActiveAdmin: $volActiveAdmin)';

  @override
  bool operator ==(covariant VolA other) {
    if (identical(this, other)) return true;

    return other.volActiveAdmin == volActiveAdmin;
  }

  @override
  int get hashCode => volActiveAdmin.hashCode;
}

class Position {
  final double? longitude;
  final double? lattude;
  Position({
    this.longitude,
    this.lattude,
  });

  Position copyWith({
    double? longitude,
    double? lattude,
  }) {
    return Position(
      longitude: longitude ?? this.longitude,
      lattude: lattude ?? this.lattude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'longitude': longitude,
      'lattude': lattude,
    };
  }

  factory Position.fromMap(Map<String, dynamic> map) {
    return Position(
      longitude: map['longitude'] != null ? map['longitude'] as double : null,
      lattude: map['lattude'] != null ? map['lattude'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Position.fromJson(String source) =>
      Position.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Position(longitude: $longitude, lattude: $lattude)';

  @override
  bool operator ==(covariant Position other) {
    if (identical(this, other)) return true;

    return other.longitude == longitude && other.lattude == lattude;
  }

  @override
  int get hashCode => longitude.hashCode ^ lattude.hashCode;
}

class PositionA {
  final bool autorisation;
  PositionA({
    required this.autorisation,
  });

  PositionA copyWith({
    bool? autorisation,
  }) {
    return PositionA(
      autorisation: autorisation ?? this.autorisation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'autorisation': autorisation,
    };
  }

  factory PositionA.fromMap(Map<String, dynamic> map) {
    return PositionA(
      autorisation: map['autorisation'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory PositionA.fromJson(String source) =>
      PositionA.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PositionA(autorisation: $autorisation)';

  @override
  bool operator ==(covariant PositionA other) {
    if (identical(this, other)) return true;

    return other.autorisation == autorisation;
  }

  @override
  int get hashCode => autorisation.hashCode;
}

class PositionR {
  final bool reception;
  PositionR({
    required this.reception,
  });

  PositionR copyWith({
    bool? reception,
  }) {
    return PositionR(
      reception: reception ?? this.reception,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'reception': reception,
    };
  }

  factory PositionR.fromMap(Map<String, dynamic> map) {
    return PositionR(
      reception: map['reception'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory PositionR.fromJson(String source) =>
      PositionR.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PositionR(reception: $reception)';

  @override
  bool operator ==(covariant PositionR other) {
    if (identical(this, other)) return true;

    return other.reception == reception;
  }

  @override
  int get hashCode => reception.hashCode;
}

class Users {
  final String? idUser;
  final String identifiant;
  final String password;
  Users({
    this.idUser,
    required this.identifiant,
    required this.password,
  });

  Users copyWith({
    String? idUser,
    String? identifiant,
    String? password,
  }) {
    return Users(
      idUser: idUser ?? this.idUser,
      identifiant: identifiant ?? this.identifiant,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idUser': idUser,
      'identifiant': identifiant,
      'password': password,
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      idUser: map['idUser'] != null ? map['idUser'] as String : null,
      identifiant: map['identifiant'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Users.fromJson(String source) =>
      Users.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'User(idUser: $idUser, identifiant: $identifiant, password: $password)';

  @override
  bool operator ==(covariant Users other) {
    if (identical(this, other)) return true;

    return other.idUser == idUser &&
        other.identifiant == identifiant &&
        other.password == password;
  }

  @override
  int get hashCode =>
      idUser.hashCode ^ identifiant.hashCode ^ password.hashCode;
}
