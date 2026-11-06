import 'package:flutter/material.dart';
import 'package:saa_asset_management_frontend/core/theme.dart';

class LaporanPemeliharaanView extends StatelessWidget {
  LaporanPemeliharaanView({super.key});

  final List<Map<String, dynamic>> dummyPemeliharaan = [
    {
      'nama_barang': 'Traktor Kubota L3200',
      'lokasi': 'Blok A - Malang',
      'kondisi_saat_ini': 'Baik',
      'update_terakhir': '17-08-2005',
      'inspeksi': [
        {'tanggal': '17-08-2005', 'kondisi': 'Baik', 'catatan': 'Mesin hidup normal, oli cukup.'},
        {'tanggal': '18-08-2005', 'kondisi': 'Rusak Ringan', 'catatan': 'Busi kotor, sudah dibersihkan mekanik.'},
      ]
    },
    {
      'nama_barang': 'Excavator Komatsu PC200',
      'lokasi': 'Blok B - Surabaya',
      'kondisi_saat_ini': 'Perlu Servis',
      'update_terakhir': '22-08-2010',
      'inspeksi': []
    },
    {
      'nama_barang': 'Bulldozer Caterpillar D6',
      'lokasi': 'Blok C - Kediri',
      'kondisi_saat_ini': 'Baik',
      'update_terakhir': '11-03-2012',
      'inspeksi': []
    },
    {
      'nama_barang': 'Wheel Loader Volvo L90H',
      'lokasi': 'Blok D - Sidoarjo',
      'kondisi_saat_ini': 'Baik',
      'update_terakhir': '09-11-2014',
      'inspeksi': []
    },
    {
      'nama_barang': 'Motor Grader Komatsu GD655',
      'lokasi': 'Blok E - Pasuruan',
      'kondisi_saat_ini': 'Dalam Perbaikan',
      'update_terakhir': '27-01-2016',
      'inspeksi': []
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
          Text('Laporan Pemeliharaan & Kondisi Aset', style: AppTextStyles.heading3Bold),
          const SizedBox(height: 24),
          
          Row(
            children: [
              _buildDropdownFilter('Kondisi'),
              const SizedBox(width: 16),
              _buildDropdownFilter('Lahan'),
              const SizedBox(width: 16),
              _buildDateFilter(),
              const Spacer(),
              _buildExportButton(),
            ],
          ),
          const SizedBox(height: 24),

          _buildTableHeader(),
          
          Expanded(
            child: ListView.builder(
              itemCount: dummyPemeliharaan.length,
              itemBuilder: (context, index) {
                final data = dummyPemeliharaan[index];
                final isLastItem = index == dummyPemeliharaan.length - 1; 
                return ExpandablePemeliharaanRow(data: data, isLast: isLastItem);
              },
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
      decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.grey.shade400), borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(hint, style: TextStyle(color: Colors.grey.shade600)), Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade600)],
      ),
    );
  }

  Widget _buildDateFilter() {
    return Container(
      width: 160,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.grey.shade400), borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text('Tanggal', style: TextStyle(color: Colors.grey.shade600, fontSize: 13)), Icon(Icons.calendar_today_outlined, color: Colors.grey.shade600, size: 16)],
      ),
    );
  }

  Widget _buildExportButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(color: AppColors.darkgreen, borderRadius: BorderRadius.circular(8)),
        child: const Row(
          children: [Text('Export', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)), SizedBox(width: 8), Icon(Icons.file_upload_outlined, color: Colors.white, size: 18)],
        ),
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
      ),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text('Nama Barang', style: AppTextStyles.bodyBold.copyWith(fontSize: 13))),
          Expanded(flex: 2, child: Text('Lokasi', style: AppTextStyles.bodyBold.copyWith(fontSize: 13))),
          Expanded(flex: 2, child: Text('Kondisi Saat Ini', style: AppTextStyles.bodyBold.copyWith(fontSize: 13))),
          Expanded(flex: 2, child: Text('Update Terakhir', style: AppTextStyles.bodyBold.copyWith(fontSize: 13))),
          const SizedBox(width: 24), 
        ],
      ),
    );
  }
}

class ExpandablePemeliharaanRow extends StatefulWidget {
  final Map<String, dynamic> data;
  final bool isLast;

  const ExpandablePemeliharaanRow({super.key, required this.data, this.isLast = false});

  @override
  State<ExpandablePemeliharaanRow> createState() => _ExpandablePemeliharaanRowState();
}

class _ExpandablePemeliharaanRowState extends State<ExpandablePemeliharaanRow> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final List<dynamic> inspeksi = widget.data['inspeksi'] ?? [];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: widget.isLast ? const BorderRadius.vertical(bottom: Radius.circular(8)) : BorderRadius.zero,
        border: Border(
          left: BorderSide(color: Colors.grey.shade300),
          right: BorderSide(color: Colors.grey.shade300),
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Row(
                children: [
                  Expanded(flex: 2, child: Text(widget.data['nama_barang'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                  Expanded(flex: 2, child: Text(widget.data['lokasi'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                  Expanded(flex: 2, child: Text(widget.data['kondisi_saat_ini'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                  Expanded(flex: 2, child: Text(widget.data['update_terakhir'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                  Icon(_isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, color: Colors.grey.shade600),
                ],
              ),
            ),
          ),

          if (_isExpanded && inspeksi.isNotEmpty)
            Container(
              margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 8),
              padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
              decoration: BoxDecoration(
                color: Colors.white, 
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300)
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(flex: 2, child: Text('Tanggal Inspeksi', style: AppTextStyles.bodyBold.copyWith(fontSize: 14))),
                      Expanded(flex: 2, child: Text('Kondisi', style: AppTextStyles.bodyBold.copyWith(fontSize: 14))),
                      Expanded(flex: 4, child: Text('Catatan Fisik', style: AppTextStyles.bodyBold.copyWith(fontSize: 14))),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Divider(height: 1, color: Colors.black12),
                  ),
                  
                  ...inspeksi.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                        children: [
                          Expanded(flex: 2, child: Text(item['tanggal'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                          Expanded(flex: 2, child: Text(item['kondisi'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                          Expanded(flex: 4, child: Text(item['catatan'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
            
          if (_isExpanded && inspeksi.isEmpty)
             const Padding(
               padding: EdgeInsets.only(bottom: 24.0),
               child: Text('Belum ada log inspeksi untuk aset ini.', style: TextStyle(color: Colors.grey)),
             )
        ],
      ),
    );
  }
}