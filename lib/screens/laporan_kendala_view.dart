import 'package:flutter/material.dart';
import 'package:saa_asset_management_frontend/core/theme.dart';

class LaporanKendalaView extends StatelessWidget {
  const LaporanKendalaView({super.key});

  final List<Map<String, dynamic>> dummyKendala = const [
    {
      'tanggal': '17-08-2005',
      'lahan': 'Blok A - Malang',
      'kategori': 'Hama & Penyakit',
      'urgensi': 'Tinggi',
      'status': 'Belum Ditangani',
      'deskripsi': 'Serangan ulat grayak di area utara lahan.',
    },
    {
      'tanggal': '18-08-2005',
      'lahan': 'Blok B - Malang',
      'kategori': 'Hama & Penyakit',
      'urgensi': 'Sedang',
      'status': 'Dalam Penanganan',
      'deskripsi': 'Ditemukan bercak daun pada tanaman di sisi timur.',
    },
    {
      'tanggal': '19-08-2005',
      'lahan': 'Blok C - Batu',
      'kategori': 'Irigasi',
      'urgensi': 'Tinggi',
      'status': 'Belum Ditangani',
      'deskripsi': 'Saluran irigasi tersumbat setelah hujan deras.',
    },
    {
      'tanggal': '20-08-2005',
      'lahan': 'Blok A - Malang',
      'kategori': 'Pemupukan',
      'urgensi': 'Rendah',
      'status': 'Selesai',
      'deskripsi': 'Pemupukan susulan telah dilakukan sesuai jadwal.',
    },
    {
      'tanggal': '21-08-2005',
      'lahan': 'Blok D - Kepanjen',
      'kategori': 'Hama & Penyakit',
      'urgensi': 'Tinggi',
      'status': 'Dalam Penanganan',
      'deskripsi': 'Serangan kutu daun terdeteksi pada tanaman muda.',
    },
    {
      'tanggal': '22-08-2005',
      'lahan': 'Blok B - Malang',
      'kategori': 'Kondisi Tanah',
      'urgensi': 'Sedang',
      'status': 'Belum Ditangani',
      'deskripsi': 'Kelembapan tanah menurun di area selatan lahan.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteGreen,
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Laporan Insiden / Kendala', style: AppTextStyles.heading3Bold),
          const SizedBox(height: 24),
          
          Row(
            children: [
              _buildDropdownFilter('Kategori'),
              const SizedBox(width: 12),
              _buildDropdownFilter('Urgensi'),
              const SizedBox(width: 12),
              _buildDropdownFilter('Status'),
              const SizedBox(width: 12),
              _buildDropdownFilter('Lahan'),
              const SizedBox(width: 12),
              _buildDateFilter(),
              const Spacer(),
              _buildExportButton(),
            ],
          ),
          const SizedBox(height: 24),

          Expanded(
            child: Column(
              children: [
                _buildTableHeader([
                  'Tanggal Lapor', 
                  'Nama Lahan', 
                  'Kategori Kendala', 
                  'Tingkat Urgensi', 
                  'Status Penyelesaian', 
                  'Deskripsi Kendala'
                ]),
                Expanded(
                  child: ListView.builder(
                    itemCount: dummyKendala.length,
                    itemBuilder: (context, index) {
                      final data = dummyKendala[index];
                      final isLast = index == dummyKendala.length - 1;
                      
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: isLast 
                              ? const BorderRadius.vertical(bottom: Radius.circular(8)) 
                              : BorderRadius.zero,
                          border: Border(
                            left: BorderSide(color: Colors.grey.shade300),
                            right: BorderSide(color: Colors.grey.shade300),
                            bottom: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(flex: 2, child: Text(data['tanggal'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                            Expanded(flex: 2, child: Text(data['lahan'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                            Expanded(flex: 2, child: Text(data['kategori'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                            Expanded(flex: 2, child: _buildUrgensiText(data['urgensi'])),
                            Expanded(flex: 2, child: _buildStatusText(data['status'])),
                            Expanded(flex: 4, child: Text(data['deskripsi'], style: AppTextStyles.body.copyWith(fontSize: 14, color: Colors.grey.shade700))),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownFilter(String hint) {
    return Container(
      width: 130, 
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(hint, style: TextStyle(color: Colors.grey.shade600, fontSize: 12), overflow: TextOverflow.ellipsis)),
          Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade600, size: 16),
        ],
      ),
    );
  }

  Widget _buildDateFilter() {
    return Container(
      width: 130,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Tanggal', style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
          Icon(Icons.calendar_today_outlined, color: Colors.grey.shade600, size: 14),
        ],
      ),
    );
  }

  Widget _buildExportButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.darkgreen,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const Text('Export', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
            const SizedBox(width: 8),
            const Icon(Icons.file_upload_outlined, color: Colors.white, size: 18),
          ],
        ),
      ),
    );
  }

  Widget _buildTableHeader(List<String> columns) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
      ),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(columns[0], style: AppTextStyles.bodyBold.copyWith(fontSize: 14))),
          Expanded(flex: 2, child: Text(columns[1], style: AppTextStyles.bodyBold.copyWith(fontSize: 14))),
          Expanded(flex: 2, child: Text(columns[2], style: AppTextStyles.bodyBold.copyWith(fontSize: 14))),
          Expanded(flex: 2, child: Text(columns[3], style: AppTextStyles.bodyBold.copyWith(fontSize: 14))),
          Expanded(flex: 2, child: Text(columns[4], style: AppTextStyles.bodyBold.copyWith(fontSize: 14))),
          Expanded(flex: 4, child: Text(columns[5], style: AppTextStyles.bodyBold.copyWith(fontSize: 14))),
        ],
      ),
    );
  }

  Widget _buildUrgensiText(String urgensi) {
    Color textColor = Colors.grey.shade800;
    if (urgensi == 'Tinggi') textColor = Colors.red.shade700;
    else if (urgensi == 'Sedang') textColor = Colors.orange.shade700;
    else if (urgensi == 'Rendah') textColor = Colors.green.shade700;

    return Text(urgensi, style: AppTextStyles.body.copyWith(fontSize: 14, color: textColor));
  }

  Widget _buildStatusText(String status) {
    return Text(status, style: AppTextStyles.body.copyWith(fontSize: 14));
  }
}