import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:saa_asset_management_frontend/core/theme.dart';

class DaftarTimLapanganView extends StatelessWidget {
  const DaftarTimLapanganView({super.key});

  final List<Map<String, dynamic>> dummyPegawai = const [
    {
      'name': 'Yanto Siregar',
      'totalLahan': '3',
      'status' : 'Aktif',
      'image': 'assets/images/pegawai_dummy.png',
      // modal data
      'email': 'yantosiregar@email.com',
      'kontak': '0812-3456-7890',
      'nik': '357000111222333',
      'lahan_dikelola': ['Lahan Sumbermulyo', 'Lahan Sukamakmur', 'Lahan Sukasuka' ], 
    },
    {
      'name': 'Yono Sialagan',
      'totalLahan': '1',
      'status' : 'Aktif 2 menit yang lalu',
      'image': 'assets/images/pegawai_dummy.png',
      // modal data
      'email': 'yantosiregar@email.com',
      'kontak': '0812-3456-7890',
      'nik': '357000111222333',
      'lahan_dikelola': ['Lahan Sumbermulyo'], 
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteGreen, 
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32, top: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dummyPegawai.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, 
                  crossAxisSpacing: 24, 
                  mainAxisSpacing: 24, 
                  childAspectRatio: 1, 
                ),
                itemBuilder: (context, index) {
                  final data = dummyPegawai[index];
                  return InkWell(
                    onTap: () => _showDetailModal(context, data),
                    borderRadius: BorderRadius.circular(16),
                    child: _buildLahanCard(data),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLahanCard(Map<String, dynamic> data) {
    bool isActive = data['status'] == 'Aktif';
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [AppShadow.shadow1] 
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.darkgreen, 
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(data['image'] ?? 'assets/images/pegawai_dummy.png'),
          ),
        
          Positioned(
            bottom: 0, left: 0, right: 0,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['name'],
                    style: AppTextStyles.bodyBold.copyWith(fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Text( 
                    'Total lahan dikelola : ${data['totalLahan']}',
                    style: AppTextStyles.body.copyWith(fontSize: 12, color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: isActive ? const Color(0xFFE8F5E9) : AppColors.textDark.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      data['status'],
                      style: AppTextStyles.body.copyWith(fontSize: 10, color: AppColors.darkgreen),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDetailModal(BuildContext context, Map<String, dynamic> data) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4), 
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Dialog(
            backgroundColor: Colors.transparent, 
            elevation: 0,
            child: _buildModalContent(context, data),
          ),
        );
      },
    );
  }

  Widget _buildModalContent(BuildContext context, Map<String, dynamic> data) {
    return Container(
      width: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 140,
            decoration: const BoxDecoration(
              color: AppColors.darkgreen,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
          ),
          
          Positioned(
            top: 16, right: 16,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(
                      'assets/icons/ic_close.svg',
                      width: 24,
                      colorFilter: const ColorFilter.mode(
                        AppColors.white,
                        BlendMode.srcIn,
                      ),
                    ),
            ),
          ),
          
          const Positioned(
            top: 24, left: 0, right: 0,
            child: Center(
              child: Text('Detail Penanggungjawab', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 200, left: 32, right: 32, bottom: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min, 
              children: [
                Text(data['name'], style: AppTextStyles.heading2.copyWith(fontSize: 16)),
                const SizedBox(height: 24),
                
                Table(
                  columnWidths: const {
                    0: FixedColumnWidth(110), 
                    1: FlexColumnWidth(),
                  },
                  children: [
                    _buildTableRow('Email', data['email'] ?? '-'),
                    _buildTableRow('Nomor Kontak', data['kontak'] ?? '-'),
                    _buildTableRow('NIK', data['nik'] ?? '-'),
                  ],
                ),
                
                const SizedBox(height: 24),
                Text('Lahan Yang di Kelola', style: AppTextStyles.bodyBold.copyWith(fontSize: 13)),
                const SizedBox(height: 12),
                
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: (data['lahan_dikelola'] as List<String>? ?? []).map((lahan) {
                    return Container(
                      width: 150, 
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.darkgreen,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(child: Text(lahan, style: const TextStyle(color: Colors.white, fontSize: 12))),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          Positioned(
            top: 80, 
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 100, height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.khaki, 
                  image: DecorationImage(
                    image: AssetImage(data['image'] ?? 'assets/images/pegawai_dummy.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TableRow _buildTableRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(label, style: AppTextStyles.body.copyWith(color: Colors.grey.shade700, fontSize: 12)),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(': $value', style: AppTextStyles.body.copyWith(color: Colors.grey.shade800, fontSize: 12)),
        ),
      ],
    );
  }
}