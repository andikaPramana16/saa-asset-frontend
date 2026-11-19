class KondisiLingkungan {
  final int idLahan;
  final double nilaiPh;
  final double suhuTanah;
  final double kelembapanTanah;
  final DateTime? tanggal;

  const KondisiLingkungan({
    required this.idLahan,
    required this.nilaiPh,
    required this.suhuTanah,
    required this.kelembapanTanah,
    this.tanggal,
  });

  factory KondisiLingkungan.fromJson(Map<String, dynamic> json) {
    return KondisiLingkungan(
      idLahan: json['IdLahan'] as int,
      nilaiPh: ((json['NilaiPh'] ?? 0) as num).toDouble(),
      suhuTanah: ((json['SuhuTanah'] ?? 0) as num).toDouble(),
      kelembapanTanah: ((json['KelembapanTanah'] ?? 0) as num).toDouble(),
      tanggal: DateTime.tryParse(((json['Tanggal'] ?? '') as String).replaceFirst(' ', 'T')),
    );
  }

  static String formatAngka(double v) {
    final teks = v == v.truncate() ? v.truncate().toString() : v.toString();
    return teks.replaceAll('.', ',');
  }
}
