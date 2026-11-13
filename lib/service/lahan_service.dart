import 'dart:convert';
import 'package:http/http.dart' as http;

class LahanService {
  final String baseUrl = "http://localhost:1234"; // Sesuaikan jika menggunakan emulator/device asli

  Future<List> fetchLahan() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/lahan'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        
        // Mengambil array data dari key 'data' sesuai struktur Response Go
        List<dynamic> listData = jsonResponse['data'] ?? [];
        
        return listData.map((item) => {
          'id': item['Id'],
          'name': item['NamaLahan'] ?? 'Tanpa Nama',
          'location': item['Alamat'] ?? '-',
          'pic': 'Penanggung Jawab ID: ${item['IdPenanggungJawab'] ?? '-'}', // Bisa disesuaikan
          'image': 'assets/images/lahan_dummy.png', // Gambar aset statis
          'commodities': [
            {'name': 'Lahan Aktif', 'percentage': '${item['LuasLahan']} Ha'}, // Contoh mapping data angka
          ],
        }).toList();
      } else {
        throw Exception('Gagal memuat data lahan dari server');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan: $e');
    }
  }
}