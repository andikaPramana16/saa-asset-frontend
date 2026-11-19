class User {
  final int idUser;
  final String namaUser;
  final String email;
  final String noKontak;
  final String nik;

  const User({
    required this.idUser,
    required this.namaUser,
    required this.email,
    required this.noKontak,
    required this.nik,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        idUser: json['idUser'] as int,
        namaUser: (json['namaUser'] ?? '') as String,
        email: (json['email'] ?? '') as String,
        noKontak: (json['noKontak'] ?? '') as String,
        nik: (json['nik'] ?? '') as String,
      );
}
