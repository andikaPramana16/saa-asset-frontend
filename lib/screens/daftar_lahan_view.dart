import 'package:flutter/material.dart';
import 'package:saa_asset_management_frontend/core/theme.dart';

class DaftarLahanView extends StatelessWidget {
  const DaftarLahanView({super.key});

  final List<Map<String, dynamic>> dummyLahan = const [
    {
      'name': 'Lahan Sumbermulyo',
      'location': 'Malang',
      'pic': 'Yanto',
      'image': 'assets/images/lahan_dummy.png',
      'commodities': [
        {'name': 'Kentang', 'percentage': '25%'},
        {'name': 'Padi', 'percentage': '25%'},
        {'name': 'Jagung', 'percentage': '25%'},
        {'name': 'Cabai', 'percentage': '25%'},
      ],
    },
    {
      'name': 'Lahan Sukamakmur',
      'location': 'Malang',
      'pic': 'Yanto',
      'image': 'assets/images/lahan_dummy.png',
      'commodities': [
        {'name': 'Kentang', 'percentage': '25%'},
        {'name': 'Padi', 'percentage': '25%'},
        {'name': 'Jagung', 'percentage': '50%'},
      ],
    },
    {
      'name': 'Lahan Singosari',
      'location': 'Malang',
      'pic': 'Budi',
      'image': 'assets/images/lahan_dummy.png',
      'commodities': [
        {'name': 'Tebu', 'percentage': '100%'},
      ],
    },
    {
      'name': 'Lahan Pujon',
      'location': 'Batu',
      'pic': 'Siti',
      'image': 'assets/images/lahan_dummy.png',
      'commodities': [
        {'name': 'Wortel', 'percentage': '60%'},
        {'name': 'Kubis', 'percentage': '40%'},
      ],
    },
    {
      'name': 'Lahan Sumbermulyo',
      'location': 'Malang',
      'pic': 'Yanto',
      'image': 'assets/images/lahan_dummy.png',
      'commodities': [
        {'name': 'Kentang', 'percentage': '25%'},
        {'name': 'Padi', 'percentage': '25%'},
        {'name': 'Jagung', 'percentage': '50%'},
      ],
    },
    {
      'name': 'Lahan Sukamakmur',
      'location': 'Malang',
      'pic': 'Yanto',
      'image': 'assets/images/lahan_dummy.png',
      'commodities': [
        {'name': 'Kentang', 'percentage': '25%'},
        {'name': 'Padi', 'percentage': '25%'},
        {'name': 'Jagung', 'percentage': '50%'},
      ],
    },
    {
      'name': 'Lahan Singosari',
      'location': 'Malang',
      'pic': 'Budi',
      'image': 'assets/images/lahan_dummy.png',
      'commodities': [
        {'name': 'Tebu', 'percentage': '100%'},
      ],
    },
    {
      'name': 'Lahan Pujon',
      'location': 'Batu',
      'pic': 'Siti',
      'image': 'assets/images/lahan_dummy.png',
      'commodities': [
        {'name': 'Wortel', 'percentage': '60%'},
        {'name': 'Kubis', 'percentage': '40%'},
      ],
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
                itemCount: dummyLahan.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, 
                  crossAxisSpacing: 24, 
                  mainAxisSpacing: 24, 
                  childAspectRatio: 0.75, 
                ),
                itemBuilder: (context, index) {
                  final data = dummyLahan[index];
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
    return Stack(
      children: [
        ClipRRect(borderRadius: BorderRadiusGeometry.circular(24),
          child: Image.asset(data['image'], fit: BoxFit.fill,)),
  
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
                  data['name'],
                  style: AppTextStyles.bodyBold.copyWith(fontSize: 14),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  data['location'],
                  style: AppTextStyles.body.copyWith(fontSize: 12, color: Colors.grey.shade700),
                ),
                
                const SizedBox(height: 12),
                
                // Penanggung Jawab
                Text(
                  'Penanggungjawab : ${data['pic']}',
                  style: AppTextStyles.body.copyWith(fontSize: 12),
                ),
                
                const SizedBox(height: 12),
                
                //Komoditas
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
    );
  }
}