import 'package:saa_asset_management_frontend/models/kondisi_lingkungan.dart';
import 'package:saa_asset_management_frontend/models/lahan.dart';
import 'package:saa_asset_management_frontend/models/user.dart';
import 'package:saa_asset_management_frontend/services/api_service.dart';

class LahanService {
  static Future<List<Lahan>> fetchDaftarLahan() async {
    final results = await Future.wait([
      ApiService.getList('/lahan'),
      ApiService.getList('/user'),
      ApiService.getList('/kondisilingkungan').catchError((_) => <Map<String, dynamic>>[]),
    ]);

    final users = results[1].map(User.fromJson);
    final namaUser = {for (final u in users) u.idUser: u.namaUser};

    final kondisiTerbaru = _kondisiTerbaruPerLahan(results[2]);

    return results[0].map((json) {
      final nama = namaUser[json['IdPenanggungJawab']];
      return Lahan.fromJson(
        json,
        namaPenanggungJawab: (nama == null || nama.isEmpty) ? null : nama,
        kondisi: kondisiTerbaru[json['Id']],
      );
    }).toList();
  }

  static Map<int, KondisiLingkungan> _kondisiTerbaruPerLahan(List<Map<String, dynamic>> data) {
    final hasil = <int, KondisiLingkungan>{};
    for (final json in data) {
      final k = KondisiLingkungan.fromJson(json);
      final lama = hasil[k.idLahan];
      final lebihBaru = lama == null ||
          (k.tanggal != null && (lama.tanggal == null || k.tanggal!.isAfter(lama.tanggal!)));
      if (lebihBaru) hasil[k.idLahan] = k;
    }
    return hasil;
  }
}
