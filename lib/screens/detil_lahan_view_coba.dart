import 'package:flutter/material.dart';
import 'package:saa_asset_management_frontend/core/theme.dart';

class DetilLahanView extends StatelessWidget {
  final Map<String, dynamic> data;

  const DetilLahanView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF3F6F8),
      padding: const EdgeInsets.all(32.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
// kolom kiri
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: DecorationImage(
                  image: AssetImage(data['image']), 
                  fit: BoxFit.cover,
                ),
              ),
              child: const Center(child: Text('Area Gambar', style: TextStyle(color: Colors.white))),
            ),
          ),
          
          const SizedBox(width: 24),
//kolom kanan
          Expanded(
            flex: 6,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Detil: ${data['name']}', style: AppTextStyles.heading2),
                  const SizedBox(height: 16),
                  Text('Penanggungjawab: ${data['pic']}'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}