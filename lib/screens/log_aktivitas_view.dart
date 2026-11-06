import 'package:flutter/material.dart';
import 'package:saa_asset_management_frontend/core/theme.dart';

class LogAktivitasView extends StatelessWidget {
  const LogAktivitasView({super.key});

  final List<Map<String, dynamic>> dummyLogAktivitas = const [
    {
      'tanggal': '17-08-2005',
      'blok_lahan': 'Blok A',
      'kategori': 'Perawatan',
      'pic': 'Yanto Siregar',
      'material': 'Pupuk NPK Mutiara',
      'jumlah': '15',
      'satuan': 'Kg',
      'deskripsi': 'Pemupukan susulan di area utara untuk memacu pertumbuhan daun.',
    },
    {
      'tanggal': '18-08-2005',
      'blok_lahan': 'Blok B',
      'kategori': 'Perawatan',
      'pic': 'Budi Santoso',
      'material': 'Pupuk Urea',
      'jumlah': '20',
      'satuan': 'Kg',
      'deskripsi': 'Pemupukan untuk mendukung pertumbuhan tanaman.',
    },
    {
      'tanggal': '19-08-2005',
      'blok_lahan': 'Blok C',
      'kategori': 'Penyiraman',
      'pic': 'Agus Wijaya',
      'material': 'Air',
      'jumlah': '250',
      'satuan': 'Liter',
      'deskripsi': 'Penyiraman pagi pada area yang kering.',
    },
    {
      'tanggal': '20-08-2005',
      'blok_lahan': 'Blok D',
      'kategori': 'Penanaman',
      'pic': 'Dedi Saputra',
      'material': 'Bibit Jagung',
      'jumlah': '150',
      'satuan': 'Bibit',
      'deskripsi': 'Penanaman bibit pada lahan yang telah disiapkan.',
    },
    {
      'tanggal': '21-08-2005',
      'blok_lahan': 'Blok E',
      'kategori': 'Perawatan',
      'pic': 'Rina Lestari',
      'material': 'Pupuk Kompos',
      'jumlah': '30',
      'satuan': 'Kg',
      'deskripsi': 'Penambahan kompos untuk memperbaiki tanah.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteGreen,
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Log Aktivitas Lapangan', style: AppTextStyles.heading3Bold),
          const SizedBox(height: 4),
          Text('Sektor Barat Malang', style: AppTextStyles.subHeading),
          const SizedBox(height: 24),
          
          Row(
            children: [
              _buildDropdownFilter('Kategori'),
              const SizedBox(width: 16),
              _buildDropdownFilter('Blok Lahan'),
              const SizedBox(width: 16),
              _buildDateFilter(),
            ],
          ),
          const SizedBox(height: 24),

          Expanded(
            child: Column(
              children: [
                _buildTableHeader([
                  'Tanggal', 
                  'Blok Lahan', 
                  'Kategori Aktivitas', 
                  'Penanggungjawab', 
                  'Material Terpakai', 
                  'Jumlah', 
                  'Satuan', 
                  'Deskripsi'
                ]),
                Expanded(
                  child: ListView.builder(
                    itemCount: dummyLogAktivitas.length,
                    itemBuilder: (context, index) {
                      final data = dummyLogAktivitas[index];
                      final isLast = index == dummyLogAktivitas.length - 1;
                      
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
                          children: [
                            Expanded(flex: 2, child: Text(data['tanggal'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                            Expanded(flex: 2, child: Text(data['blok_lahan'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                            Expanded(flex: 2, child: Text(data['kategori'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                            Expanded(flex: 2, child: Text(data['pic'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                            Expanded(flex: 2, child: Text(data['material'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                            Expanded(flex: 1, child: Text(data['jumlah'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                            Expanded(flex: 1, child: Text(data['satuan'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                            Expanded(flex: 3, child: Text(data['deskripsi'], style: AppTextStyles.body.copyWith(fontSize: 14))),
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
      width: 160,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(hint, style: TextStyle(color: Colors.grey.shade600)),
          Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade600),
        ],
      ),
    );
  }

  Widget _buildDateFilter() {
    return Container(
      width: 160,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Tanggal', style: TextStyle(color: Colors.grey.shade600)),
          Icon(Icons.calendar_today_outlined, color: Colors.grey.shade600),
        ],
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
          Expanded(flex: 1, child: Text(columns[5], style: AppTextStyles.bodyBold.copyWith(fontSize: 14))),
          Expanded(flex: 1, child: Text(columns[6], style: AppTextStyles.bodyBold.copyWith(fontSize: 14))),
          Expanded(flex: 3, child: Text(columns[7], style: AppTextStyles.bodyBold.copyWith(fontSize: 14))),
        ],
      ),
    );
  }
}