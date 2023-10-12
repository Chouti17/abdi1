class Personne {
  String? uid;
  String nom;
  String prenom;
  String email;
  String numero;
  String passUser;
  String date;
  String idKit;
  String passKit;
  Personne(this.uid,
      {required this.prenom,
      required this.idKit,
      required this.passKit,
      required this.date,
      required this.numero,
      required this.email,
      required this.passUser,
      required this.nom});
  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'nom': nom,
        'prenom': prenom,
        'numero': numero,
        'passUser': passUser,
        'date': date,
        'idKit': idKit,
        'passKit':passKit,
      };
}
