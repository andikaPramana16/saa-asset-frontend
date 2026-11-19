import 'package:saa_asset_management_frontend/models/kondisi_lingkungan.dart';

class Komoditas {
  final String nama;
  final String persentase;

  const Komoditas({required this.nama, required this.persentase});

  factory Komoditas.fromJson(Map<String, dynamic> json) {
    final persen = (json['PersentaseKomoditas'] ?? 0) as num;
    return Komoditas(
      nama: (json['Komoditas'] ?? '-') as String,
      persentase: '${persen == persen.truncate() ? persen.truncate() : persen}%',
    );
  }
}

class Lahan {
  final int id;
  final int idPenanggungJawab;
  final String namaLahan;
  final String alamat;
  final String koordinat;
  final double luasLahan;
  final double nilaiLahan;
  final String deskripsi;

  final String? namaPenanggungJawab;

  final List<Komoditas> komoditas;

  final KondisiLingkungan? kondisi;

  final String gambar;

  const Lahan({
    required this.id,
    required this.idPenanggungJawab,
    required this.namaLahan,
    required this.alamat,
    required this.koordinat,
    required this.luasLahan,
    required this.nilaiLahan,
    required this.deskripsi,
    this.namaPenanggungJawab,
    this.komoditas = const [],
    this.kondisi,
    this.gambar = 'assets/images/lahan_dummy.png',
  });

  factory Lahan.fromJson(
    Map<String, dynamic> json, {
    String? namaPenanggungJawab,
    KondisiLingkungan? kondisi,
  }) {
    return Lahan(
      id: json['Id'] as int,
      idPenanggungJawab: (json['IdPenanggungJawab'] ?? 0) as int,
      namaLahan: (json['NamaLahan'] ?? '-') as String,
      alamat: (json['Alamat'] ?? '-') as String,
      koordinat: (json['Koordinat'] ?? '') as String,
      luasLahan: ((json['LuasLahan'] ?? 0) as num).toDouble(),
      nilaiLahan: ((json['NilaiLahan'] ?? 0) as num).toDouble(),
      deskripsi: (json['Deskripsi'] ?? '') as String,
      namaPenanggungJawab: namaPenanggungJawab,
      kondisi: kondisi,
      komoditas: ((json['Komoditas'] as List?) ?? [])
          .map((k) => Komoditas.fromJson(k as Map<String, dynamic>))
          .toList(),
    );
  }

  String get nilaiLahanTampil => 'Rp. ${_ribuan(nilaiLahan)}';

  String get luasLahanTampil => '${_ribuan(luasLahan)} m²';

  String get koordinatTampil {
    final bagian = koordinat.split(',').map((e) => e.trim()).toList();
    if (bagian.length == 2 &&
        double.tryParse(bagian[0]) != null &&
        double.tryParse(bagian[1]) != null) {
      return 'Latitude : ${bagian[0]}\nLongitude : ${bagian[1]}';
    }
    return koordinat.isEmpty ? '-' : koordinat;
  }

  static String _ribuan(double angka) {
    final bulat = angka.round().toString();
    final buffer = StringBuffer();
    for (var i = 0; i < bulat.length; i++) {
      if (i > 0 && (bulat.length - i) % 3 == 0) buffer.write('.');
      buffer.write(bulat[i]);
    }
    return buffer.toString();
  }
}
