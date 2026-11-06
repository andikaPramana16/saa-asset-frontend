import 'package:flutter/material.dart';
import 'package:saa_asset_management_frontend/core/theme.dart';

class LaporanAliranLogistikView extends StatelessWidget {
  const LaporanAliranLogistikView({super.key});

  final List<Map<String, dynamic>> dummyAliranLogistik = const [
    {
      'tanggal': '17-08-2005',
      'material': 'Pupuk urea',
      'kategori': 'Pupuk',
      'kuantitas': '4',
      'satuan': 'Kg',
      'lahan': 'Blok A - Malang',
      'vendor': 'PT Subur Sejahtera',
      'pic': 'Yanto Siregar',
    },
    {
      'tanggal': '02-09-2005',
      'material': 'Benih jagung',
      'kategori': 'Benih',
      'kuantitas': '25',
      'satuan': 'Kg',
      'lahan': 'Blok C - Malang',
      'vendor': 'CV Tani Makmur',
      'pic': 'Budi Santoso',
    },
    {
      'tanggal': '08-09-2005',
      'material': 'Pupuk NPK',
      'kategori': 'Pupuk',
      'kuantitas': '10',
      'satuan': 'Kg',
      'lahan': 'Blok A - Malang',
      'vendor': 'UD Sumber Tani',
      'pic': 'Rina Wulandari',
    },
    {
      'tanggal': '15-09-2005',
      'material': 'Herbisida',
      'kategori': 'Pestisida',
      'kuantitas': '8',
      'satuan': 'Liter',
      'lahan': 'Blok D - Malang',
      'vendor': 'PT Agro Lestari',
      'pic': 'Dedi Kurniawan',
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
          Text('Laporan Pengadaan & Aliran Logistik', style: AppTextStyles.heading3Bold),
          const SizedBox(height: 24),
          
          Row(
            children: [
              _buildDropdownFilter('Kategori'),
              const SizedBox(width: 16),
              _buildDropdownFilter('Lahan'),
              const SizedBox(width: 16),
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
                  'Tanggal Belanja', 
                  'Nama Material', 
                  'Kategori', 
                  'Kuantitas Masuk', 
                  'Satuan', 
                  'Lahan', 
                  'Vendor Toko', 
                  'Pembeli / PJ'
                ]),
                Expanded(
                  child: ListView.builder(
                    itemCount: dummyAliranLogistik.length,
                    itemBuilder: (context, index) {
                      final data = dummyAliranLogistik[index];
                      final isLast = index == dummyAliranLogistik.length - 1;
                      
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
                            Expanded(flex: 2, child: Text(data['material'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                            Expanded(flex: 2, child: Text(data['kategori'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                            Expanded(flex: 2, child: Text(data['kuantitas'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                            Expanded(flex: 1, child: Text(data['satuan'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                            Expanded(flex: 2, child: Text(data['lahan'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                            Expanded(flex: 2, child: Text(data['vendor'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                            Expanded(flex: 2, child: Text(data['pic'], style: AppTextStyles.body.copyWith(fontSize: 14))),
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Tanggal', style: TextStyle(color: Colors.grey.shade600)),
          Icon(Icons.calendar_today_outlined, color: Colors.grey.shade600, size: 20),
        ],
      ),
    );
  }

  Widget _buildExportButton() {
    return InkWell(
      onTap: () {

      },
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
          Expanded(flex: 1, child: Text(columns[4], style: AppTextStyles.bodyBold.copyWith(fontSize: 14))),
          Expanded(flex: 2, child: Text(columns[5], style: AppTextStyles.bodyBold.copyWith(fontSize: 14))),
          Expanded(flex: 2, child: Text(columns[6], style: AppTextStyles.bodyBold.copyWith(fontSize: 14))),
          Expanded(flex: 2, child: Text(columns[7], style: AppTextStyles.bodyBold.copyWith(fontSize: 14))),
        ],
      ),
    );
  }
}