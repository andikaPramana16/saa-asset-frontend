import 'package:flutter/material.dart';
import 'package:saa_asset_management_frontend/core/theme.dart';


import 'package:saa_asset_management_frontend/models/lahan.dart';
import 'package:saa_asset_management_frontend/services/lahan_service.dart';

class DaftarLahanView extends StatefulWidget {
  final Function(Lahan) onLahanTapped;

  const DaftarLahanView({super.key, required this.onLahanTapped});

  @override
  State<DaftarLahanView> createState() => _DaftarLahanViewState();
}

class _DaftarLahanViewState extends State<DaftarLahanView> {
  late Future<List<Lahan>> _futureLahan;

  @override
  void initState() {
    super.initState();
    _futureLahan = LahanService.fetchDaftarLahan();
  }

  void _muatUlang() {
    setState(() {
      _futureLahan = LahanService.fetchDaftarLahan();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteGreen,
      child: FutureBuilder<List<Lahan>>(
        future: _futureLahan,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Gagal memuat data lahan', style: AppTextStyles.bodyBold),
                  const SizedBox(height: 8),
                  Text('${snapshot.error}', style: AppTextStyles.body.copyWith(fontSize: 12)),
                  const SizedBox(height: 16),
                  ElevatedButton(onPressed: _muatUlang, child: const Text('Coba lagi')),
                ],
              ),
            );
          }

          final daftarLahan = snapshot.data ?? [];
          if (daftarLahan.isEmpty) {
            return Center(child: Text('Belum ada data lahan', style: AppTextStyles.body));
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: daftarLahan.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final data = daftarLahan[index];
                  return InkWell(
                    onTap: () => widget.onLahanTapped(data),
                    child: _buildLahanCard(data),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }


  Widget _buildLahanCard(Lahan lahan) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          AppShadow.shadow1
        ]
      ),
      child: Stack(
        children: [
          ClipRRect(borderRadius: BorderRadiusGeometry.circular(16),
            child: Image.asset(lahan.gambar,fit: BoxFit.cover)),
        
          Positioned(
            bottom: 0, 
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama Lahan & Lokasi
                  Text(
                    lahan.namaLahan,
                    style: AppTextStyles.bodyBold.copyWith(fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    lahan.alamat,
                    style: AppTextStyles.body.copyWith(fontSize: 12, color: Colors.grey.shade700),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Penanggung Jawab
                  Text(
                    'Penanggungjawab : ${lahan.namaPenanggungJawab ?? 'Belum ada PIC'}',
                    style: AppTextStyles.body.copyWith(fontSize: 12),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  //Komoditas
                  Wrap(
                    spacing: 8.0, 
                    runSpacing: 8.0, 
                    children: lahan.komoditas.map((komoditas) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8F5E9), 
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              komoditas.nama,
                              style: AppTextStyles.body.copyWith(fontSize: 10, color: AppColors.darkgreen),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              komoditas.persentase,
                              style: AppTextStyles.bodyBold.copyWith(fontSize: 10, color: AppColors.darkgreen),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}