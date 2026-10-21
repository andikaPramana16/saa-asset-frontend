import 'package:flutter/material.dart';
import 'package:saa_asset_management_frontend/core/theme.dart';

class DaftarTimLapanganView extends StatelessWidget {
  const DaftarTimLapanganView({super.key});

  final List<Map<String, dynamic>> dummyPegawai = const [
    {
      'name': 'Yanto Siregar',
      'totalLahan': '1',
      'status' : 'Aktif',
      'image': 'assets/images/pegawai_dummy.png',
    },
    {
      'name': 'Yono Sialagan',
      'totalLahan': '2',
      'status' : 'Aktif terakhir 2m lalu',
      'image': 'assets/images/pegawai_dummy.png',
    },
    {
      'name': 'Yanto Siregar',
      'totalLahan': '1',
      'status' : 'Aktif',
      'image': 'assets/images/pegawai_dummy.png',
    },
    {
      'name': 'Yanto Siregar',
      'totalLahan': '1',
      'status' : 'Aktif',
      'image': 'assets/images/pegawai_dummy.png',
    },
    {
      'name': 'Yanto Siregar',
      'totalLahan': '1',
      'status' : 'Aktif',
      'image': 'assets/images/pegawai_dummy.png',
    },
    {
      'name': 'Yanto Siregar',
      'totalLahan': '1',
      'status' : 'Aktif',
      'image': 'assets/images/pegawai_dummy.png',
    },
    {
      'name': 'Yanto Siregar',
      'totalLahan': '1',
      'status' : 'Aktif',
      'image': 'assets/images/pegawai_dummy.png',
    },
    {
      'name': 'Yanto Siregar',
      'totalLahan': '1',
      'status' : 'Aktif',
      'image': 'assets/images/pegawai_dummy.png',
    },
    
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteGreen,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: dummyPegawai.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, 
                  crossAxisSpacing: 24, 
                  mainAxisSpacing: 24, 
                  childAspectRatio: 1, 
                ),
                itemBuilder: (context, index) {
                  final data = dummyPegawai[index];
                  return _buildLahanCard(data);
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
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.darkgreen,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.asset(data['image']),
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
              children: [
                // Nama & Total lahan
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
                
                //Status
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: isActive ?  Color(0xFFE8F5E9) : AppColors.textDark.withValues(alpha: 0.1),
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
    );
  }
}