import 'package:flutter/material.dart';
import 'package:saa_asset_management_frontend/core/theme.dart';

class LaporanInventarisView extends StatefulWidget {
  const LaporanInventarisView({super.key});

  @override
  State<LaporanInventarisView> createState() => _LaporanInventarisViewState();
}

class _LaporanInventarisViewState extends State<LaporanInventarisView> {
  int _selectedTabIndex = 0; 
  // Dummy Data - Saldo Stok
  final List<Map<String, dynamic>> dummySaldoStok = const [
    {'nama': 'Pupuk urea', 'kategori': 'Pupuk', 'lahan': 'Blok A - Malang', 'awal': '50', 'masuk': '100', 'keluar': '30', 'sisa': '120', 'satuan': 'Kg'},
    {'nama': 'NPK Phonska', 'kategori': 'Pupuk', 'lahan': 'Blok B - Batu', 'awal': '40', 'masuk': '80', 'keluar': '20', 'sisa': '100', 'satuan': 'Kg'},
    {'nama': 'Benih Jagung', 'kategori': 'Benih', 'lahan': 'Blok C - Kediri', 'awal': '25', 'masuk': '60', 'keluar': '15', 'sisa': '70', 'satuan': 'Kg'},
    {'nama': 'Pestisida Cair', 'kategori': 'Pestisida', 'lahan': 'Blok D - Blitar', 'awal': '12', 'masuk': '35', 'keluar': '8', 'sisa': '39', 'satuan': 'Liter'},
  ];

  // Dummy Data - Pemakaian Material
  final List<Map<String, dynamic>> dummyPemakaian = const [
    {'tanggal': '17-08-2005', 'nama': 'Pupuk urea', 'kategori': 'Pupuk', 'jumlah': '4', 'satuan': 'Kg', 'lahan': 'Blok A - Malang', 'aktivitas': 'Pemupukan Rutin', 'pic': 'Yanto Siregar'},
    {'tanggal': '18-08-2005', 'nama': 'NPK 16-16-16', 'kategori': 'Pupuk', 'jumlah': '6', 'satuan': 'Kg', 'lahan': 'Blok B - Malang', 'aktivitas': 'Pemupukan Susulan', 'pic': 'Rina Pratiwi'},
    {'tanggal': '19-08-2005', 'nama': 'Herbisida', 'kategori': 'Pestisida', 'jumlah': '3', 'satuan': 'Liter', 'lahan': 'Blok C - Batu', 'aktivitas': 'Pengendalian Gulma', 'pic': 'Dedi Kurniawan'},
    {'tanggal': '20-08-2005', 'nama': 'Benih Jagung', 'kategori': 'Benih', 'jumlah': '12', 'satuan': 'Kg', 'lahan': 'Blok D - Kediri', 'aktivitas': 'Penanaman Jagung', 'pic': 'Siti Rahma'},
  ];

  // Dummy Data - Selisih Stock Opname
  final List<Map<String, dynamic>> dummySelisih = const [
    {'tanggal': '17-08-2005', 'nama': 'Pupuk urea', 'kategori': 'Pupuk', 'selisih': '4', 'satuan': 'Kg', 'lahan': 'Blok A - Malang', 'alasan': 'Kemasan Robek / Rusak', 'pelapor': 'Yanto Siregar'},
    {'tanggal': '18-08-2005', 'nama': 'Pupuk NPK', 'kategori': 'Pupuk', 'selisih': '2', 'satuan': 'Kg', 'lahan': 'Blok B - Malang', 'alasan': 'Selisih timbang', 'pelapor': 'Siti Aminah'},
    {'tanggal': '19-08-2005', 'nama': 'Benih Jagung', 'kategori': 'Benih', 'selisih': '5', 'satuan': 'Pack', 'lahan': 'Gudang Utama', 'alasan': 'Kemasan terbuka', 'pelapor': 'Budi Santoso'},
    {'tanggal': '20-08-2005', 'nama': 'Pestisida cair', 'kategori': 'Pestisida', 'selisih': '3', 'satuan': 'Liter', 'lahan': 'Blok C - Malang', 'alasan': 'Botol bocor', 'pelapor': 'Rina Wulandari'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteGreen,
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Laporan Inventaris & Mutasi', style: AppTextStyles.heading3Bold),
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

          _buildTabGroup(),
          const SizedBox(height: 24),

          Expanded(
            child: _buildSelectedTable(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabGroup() {
    final List<String> tabs = ['Saldo Stok', 'Pemakaian Material', 'Selisih Stock Opname'];
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(tabs.length, (index) {
          final isActive = _selectedTabIndex == index;
          return InkWell(
            onTap: () => setState(() => _selectedTabIndex = index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isActive ? AppColors.darkgreen : Colors.transparent,
                borderRadius: BorderRadius.horizontal(
                  left: index == 0 ? const Radius.circular(7) : Radius.zero,
                  right: index == tabs.length - 1 ? const Radius.circular(7) : Radius.zero,
                ),
                border: index != tabs.length - 1 ? Border(right: BorderSide(color: Colors.grey.shade400)) : null,
              ),
              child: Text(
                tabs[index],
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.grey.shade600,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  fontSize: 13
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildSelectedTable() {
    if (_selectedTabIndex == 0) {
      return _buildTableLayout(
        headers: ['Nama Material', 'Kategori', 'Lahan', 'Stok Awal', 'Stok Masuk', 'Stok Keluar', 'Sisa Terakhir', 'Satuan'],
        data: dummySaldoStok,
        rowBuilder: (data) => [data['nama'], data['kategori'], data['lahan'], data['awal'], data['masuk'], data['keluar'], data['sisa'], data['satuan']],
      );
    } else if (_selectedTabIndex == 1) {
      return _buildTableLayout(
        headers: ['Tanggal Pakai', 'Nama Material', 'Kategori', 'Jumlah Terpakai', 'Satuan', 'Lahan', 'Aktivitas Terkait', 'Penanggung Jawab'],
        data: dummyPemakaian,
        rowBuilder: (data) => [data['tanggal'], data['nama'], data['kategori'], data['jumlah'], data['satuan'], data['lahan'], data['aktivitas'], data['pic']],
      );
    } else {
      return _buildTableLayout(
        headers: ['Tanggal Lapor', 'Nama Material', 'Kategori', 'Jumlah Selisih', 'Satuan', 'Lahan', 'Alasan', 'Pelapor'],
        data: dummySelisih,
        rowBuilder: (data) => [data['tanggal'], data['nama'], data['kategori'], data['selisih'], data['satuan'], data['lahan'], data['alasan'], data['pelapor']],
      );
    }
  }

  Widget _buildTableLayout({required List<String> headers, required List<Map<String, dynamic>> data, required List<String> Function(Map<String, dynamic>) rowBuilder}) {
    return Column(
      children: [
        _buildTableHeader(headers),
        Expanded(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final rowData = rowBuilder(data[index]);
              final isLast = index == data.length - 1;
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: isLast ? const BorderRadius.vertical(bottom: Radius.circular(8)) : BorderRadius.zero,
                  border: Border(
                    left: BorderSide(color: Colors.grey.shade300),
                    right: BorderSide(color: Colors.grey.shade300),
                    bottom: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                child: Row(
                  children: rowData.map((text) => Expanded(flex: 2, child: Text(text, style: AppTextStyles.body.copyWith(fontSize: 14)))).toList(),
                ),
              );
            },
          ),
        ),
      ],
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
        children: columns.map((col) => Expanded(flex: 2, child: Text(col, style: AppTextStyles.bodyBold.copyWith(fontSize: 14)))).toList(),
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
        children: [Text('Tanggal', style: TextStyle(color: Colors.grey.shade600)), Icon(Icons.calendar_today_outlined, color: Colors.grey.shade600, size: 20)],
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
}