import 'package:flutter/material.dart';
import 'package:saa_asset_management_frontend/core/theme.dart';
import 'package:saa_asset_management_frontend/service/lahan_service.dart';

class DaftarLahanView extends StatefulWidget {
  final Function(Map<String, dynamic>) onLahanTapped; 

  const DaftarLahanView({super.key, required this.onLahanTapped});

  @override
  State<DaftarLahanView> createState() => _DaftarLahanViewState();
}

class _DaftarLahanViewState extends State<DaftarLahanView> {
  final LahanService _lahanService = LahanService();
  late Future<List> _futureLahan;

  @override
  void initState() {
    super.initState();
    _futureLahan = _lahanService.fetchLahan();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteGreen,
      child: FutureBuilder<List>(
        future: _futureLahan,
        builder: (context, snapshot) {
          // 1. Kondisi saat masih loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.darkgreen),
            );
          } 
          
          // 2. Kondisi jika terjadi error
          else if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  'Terjadi kesalahan: ${snapshot.error}',
                  style: AppTextStyles.body.copyWith(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          } 
          
          // 3. Kondisi jika data kosong
          final lahanList = snapshot.data ?? [];
          if (lahanList.isEmpty) {
            return Center(
              child: Text(
                'Belum ada data lahan tersedia.',
                style: AppTextStyles.body.copyWith(color: Colors.grey.shade700),
              ),
            );
          }

          // 4. Kondisi data berhasil dimuat (Tampilkan GridView)
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: lahanList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, 
                      crossAxisSpacing: 24, 
                      mainAxisSpacing: 24, 
                      childAspectRatio: 0.75, 
                    ),
                    itemBuilder: (context, index) {
                      final data = lahanList[index];
                      return InkWell(
                        onTap: () {
                          widget.onLahanTapped(data);
                        },
                        child: _buildLahanCard(data),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLahanCard(Map<String, dynamic> data) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          AppShadow.shadow1
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(data['image'], fit: BoxFit.cover, width: double.infinity, height: double.infinity),
          ),
        
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Nama Lahan & Lokasi
                  Text(
                    data['name'],
                    style: AppTextStyles.bodyBold.copyWith(fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    data['location'],
                    style: AppTextStyles.body.copyWith(fontSize: 12, color: Colors.grey.shade700),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Penanggung Jawab
                  Text(
                    data['pic'],
                    style: AppTextStyles.body.copyWith(fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Komoditas / Info Tambahan
                  Wrap(
                    spacing: 8.0, 
                    runSpacing: 8.0, 
                    children: (data['commodities'] as List).map((komoditas) {
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
                              komoditas['name'],
                              style: AppTextStyles.body.copyWith(fontSize: 10, color: AppColors.darkgreen),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              komoditas['percentage'],
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